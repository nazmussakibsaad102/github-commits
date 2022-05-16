import 'dart:convert';
import 'package:github_commits/src/business_logics/models/user_profile_response_model.dart';
import 'package:http/http.dart' as http;
import '../../business_logics/models/api_response_object.dart';
import '../../business_logics/utils/constants.dart';

class UserProfileAPIService {

  Future<ResponseObject> getUserProfile() async {
    try {
      Uri uri = Uri.parse('$baseURL/users/nazmussakibsaad102');
      final request = http.Request("GET", uri);
      // header data for api
      request.headers['Content-Type'] = 'application/json';
      request.headers['Accept'] = 'application/json';

      final response = await request.send();
      final responseData = await response.stream.transform(utf8.decoder).join();
      var decodedJson = json.decode(responseData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var userProfileModel =
        UserProfileResponseModel.fromJson(decodedJson);
        return ResponseObject(
            id: ResponseCode.successful, object: userProfileModel);
      } else {
        return ResponseObject(id: ResponseCode.failed, object: Object());
      }
    } catch (e) {
      return ResponseObject(id: ResponseCode.failed, object: Object());
    }
  }
}
