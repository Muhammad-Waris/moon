import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/views/Homescreen/messages/chatbox.dart';
import 'package:moon/views/Homescreen/messages/new_messages.dart';
import '../../../constants/appcolors.dart';
import '../../../constants/svgicons.dart';
import '../../../widgets/app_input_field.dart';
import '../../../widgets/app_text.dart';

class Messages1 extends StatelessWidget {
  const Messages1({super.key});

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
                    ]),
                child: SvgPicture.string(SvgIcons.backbutton)),
          ),
        ),
        title: const AppText(
          text: "Messages",
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewMessages();
                }));
              },
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
          ),
        ],
      ),
      body: Padding(
        padding: AppPadding.defaultPadding,
        child: Column(
          children: [
             AppInputField(
              hintText: "Search in public..",
              prefixIcon: Icon(Icons.search),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Chatbox();
                }));
              },
              child: SizedBox(
                height: 88,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      height: 65,
                      width: 65,
                      decoration: const BoxDecoration(
                          color: Color(0xff1E233A), shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(text: "Jordan"),
                          AppText(
                            text:
                                "Hat Spaß gemacht gestern! Lass uns die Tage mal treffen...",
                            fontSize: 12,
                            color: Color(0xff9496A5),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppText(
                            text: "28 February 2020 8:30 am",
                            fontSize: 12,
                            color: Color(0xff9496A5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Chatbox();
                }));
              },
              child: SizedBox(
                height: 88,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 65,
                      width: 65,
                      decoration: const BoxDecoration(
                          color: Color(0xff1E233A), shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(text: "Solarsystemsoundsystem"),
                          AppText(text: "......"),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
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
