import 'package:flutter/material.dart';
import 'package:github_commits/src/views/utils/custom_text_styles.dart';
import '../ui/commits.dart';
import '../ui/user_profile.dart';

import '../utils/colors.dart';

class Navigation extends StatefulWidget {
  final int selectedIndex;

  const Navigation({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // late ProfileProvider profileProvider;
  int _selectedIndex = 0;
  String? phoneNo;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kDarkThemeColor,
      bottomNavigationBar: Container(
        height: 63.0,
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: kDarkThemeColor,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: (_selectedIndex == 0)
                  ? Image.asset(
                      "assets/images/git_commit_logo.png",
                      height: size.width / 15,
                      width: size.width / 15,
                    )
                  : Image.asset(
                      "assets/images/git_commit_logo.png",
                      color: kDarkBlueColor,
                      height: size.width / 15,
                      width: size.width / 15,
                    ),
              label: 'Commits',
            ),
            BottomNavigationBarItem(
              icon: (_selectedIndex == 1)
                  ? Image.asset(
                      "assets/images/user_logo.png",
                      height: size.width / 15,
                      width: size.width / 15,
                    )
                  : Image.asset(
                      "assets/images/user_logo.png",
                      color: kDarkBlueColor,
                      height: size.width / 15,
                      width: size.width / 15,
                    ),
              label: 'User Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kBlueColor,
          unselectedItemColor: kDarkBlueColor,
          selectedLabelStyle:
              kBottomNavTextStyle,
          unselectedLabelStyle:
              kBottomNavTextStyle,
          onTap: _onItemTapped,
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const <Widget>[
          Commits(),
          UserProfile(),
        ],
      ),
    );
  }
}
