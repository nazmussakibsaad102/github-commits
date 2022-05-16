import 'dart:convert';
import 'package:github_commits/src/business_logics/models/commit_response_model.dart';
import 'package:http/http.dart' as http;
import '../../business_logics/models/api_response_object.dart';
import '../../business_logics/utils/constants.dart';

class CommitAPIService {

  Future<ResponseObject> getCommitList() async {
    try {
      Uri uri = Uri.parse('$baseURL/repos/flutter/flutter/commits?sha=master&per_page=100');
      final request = http.Request("GET", uri);
      request.headers['Content-Type'] = 'application/json';
      request.headers['Accept'] = 'application/json';

      final response = await request.send();
      final responseData = await response.stream.transform(utf8.decoder).join();
      var decodedJson = json.decode(responseData);
      var filteredList = decodedJson as Iterable;
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
        var commitResponseModel =
            AllCommitsResponseModel.fromJson(filteredList.toList());
        return ResponseObject(
            id: ResponseCode.successful, object: commitResponseModel);
      } else {
        return ResponseObject(id: ResponseCode.failed, object: Object());
      }
    } catch (e) {
      return ResponseObject(id: ResponseCode.failed, object: Object());
    }
  }
}
