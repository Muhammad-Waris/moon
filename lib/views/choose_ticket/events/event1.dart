import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/views/choose_ticket/events/event02.dart';

import '../../../constants/appcolors.dart';
import '../../../constants/svgicons.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text.dart';

class Event01 extends StatefulWidget {
  final Map<String, dynamic> eventData;
  final double totalAmount;
  const Event01(
      {super.key, required this.eventData, required this.totalAmount});

  @override
  State<Event01> createState() => _Event01State();
}

class _Event01State extends State<Event01> {
  String? _pickedImagePath;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        // Set the picked image file path to a variable
        _pickedImagePath = pickedFile.path;
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
                    ]),
                child: SvgPicture.string(SvgIcons.backbutton)),
          ),
        ),
        title: const AppText(
          text: "Event Details",
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 37,
                    width: 37,
                    decoration: const BoxDecoration(
                      color: Color(0xff662FFF),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: AppText(text: "1"),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.10,
                    child: const Divider(
                      thickness: 1,
                      color: Color(0xff662FFF),
                    ),
                  ),
                  Container(
                    height: 37,
                    width: 37,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xff662FFF))),
                    child: const Center(
                      child: AppText(
                        text: "2",
                        color: Color(0xff662FFF),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.10,
                    child: const Divider(
                      thickness: 1,
                      color: Color(0xff662FFF),
                    ),
                  ),
                  Container(
                    height: 37,
                    width: 37,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xff662FFF))),
                    child: const Center(
                      child: AppText(
                        text: "3",
                        color: Color(0xff662FFF),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.10,
                    child: const Divider(
                      thickness: 1,
                      color: Color(0xff662FFF),
                    ),
                  ),
                  Container(
                    height: 37,
                    width: 37,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xff662FFF))),
                    child: Center(
                      child:
                          Center(child: SvgPicture.string(SvgIcons.purpleflag)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const AppText(
                text: "Event Title",
                fontSize: 13,
              ),
              AppText(
                text: widget.eventData['eventName'],
                fontSize: 17,
              ),
              const SizedBox(
                height: 12,
              ),
              const AppText(
                text: "Privacy",
                fontSize: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 22,
                        width: 22,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffB8B7BC)),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const AppText(
                        text: "Public Event",
                        fontSize: 17,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 22,
                        width: 22,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const AppText(
                        text: "Private Event",
                        fontSize: 17,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 17,
              ),
              const AppText(
                text: "Venue Name",
                fontSize: 13,
              ),
              AppText(
                text: widget.eventData['location'],
                fontSize: 17,
              ),
              const SizedBox(
                height: 17,
              ),
              const AppText(
                text: "Address",
                fontSize: 13,
              ),
              AppText(
                text: widget.eventData['address'],
                fontSize: 17,
              ),
              const SizedBox(
                height: 14,
              ),
              const AppText(
                text: "Start Date",
                fontSize: 13,
              ),
              const SizedBox(
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.string(
                        SvgIcons.calendar,
                        color: const Color(0xff8A8A8F),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      AppText(
                        text: widget.eventData['date'],
                        fontSize: 17,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              color: Color(0xff8A8A8F), shape: BoxShape.circle),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        AppText(
                          text: widget.eventData['time'],
                          fontSize: 17,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const AppText(
                text: "End Date",
                fontSize: 13,
              ),
              const SizedBox(
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.string(
                        SvgIcons.calendar,
                        color: const Color(0xff8A8A8F),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      AppText(
                        text: widget.eventData['dateRange'],
                        fontSize: 17,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              color: Color(0xff8A8A8F), shape: BoxShape.circle),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const AppText(
                          text: "Time",
                          fontSize: 17,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const AppText(
                text: "Event Image",
                fontSize: 13,
              ),
              const AppText(
                text: "Upload up to 5 images",
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: _pickedImagePath != null
                        ? Image.file(
                            File(_pickedImagePath!),
                            width: MediaQuery.of(context).size.width * 0.22,
                          )
                        : GestureDetector(
                            onTap: _pickImage,
                            child: Image.asset(
                              "assets/pic.png",
                              width: MediaQuery.of(context).size.width * 0.22,
                            ),
                          ),
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        "assets/pic.png",
                        width: MediaQuery.of(context).size.width * 0.22,
                      )),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Image.asset(
                      "assets/pic.png",
                      width: MediaQuery.of(context).size.width * 0.22,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              const AppText(
                text: "Tap on a photo to select as primary image",
                fontSize: 12,
              ),
              const SizedBox(
                height: 17,
              ),
              const AppText(
                text: "Description",
                fontSize: 13,
              ),
              AppText(
                text: widget.eventData['desc'],
                fontSize: 17,
              ),
              const SizedBox(
                height: 17,
              ),
              const AppText(
                text: "FAQ",
                fontSize: 13,
              ),
              const AppText(
                text: "Optional Details",
                fontSize: 17,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    width: MediaQuery.of(context).size.width * 0.80,
                    text: "Next",
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Event02(
                          eventData: widget.eventData,
                          totalAmount: widget.totalAmount,
                        );
                      }));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 5,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
