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
    return Scaffold(
      backgroundColor: kThemeColor,
      body: Container(
        color: kThemeColor,
        padding: EdgeInsets.symmetric(horizontal: 13.0,vertical: 55.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Flutter Commit List ",style: kTitleTextStyle,),
                SizedBox(width: 16.0,),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: kDarkGreyColor,
                    borderRadius: BorderRadius.circular(26.0)
                  ),
                  child: Text("master",style: kTitleTextStyle,),
                )
              ],
            ),
            SizedBox(height: 11.0,),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SingleCommit(
                      size: size,
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(color: kLightThemeColor,thickness: 2.0,),
                  itemCount: 10),
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
      child: Column(
        children: [
          SizedBox(height: 13,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Fix All Bugs",style: kTitleTextStyle,),
              Text("18:14",style: kGreyTextStyle,)
            ],
          ),
          SizedBox(height: 8,),
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
              SizedBox(width: 8.0,),
              Text("Francisco Miles",style: kGreyTextStyle,),
              SizedBox(height: 16.0,),
            ],
          )


        ],
      ),
    );
  }
}
