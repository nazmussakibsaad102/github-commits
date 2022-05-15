import 'package:flutter/material.dart';
import 'package:github_commits/src/business_logics/providers/commit_provider.dart';
import 'package:github_commits/src/views/utils/custom_text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/colors.dart';

class Commits extends StatefulWidget {
  const Commits({Key? key}) : super(key: key);

  @override
  CommitsState createState() => CommitsState();
}

class CommitsState extends State<Commits> {
  @override
  void initState() {
    CommitProvider commitProvider =
        Provider.of<CommitProvider>(context, listen: false);
    if ((commitProvider.isAccepted) == false) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await commitProvider.getCommitList();
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CommitProvider commitProvider = Provider.of<CommitProvider>(context);
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
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  color: kThemeColor,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 11.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Flutter Commit List ",
                            style: kTitleTextStyle,
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: kDarkGreyColor,
                                borderRadius: BorderRadius.circular(26.0)),
                            child: const Text(
                              "master",
                              style: kTitleTextStyle,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 11.0,
                      ),
                      commitProvider.inProgress
                          ? Expanded(
                              child: ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: double.infinity,
                                      height: 100.0,
                                      child: Shimmer.fromColors(
                                        baseColor: kThemeColor,
                                        highlightColor: kLightThemeColor,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: kLightGreyColor,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (_, __) => const Divider(
                                        color: kLightThemeColor,
                                        thickness: 1.0,
                                      ),
                                  itemCount: 10),
                            )
                          : Expanded(
                              child: ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return SingleCommit(
                                      size: size,
                                      commitMessage: commitProvider
                                              .allCommitResponse
                                              ?.commits?[index]
                                              .commit
                                              ?.message ??
                                          "",
                                      commitTime: commitProvider
                                              .allCommitResponse
                                              ?.commits?[index]
                                              .commit
                                              ?.committer
                                              ?.date ??
                                          "",
                                      authorImg: commitProvider
                                              .allCommitResponse
                                              ?.commits?[index]
                                              .authorImg
                                              ?.avatarUrl ??
                                          "",
                                      authorName: commitProvider
                                              .allCommitResponse
                                              ?.commits?[index]
                                              .commit
                                              ?.author
                                              ?.name ??
                                          "",
                                    );
                                  },
                                  separatorBuilder: (_, __) => const Divider(
                                        color: kLightThemeColor,
                                        thickness: 1.0,
                                      ),
                                  itemCount: 10),
                            ),
                      const SizedBox(
                        height: 11.0,
                      ),
                    ],
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
    CommitProvider commitProvider =
        Provider.of<CommitProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await commitProvider.getCommitList();
    });
  }
}

class SingleCommit extends StatelessWidget {
  const SingleCommit({
    Key? key,
    required this.size,
    required this.commitMessage,
    required this.commitTime,
    required this.authorImg,
    required this.authorName,
  }) : super(key: key);

  final Size size;
  final String commitMessage;
  final String commitTime;
  final String authorImg;
  final String authorName;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  getFirstLine(commitMessage),
                  style: kSubtitleTextStyle,
                )),
                Text(
                  commitTime,
                  style: kGreyTextStyle,
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: CachedNetworkImage(
                    height: 20,
                    width: 20,
                    fit: BoxFit.fill,
                    imageUrl: authorImg,
                    placeholder: (context, url) => Image.asset(
                      "assets/images/card_placeholder.png",
                      height: 20,
                      width: 20,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  authorName,
                  style: kGreyTextStyle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  getFirstLine(String message) {
    List firstLine = message.split("\n");
    return firstLine.first;
  }
}
