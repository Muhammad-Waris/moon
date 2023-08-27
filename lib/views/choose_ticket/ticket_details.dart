import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/widgets/app_button.dart';

import '../../constants/appcolors.dart';
import '../../constants/svgicons.dart';
import '../../widgets/app_text.dart';
import 'events/event1.dart';

class TicketDetails extends StatefulWidget {
  final Map<String, dynamic> eventData;
  final double totalAmount;

  const TicketDetails({
    super.key,
    required this.eventData,
    required this.totalAmount,
  });

  @override
  State<TicketDetails> createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
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
          text: "Ticket Details",
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: AppPadding.defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: "Event",
                    fontSize: 13,
                  ),
                  AppText(
                    text: widget.eventData['eventName'],
                    fontSize: 17,
                  ),
                  const AppText(
                    text: "Exhibition",
                    fontSize: 13,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const AppText(
                    text: "Date & Time",
                    fontSize: 13,
                  ),
                  AppText(
                    text: widget.eventData['date'],
                    fontSize: 17,
                  ),
                  AppText(
                    text: widget.eventData['time'],
                    fontSize: 13,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppText(
                            text: "Location",
                            fontSize: 13,
                          ),
                          AppText(
                            text: widget.eventData['location'],
                            fontSize: 17,
                          ),
                          const AppText(
                            text: "Festival Pavilion, San Francisco, CA",
                            fontSize: 13,
                          ),
                        ],
                      ),
                      // Image.asset(
                      //   "assets/Map.png",
                      //   width: MediaQuery.of(context).size.width * 0.15,
                      // )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const AppText(
                    text: "Ticket",
                    fontSize: 13,
                  ),
                  const AppText(
                    text: "Presale Ticket",
                    fontSize: 17,
                  ),
                  Row(
                    children: [
                      const AppText(
                        text: "Sales end on ",
                        fontSize: 13,
                      ),
                      AppText(
                        text: widget.eventData['dateRange'],
                        fontSize: 13,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const AppText(
                    text: "Price",
                    fontSize: 13,
                  ),
                  AppText(
                    text: "\$${widget.totalAmount.toStringAsFixed(2)}",
                    fontSize: 17,
                  ),
                  const AppText(
                    text: "1 x \$25 + \$5.36 (Service fee)",
                    fontSize: 13,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  AppButton(
                    text: "Cancel",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  AppButton(
                    text: "Confirm",
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Event01(
                          eventData: widget.eventData,
                          totalAmount: widget.totalAmount,
                        );
                      }));
                    },
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
