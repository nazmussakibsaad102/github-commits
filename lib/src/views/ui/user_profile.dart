import 'package:flutter/material.dart';

import '../utils/colors.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhiteColor,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
          child: Container(
            width: size.width,
            color: kWhiteColor,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width / 20),
              child: Column(
                children: [],
              ),
            ),
          )),
    );
  }
}
