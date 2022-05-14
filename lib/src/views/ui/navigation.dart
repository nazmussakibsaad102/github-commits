import 'package:flutter/material.dart';
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
  final List<Widget> _widgetOptions = <Widget>[
    const Commits(),
    const UserProfile(),
  ];
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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: kLightGreyColor, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: SizedBox(
          height: 70,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: (_selectedIndex == 0)
                      ? Image.asset("assets/images/git_commit_logo.png",height: size.width/15,width: size.width/15,)
                      : Image.asset("assets/images/git_commit_logo.png",color: kBlackColor,height: size.width/15,width: size.width/15,),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: (_selectedIndex == 1)
                      ? Image.asset("assets/images/user_logo.png",height: size.width/15,width: size.width/15,)
                      : Image.asset("assets/images/user_logo.png",color: kBlackColor,height: size.width/15,width: size.width/15,),
                  label: 'Chat',
                ),
              ],
              currentIndex: _selectedIndex,
              fixedColor: kThemeColor,
              iconSize: 28,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
