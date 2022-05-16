import 'package:flutter/material.dart';
import 'package:github_commits/src/business_logics/models/user_profile_response_model.dart';
import 'package:logger/logger.dart';
import '../../services/repository.dart';
import '../models/api_response_object.dart';

class UserProfileProvider extends ChangeNotifier {
  bool _isAccepted = false, _inProgress = false, _isError = false;
  final Logger _logger = Logger();
  UserProfileResponseModel? _userProfileResponseModel;

  bool get inProgress => _inProgress;

  bool get isAccepted => _isAccepted;

  set isAccepted(value) => _isAccepted = value;

  bool get isError => _isError;

  UserProfileResponseModel? get userProfileResponse => _userProfileResponseModel;

  Future<bool> getUserProfile() async {
    _inProgress = true;
    notifyListeners();
    final response = await repository.getUserProfile();
    // print(_response);
    _logger.i("response code:${response.id}");
    if (response.id == ResponseCode.successful) {
      _inProgress = false;
      _userProfileResponseModel = response.object as UserProfileResponseModel;
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
