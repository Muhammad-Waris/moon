import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moon/views/choose_ticket/ticket_details.dart';

import '../../constants/appcolors.dart';
import '../../constants/svgicons.dart';
import '../../widgets/app_text.dart';

class Tickets extends StatefulWidget {
  final List<Map<String, dynamic>> adminData;
  final double totalAmount;
  const Tickets(
      {super.key, required this.adminData, required this.totalAmount});

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
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
          text: "Tickets",
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppText(
                  text: "Upcoming",
                  fontSize: 15,
                ),
                AppText(
                  text: "Previous",
                  fontSize: 15,
                ),
              ],
            ),
            const SizedBox(
              width: double.infinity,
              child: Divider(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: List.generate(
                widget.adminData.length,
                (index) {
                  Map<String, dynamic> eventData = widget.adminData[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return TicketDetails(
                            eventData: eventData,
                            totalAmount: widget.totalAmount,
                          );
                        }),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 17, right: 17, bottom: 12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  eventData[
                                      'imageUrl'], // Use the imageUrl from adminData
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      AppText(
                                        text: eventData['time'],
                                        fontSize: 12,
                                      ),
                                      AppText(
                                        text: eventData['date'],
                                        fontSize: 12,
                                      ),
                                    ],
                                  ),
                                  const AppText(
                                    text: "Open Data Science Conference",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.string(SvgIcons.drop),
                                      AppText(
                                        text: eventData['location'],
                                        fontSize: 13,
                                      ),
                                    ],
                                  ),
                                  AppText(
                                    text:
                                        '\$${widget.totalAmount.toStringAsFixed(2)}',
                                    fontSize: 15,
                                    color: const Color(0xff662FFF),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.59,
                                child: const Divider(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
