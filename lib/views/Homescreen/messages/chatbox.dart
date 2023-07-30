import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/widgets/app_input_field.dart';

import '../../../constants/appcolors.dart';
import '../../../constants/svgicons.dart';
import '../../../services/chat_services.dart';
import '../../../widgets/app_text.dart';

class Chatbox extends StatefulWidget {
  const Chatbox({Key? key});

  @override
  _ChatboxState createState() => _ChatboxState();
}

class _ChatboxState extends State<Chatbox> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseService _firebaseService = FirebaseService();
  final TextEditingController _textEditingController = TextEditingController();
  late Stream<QuerySnapshot> _messagesStream;

  @override
  void initState() {
    super.initState();
    _messagesStream = _firebaseService.getMessages();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage(String uid, String message) async {
    if (message.trim().isNotEmpty) {
      await _firebaseService.sendMessage(uid, message);
      _textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

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
                    ]),
                child: SvgPicture.string(SvgIcons.backbutton)),
          ),
        ),
        title: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                    height: 44,
                    width: 44,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Image.asset("assets/profile.png")),
                Padding(
                  padding: const EdgeInsets.only(right: 2, top: 2),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 6,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: "Jacob Jones",
                  fontSize: 14,
                ),
                AppText(
                  text: "Online",
                  fontSize: 12,
                  color: Color(0xff9496A5),
                )
              ],
            ),
          ],
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
                  )),
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
      body: Padding(
        padding: AppPadding.defaultPadding,
        child: Column(
          children: [
            // ... existing code ...
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _messagesStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final messages = snapshot.data!.docs;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message =
                            messages[index].data() as Map<String, dynamic>;
                        final uid = message['uid'] as String;
                        final messageText = message['message'] as String;

                        // Determine the alignment of the message based on the UID
                        final messageAlignment = uid == user!.uid
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.end;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment:
                                messageAlignment == CrossAxisAlignment.start
                                    ? MainAxisAlignment.start
                                    : MainAxisAlignment.end,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    topLeft: Radius.circular(1),
                                  ),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 197, 202, 223),
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal: 10.0,
                                  ),
                                  child: AppText(
                                    text: messageText,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Error retrieving messages');
                  }

                  return const CircularProgressIndicator();
                },
              ),
            ),

            // ... existing code ...

            AppInputField(
              hintText: 'Type a Message',
              prefixIcon: const Icon(Icons.emoji_emotions_outlined),
              suffixIcon: GestureDetector(
                onTap: () =>
                    _sendMessage(user!.uid, _textEditingController.text),
                child: const Icon(
                  Icons.send_rounded,
                  color: AppColors.primaryColor,
                ),
              ),
              controller: _textEditingController,
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
