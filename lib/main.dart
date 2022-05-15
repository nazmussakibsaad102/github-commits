import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_commits/src/app.dart';
import 'package:github_commits/src/services/shared_preference_services/shared_preference_services.dart';
import 'package:github_commits/src/views/utils/colors.dart';
void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: kSemiDarkThemeColor,
          statusBarIconBrightness: Brightness.light
      )
  );


  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsServices.init();

  runApp(const MyApp());
}