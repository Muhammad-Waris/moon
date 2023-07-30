import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moon/constants/appcolors.dart';

import '../../constants/svgicons.dart';
import '../../widgets/app_text.dart';

class NextScreenChat extends StatefulWidget {
  final List<dynamic>? imageUrls;
  final String? name;
  final String? uid;

  const NextScreenChat({
    Key? key,
    this.imageUrls,
    this.name,
    this.uid,
  }) : super(key: key);

  @override
  _NextScreenChatState createState() => _NextScreenChatState();
}

class _NextScreenChatState extends State<NextScreenChat> {
  final TextEditingController _textController = TextEditingController();

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
        title: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      widget.imageUrls![0] as String,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 2, top: 2),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 6,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: widget.name ?? "",
                  fontSize: 14,
                ),
                const AppText(
                  text: "Online",
                  fontSize: 12,
                  color: Color(0xff9496A5),
                ),
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
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('messageschat')
                  .doc(widget.uid)
                  .collection('chats')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container();
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Container();
                }

                final messages = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final message = messages[index].data();
                    final String text = message['text'];
                    // final String senderId = message['senderId'];
                    // final DateTime timestamp = message['timestamp'].toDate();

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                topLeft: Radius.circular(1),
                              ),
                              border: Border.all(
                                color: const Color.fromARGB(255, 197, 202, 223),
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                                horizontal: 10.0,
                              ),
                              child: Text(
                                text,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              style: GoogleFonts.podkova(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Type a message',
                hintStyle: GoogleFonts.poppins(color: Colors.white),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final String messageText = _textController.text.trim();

                    if (messageText.isNotEmpty) {
                      final CollectionReference messagesRef = FirebaseFirestore
                          .instance
                          .collection('messageschat')
                          .doc(widget.uid)
                          .collection('chats');

                      messagesRef.add({
                        'text': messageText,
                        'senderId': widget.uid,
                        'timestamp': Timestamp.now(),
                      });

                      _textController.clear();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
