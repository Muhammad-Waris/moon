import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/views/community_tab/group_info.dart';
import 'package:moon/widgets/app_input_field.dart';
import 'package:moon/widgets/app_text.dart';

import '../../constants/appcolors.dart';
import '../../constants/svgicons.dart';
import '../../services/group.dart';

class InboxCommunityPublic extends StatefulWidget {
  const InboxCommunityPublic({Key? key});

  @override
  _InboxCommunityPublicState createState() => _InboxCommunityPublicState();
}

class _InboxCommunityPublicState extends State<InboxCommunityPublic> {
  final TextEditingController _textEditingController = TextEditingController();
  final FirebaseServiceGroup _firebaseService = FirebaseServiceGroup();
  List<String> messages = [];

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage(String message) async {
    if (message.trim().isNotEmpty) {
      await _firebaseService.sendMessage(message);
      _textEditingController.clear();
      setState(() {
        messages.add(message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: const BoxDecoration(
                color: Color(0xff1E222E),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 36, 35, 35),
                    blurRadius: 2,
                  )
                ],
              ),
              child: SvgPicture.string(SvgIcons.backbutton),
            ),
          ),
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GroupInfopublic()),
            );
          },
          child: Row(
            children: [
              Container(
                height: 44,
                width: 44,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Tachno Invasion",
                    fontSize: 14,
                  ),
                  AppText(
                    text: "376 Participants",
                    fontSize: 12,
                    color: Color(0xff9496A5),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xff1E233A),
                ),
              ),
              child: GestureDetector(
                onTap: () {},
                child: const Center(
                  child: Icon(
                    Icons.more_vert_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.defaultPadding,
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Divider(
                  color: Color(0xff1E233A),
                  thickness: 1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 33,
                width: MediaQuery.of(context).size.width * 0.28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff1E233A),
                ),
                child: const Center(
                  child: AppText(
                    text: "Yesterday",
                    fontSize: 12,
                    color: Color(0xff9496A5),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.50,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        topLeft: Radius.circular(1),
                      ),
                      border: Border.all(
                        color: const Color(0xff1E233A),
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            bottom: 20,
                            top: 15,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.22,
                            child: const AppText(
                              text: "Wohoo",
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 11,
              ),
              const Row(
                children: [
                  AppText(
                    text: "09:22",
                    color: Color(0xff9496A5),
                    fontSize: 12,
                  ),
                ],
              ),
              const SizedBox(
                height: 145,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.50,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              topLeft: Radius.circular(1),
                            ),
                            border: Border.all(
                              color: const Color(0xff1E233A),
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  bottom: 20,
                                  top: 15,
                                ),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.22,
                                  child: AppText(
                                    text: messages[index],
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 11,
              ),
              const Row(
                children: [
                  AppText(
                    text: "09:22",
                    color: Color(0xff9496A5),
                    fontSize: 12,
                  ),
                ],
              ),
              const SizedBox(
                height: 145,
              ),
              AppInputField(
                hintText: "You can't send messages here...",
                controller: _textEditingController,
                suffixIcon: GestureDetector(
                  onTap: () => _sendMessage(_textEditingController.text),
                  child: const Icon(
                    Icons.send_rounded,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
