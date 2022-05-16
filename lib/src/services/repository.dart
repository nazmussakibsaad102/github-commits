import 'package:github_commits/src/services/api_services/commit_api_service.dart';
import 'package:github_commits/src/services/api_services/user_profile_api_service.dart';
import '../business_logics/models/api_response_object.dart';

final repository = _Repository();

class _Repository {
  final CommitAPIService _commitAPIServices = CommitAPIService();
  final UserProfileAPIService _userProfileAPIServices = UserProfileAPIService();

  Future<ResponseObject> getCommitList() => _commitAPIServices.getCommitList();
  Future<ResponseObject> getUserProfile() => _userProfileAPIServices.getUserProfile();
}
