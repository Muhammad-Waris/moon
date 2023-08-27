import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/views/choose_ticket/earnings/payment_method.dart';
import 'package:moon/widgets/app_button.dart';

import '../../../constants/appcolors.dart';
import '../../../constants/svgicons.dart';
import '../../../widgets/app_text.dart';

class Event02 extends StatefulWidget {
  final Map<String, dynamic> eventData;
  final double totalAmount;
  const Event02(
      {super.key, required this.eventData, required this.totalAmount});

  @override
  State<Event02> createState() => _Event02State();
}

class _Event02State extends State<Event02> {
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
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xff662FFF))),
                    child: const Center(
                      child: AppText(
                        text: "1",
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
                    decoration: const BoxDecoration(
                      color: Color(0xff662FFF),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: AppText(
                        text: "2",
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
                text: "Ticket Name",
                fontSize: 13,
              ),
              const AppText(
                text: "Early Bird Presale Ticket",
                fontSize: 17,
              ),
              const SizedBox(
                height: 25,
              ),
              const AppText(
                text: "Ticket type",
                fontSize: 13,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.73,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                          text: "Free",
                          fontSize: 17,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 33),
                      child: Row(
                        children: [
                          Container(
                            height: 22,
                            width: 22,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffB8B7BC)),
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
                            text: "Paid",
                            fontSize: 17,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
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
                height: 22,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "Quantity",
                          fontSize: 13,
                        ),
                        AppText(
                          text: "850",
                          fontSize: 17,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppText(
                          text: "Price",
                          fontSize: 13,
                        ),
                        AppText(
                          text: "\$${widget.totalAmount.toStringAsFixed(2)}",
                          fontSize: 17,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const AppText(
                text: "Sales Start",
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
                text: "Sales End",
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
                          text: "6:00 PM",
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
              const SizedBox(
                height: 17,
              ),
              const AppText(
                text: "Allowed Per Order",
                fontSize: 13,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.60,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: "Min.1",
                      fontSize: 17,
                    ),
                    AppText(
                      text: "Max.0",
                      fontSize: 17,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppButton(
                    width: MediaQuery.of(context).size.width * 0.35,
                    text: "Delete",
                    onTap: () {},
                  ),
                  AppButton(
                    width: MediaQuery.of(context).size.width * 0.35,
                    text: "Add Tickets",
                    onTap: () {},
                  )
                ],
              ),
              const SizedBox(
                height: 20,
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
                        return PaymentMethods(
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
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
