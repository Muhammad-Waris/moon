import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/apppadding.dart';
import '../../constants/svgicons.dart';
import '../../widgets/app_text.dart';
import 'NextScreenChat.dart';

class Profile2 extends StatefulWidget {
  final List<dynamic>? imageUrls;
  final String? name;
  final String? intro;
  final String? uid;
  final String? know;
  final String? dateofBirth;

  const Profile2(
      {Key? key,
      this.imageUrls,
      this.name,
      this.intro,
      this.uid,
      this.know,
      this.dateofBirth})
      : super(key: key);

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  void navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NextScreenChat(
          imageUrls: widget.imageUrls,
          name: widget.name,
          uid: widget.uid,
        ),
      ),
    );
  }

  int followerCount = 0;
  bool isFollowed = false; // Track follow state

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrlList = (widget.imageUrls ?? []).cast<String>();
    return Scaffold(
      body: Padding(
        padding: AppPadding.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: widget.name ?? "",
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xff1E233A),
                            )),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xff1E233A),
                            )),
                        child: Center(
                          child: SvgPicture.string(SvgIcons.setting),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    imageUrlList.isNotEmpty
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(
                              imageUrlList[0],
                            ),
                            radius: 39,
                          )
                        : Image.asset("assets/tikprofile.png"),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: const Color(0xff0F121D),
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xff343952))),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    AppText(text: "15"),
                    AppText(
                      text: "posts",
                      fontSize: 12,
                    )
                  ],
                ),
                Column(
                  children: [
                    AppText(
                        text: followerCount
                            .toString()), // Display the follower count
                    const AppText(
                      text: "Follower",
                      fontSize: 12,
                    )
                  ],
                ),
                const Column(
                  children: [
                    AppText(text: "15"),
                    AppText(
                      text: "Following",
                      fontSize: 12,
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                AppText(
                  text: widget.name ?? "",
                  fontSize: 16,
                ),
              ],
            ),
            AppText(
              text: widget.intro ?? "",
              fontSize: 12,
            ),
            const AppText(
              text: "Biografie",
              fontSize: 12,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: AppText(
                text: "Germany, Dresden",
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 29,
              width: MediaQuery.of(context).size.width * 0.23,
              decoration: BoxDecoration(
                  color: const Color(0xff343952),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: AppText(text: "#Trance"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFollowed = !isFollowed; // Toggle the follow state
                      if (isFollowed) {
                        followerCount++; // Increase the follower count
                      } else {
                        followerCount--; // Decrease the follower count
                      }
                    });
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.40,
                    decoration: BoxDecoration(
                      color: const Color(0xff343952),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: AppText(
                        text: isFollowed ? "Followed" : "Follow",
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: navigateToNextScreen,
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.40,
                    decoration: BoxDecoration(
                        color: const Color(0xff343952),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                      child: AppText(text: "Message"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
