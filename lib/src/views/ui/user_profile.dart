import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_commits/src/business_logics/providers/user_profile_provider.dart';
import 'package:github_commits/src/views/utils/custom_text_styles.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    UserProfileProvider userProfileProvider =
        Provider.of<UserProfileProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await userProfileProvider.getUserProfile();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProfileProvider userProfileProvider =
        Provider.of<UserProfileProvider>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kThemeColor,
        body: RefreshIndicator(
          onRefresh: _pullRefresh,
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 16.0,
                color: kSemiDarkThemeColor,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    color: kThemeColor,
                    child: userProfileProvider.inProgress
                        ? Column(
                            children: [
                              SizedBox(
                                height: size.width / 4,
                              ),
                              const CircularProgressIndicator(
                                color: kWhiteColor,
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              const SizedBox(height: 30.0),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: CachedNetworkImage(
                                  height: 168.0,
                                  width: 168.0,
                                  fit: BoxFit.fill,
                                  imageUrl: userProfileProvider
                                          .userProfileResponse?.avatarUrl ??
                                      "",
                                  placeholder: (context, url) => Image.asset(
                                    "assets/images/card_placeholder.png",
                                    height: 168,
                                    width: 168,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                userProfileProvider.userProfileResponse?.name ??
                                    "",
                                textAlign: TextAlign.center,
                                style: kLargeTitleTextStyle,
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                "@${userProfileProvider.userProfileResponse?.login}",
                                textAlign: TextAlign.center,
                                style: kMediumGreyTextStyle,
                              ),
                              const SizedBox(height: 16.0),
                              SizedBox(
                                width: 151.0,
                                child: Text(
                                  "Bio: ${userProfileProvider.userProfileResponse?.bio??"n/a"}",
                                  textAlign: TextAlign.center,
                                  style: kTitleTextStyle,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Text(
                                "Public Repos: ${userProfileProvider.userProfileResponse?.publicRepos}",
                                textAlign: TextAlign.center,
                                style: kTitleTextStyle,
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                "Public Gists: ${userProfileProvider.userProfileResponse?.publicGists}",
                                textAlign: TextAlign.center,
                                style: kTitleTextStyle,
                              ),
                              const SizedBox(height: 8.0),
                              const Text(
                                "Private Repos: 5",
                                textAlign: TextAlign.center,
                                style: kTitleTextStyle,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    UserProfileProvider userProfileProvider =
        Provider.of<UserProfileProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await userProfileProvider.getUserProfile();
    });
  }
}
