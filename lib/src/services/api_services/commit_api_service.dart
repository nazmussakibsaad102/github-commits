import 'dart:convert';
import 'package:github_commits/src/business_logics/models/commit_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../../business_logics/models/api_response_object.dart';
import '../../business_logics/utils/constants.dart';

class CommitAPIService {
  final Logger _logger = Logger();

  Future<ResponseObject> getCommitList() async {
    try {
      Uri uri = Uri.parse('$baseURL/repos/flutter/flutter/commits?sha=master&per_page=100');
      _logger.i(uri);
      final request = http.Request("GET", uri);
      // header data for api
      request.headers['Content-Type'] = 'application/json';
      request.headers['Accept'] = 'application/json';
      //
      // _logger.v(request.body);

      final response = await request.send();
      final responseData = await response.stream.transform(utf8.decoder).join();
      var decodedJson = json.decode(responseData);
      var filteredList = decodedJson as Iterable;
      _logger.i("before filtering $decodedJson");
      if (response.statusCode == 200 || response.statusCode == 201) {
        filteredList = decodedJson.where((element) =>
            !element["commit"]["author"]["name"]
                .toString()
                .toLowerCase()
                .contains("x") &&
            !element["commit"]["author"]["name"]
                .toString()
                .toLowerCase()
                .contains("g"));
        _logger.d("Filtered List is $filteredList");
        var commitResponseModel =
            AllCommitsResponseModel.fromJson(filteredList.toList());
        return ResponseObject(
            id: ResponseCode.successful, object: commitResponseModel);
      } else {
        return ResponseObject(id: ResponseCode.failed, object: Object());
      }
    } catch (e) {
      _logger.d(e.toString());
      return ResponseObject(id: ResponseCode.failed, object: Object());
    }
  }
}
