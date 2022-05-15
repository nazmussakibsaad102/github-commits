import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_commits/src/views/utils/custom_text_styles.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: kThemeColor,
        body: Column(
          children: [
            Container(width: size.width,height: 16.0,color: kSemiDarkThemeColor,),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                color: kThemeColor,
                child: Column(
                  children: [
                    const SizedBox(height: 30.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: CachedNetworkImage(
                        height: 168,
                        width: 168,
                        fit: BoxFit.fill,
                        imageUrl: "https://picsum.photos/id/32/250/300?grayscale",
                        placeholder: (context, url) => Image.asset(
                          "assets/images/card_placeholder.png",
                          height: 168,
                          width: 168,
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text("Francisco Miles",textAlign: TextAlign.center,style: kLargeTitleTextStyle,),
                    const SizedBox(height: 4.0),
                    const Text("@fransico_miles",textAlign: TextAlign.center,style: kMediumGreyTextStyle,),
                    const SizedBox(height: 16),
                    const Text("Bio: There once was...",textAlign: TextAlign.center,style: kTitleTextStyle,maxLines:1,overflow: TextOverflow.ellipsis,),
                    const SizedBox(height: 16),
                    const Text("Public Repos: 2",textAlign: TextAlign.center,style: kTitleTextStyle,),
                    const SizedBox(height: 8),
                    const Text("Public Gists: 5",textAlign: TextAlign.center,style: kTitleTextStyle,),
                    const SizedBox(height: 8),
                    const Text("Private Repos: 5",textAlign: TextAlign.center,style: kTitleTextStyle,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}