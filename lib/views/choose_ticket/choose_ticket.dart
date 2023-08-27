import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/views/choose_ticket/review_order.dart';
import 'package:moon/widgets/app_button.dart';

import '../../constants/appcolors.dart';
import '../../constants/svgicons.dart';
import '../../widgets/app_text.dart';

class ChooseTicket extends StatefulWidget {
  const ChooseTicket({super.key});

  @override
  State<ChooseTicket> createState() => _ChooseTicketState();
}

class _ChooseTicketState extends State<ChooseTicket> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> adminData = [];
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
          text: "Choose Ticket",
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: _firestore.collection('admin').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }

                  // Process and display the data
                  adminData =
                      snapshot.data!.docs.map((doc) => doc.data()).toList();
                  return Column(
                    children: adminData.map<Widget>((data) {
                      return Column(
                        children: [
                          Padding(
                            padding: AppPadding.defaultPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: data['eventName'],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.string(SvgIcons.calendar),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    AppText(
                                      text: data['time'],
                                      fontSize: 15,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    AppText(
                                      text: data['date'],
                                      fontSize: 15,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      text: "Early Bird Presale Ticket",
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    AppText(
                                      text: "Sold out",
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    const AppText(
                                      text: "\$",
                                      fontSize: 13,
                                    ),
                                    AppText(
                                      text: data['eventEntryFee'],
                                      fontSize: 13,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const AppText(
                                      text: "Sales end on ",
                                      fontSize: 13,
                                    ),
                                    AppText(
                                      text: data['dateRange'],
                                      fontSize: 13,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    AppText(
                                      text: "More",
                                      fontSize: 13,
                                      color: Color(0xff662FFF),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Color(0xff707070),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: double.infinity,
                                  child: Divider(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const AppText(
                                          text: "Presale Ticket",
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        Row(
                                          children: [
                                            const AppText(
                                              text: "\$",
                                              fontSize: 13,
                                            ),
                                            AppText(
                                              text: data['eventEntryFee'],
                                              fontSize: 13,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Container(
                                        height: 44,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.20,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: DropdownButton<int>(
                                            value: int.parse(data[
                                                'numberOfTickets']), // Convert to integer
                                            onChanged: (newValue) {
                                              // Handle dropdown selection here
                                              setState(() {
                                                // Update the value in the data
                                                data['numberOfTickets'] =
                                                    newValue.toString();
                                              });
                                            },
                                            items: List.generate(
                                                int.parse(data[
                                                        'numberOfTickets']) +
                                                    1,
                                                (index) =>
                                                    DropdownMenuItem<int>(
                                                        value: index,
                                                        child: Text(
                                                            index.toString()))),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const AppText(
                                      text: "Sales end on",
                                      fontSize: 13,
                                    ),
                                    AppText(
                                      text: data['dateRange'],
                                      fontSize: 13,
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
                                  height: 7,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      );
                    }).toList(),
                  );
                }),
            const SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 48,
                  width: MediaQuery.of(context).size.width * 0.83,
                  decoration: BoxDecoration(
                    color: const Color(0xff1E233A),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "Promo Code",
                          color: Color(0xff8A8A8F),
                        ),
                        AppText(
                          text: "Apply",
                          color: Color(0xff662FFF),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  width: MediaQuery.of(context).size.width * 0.80,
                  text: "Order Now",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ReviewOrder(
                        adminData: adminData,
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
          ],
        ),
      ),
    );
  }
}
