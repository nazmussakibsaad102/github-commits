import 'package:github_commits/src/services/api_services/commit_api_services.dart';
import '../business_logics/models/api_response_object.dart';

final repository = _Repository();

class _Repository {
  final CommitAPIServices _commitAPIServices = CommitAPIServices();

  Future<ResponseObject> getCommitList() => _commitAPIServices.getCommitList();
}
