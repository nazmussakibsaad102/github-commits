import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_commits/src/app.dart';
import 'package:github_commits/src/business_logics/providers/commit_provider.dart';
import 'package:github_commits/src/services/shared_preference_services/shared_preference_services.dart';
import 'package:github_commits/src/views/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kSemiDarkThemeColor,
      statusBarIconBrightness: Brightness.light));

  final List<ChangeNotifierProvider> providerList = [
    ChangeNotifierProvider<CommitProvider>(create: (_) => CommitProvider()),
  ];

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsServices.init();

  runApp(MultiProvider(providers: providerList, child: const MyApp()));
}
