import 'package:flutter/material.dart';

import '../utils/colors.dart';

class Commits extends StatefulWidget {
  const Commits({Key? key}) : super(key: key);

  @override
  CommitsState createState() => CommitsState();
}

class CommitsState extends State<Commits> {

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
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/home_cover.png",
                  fit: BoxFit.contain,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width / 20),
                  child: Column(
                    children: [

                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
