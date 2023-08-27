import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/views/choose_ticket/earnings/payment_success.dart';
import 'package:moon/widgets/app_button.dart';
import 'package:moon/widgets/app_text.dart';

import '../../../constants/appcolors.dart';
import '../../../constants/svgicons.dart';

class PaymentMethods extends StatefulWidget {
  final Map<String, dynamic> eventData;
  final double totalAmount;
  const PaymentMethods(
      {super.key, required this.eventData, required this.totalAmount});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  final _formKey = GlobalKey<FormState>();

  String? _validateCardNumber(String value) {
    if (value.isEmpty) {
      return 'Please enter a valid card number';
    }
    // Add any other validation logic here
    return null;
  }

  String? _validateCardHolder(String value) {
    if (value.isEmpty) {
      return 'Please enter the card holder\'s name';
    }
    // Add any other validation logic here
    return null;
  }

  String? _validateExpiry(String value) {
    if (value.isEmpty) {
      return 'Please enter expiry date';
    }
    // Add any other validation logic here
    return null;
  }

  String? _validateCVC(String value) {
    if (value.isEmpty) {
      return 'Please enter CVC';
    }
    // Add any other validation logic here
    return null;
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
          text: "Payment Method",
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.defaultPadding,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const AppText(
                  text: "Choose your payment method",
                  fontSize: 18,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/visa.png"),
                    Image.asset("assets/paypal.png"),
                    Image.asset("assets/applepay.png"),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                          color: Color(0xff8A8A8F),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                          color: Color(0xffFFFFFF),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                          color: Color(0xffFFFFFF),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xffEFEFF4),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Card Holder",
                    hintStyle: GoogleFonts.poppins(
                        color: const Color(0xff8A8A8F), fontSize: 17),
                    filled: true,
                    fillColor: const Color(0xffEFEFF4),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.37,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Expires",
                          hintStyle: GoogleFonts.poppins(
                              color: const Color(0xff8A8A8F), fontSize: 17),
                          filled: true,
                          fillColor: const Color(0xffEFEFF4),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.37,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "CVC",
                          hintStyle: GoogleFonts.poppins(
                              color: const Color(0xff8A8A8F), fontSize: 17),
                          filled: true,
                          fillColor: const Color(0xffEFEFF4),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                        color: Color(0xff8A8A8F),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    const AppText(text: "Saves Credit Card Information")
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                AppButton(
                  text: "Save",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, you can proceed to save data and navigate
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const PaymentSuccess();
                      }));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
