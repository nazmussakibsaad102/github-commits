import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../src/views/ui/navigation.dart';
import '../src/views/utils/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF333333, primaryColorMap),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      home:  const  Navigation(selectedIndex:0),
    );
  }
}
