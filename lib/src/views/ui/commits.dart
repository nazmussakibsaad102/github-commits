import 'package:flutter/material.dart';
import 'package:github_commits/src/views/utils/custom_text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
                    const SizedBox(height: 11.0,),
                    Row(
                      children: [
                        const Text("Flutter Commit List ",style: kTitleTextStyle,),
                        const SizedBox(width: 16.0,),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: kDarkGreyColor,
                            borderRadius: BorderRadius.circular(26.0)
                          ),
                          child: const Text("master",style: kTitleTextStyle,),
                        )
                      ],
                    ),
                    const SizedBox(height: 11.0,),
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return SingleCommit(
                              size: size,
                            );
                          },
                          separatorBuilder: (_, __) => const Divider(color: kLightThemeColor,thickness: 1.0,),
                          itemCount: 10),
                    ),
                    const SizedBox(height: 11.0,),
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
class SingleCommit extends StatelessWidget {
  const SingleCommit({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Fix All Bugs",style: kSubtitleTextStyle,),
                Text("18:14",style: kGreyTextStyle,)
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: CachedNetworkImage(
                    height: 20,
                    width: 20,
                    fit: BoxFit.fill,
                    imageUrl: "https://picsum.photos/id/32/250/300?grayscale",
                    placeholder: (context, url) => Image.asset(
                      "assets/images/card_placeholder.png",
                      height: 20,
                      width: 20,
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                const SizedBox(width: 8.0,),
                const Text("Francisco Miles",style: kGreyTextStyle,),
              ],
            )


          ],
        ),
      ),
    );
  }
}
