import 'package:flutter/material.dart';
import 'package:github_commits/src/business_logics/models/commit_response_model.dart';
import '../../services/repository.dart';
import '../models/api_response_object.dart';

class CommitProvider extends ChangeNotifier {
  bool _isAccepted = false, _inProgress = false, _isError = false;
  AllCommitsResponseModel? _allCommitsResponseModel;

  bool get inProgress => _inProgress;

  bool get isAccepted => _isAccepted;

  set isAccepted(value) => _isAccepted = value;

  bool get isError => _isError;

  AllCommitsResponseModel? get allCommitResponse => _allCommitsResponseModel;

  Future<bool> getCommitList() async {
    _inProgress = true;
    notifyListeners();
    final response = await repository.getCommitList();
    if (response.id == ResponseCode.successful) {
      _inProgress = false;
      _allCommitsResponseModel = response.object as AllCommitsResponseModel;
      notifyListeners();
      return true;
    } else {
      _inProgress = false;
      _isError = true;
      notifyListeners();
      return false;
    }
  }
}
