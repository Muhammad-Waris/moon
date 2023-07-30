import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moon/constants/appcolors.dart';
import 'package:pinput/pinput.dart';

class PinPutWidget extends StatelessWidget {
  const PinPutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 62,
      height: 62,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: AppColors.appBackgroundColor),
      ),
    );

    return Pinput(
      length: 5,
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: Color(0xff1E233A),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppColors.primaryColor, width: 0.4),
        ),
      ),
      defaultPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: Color(0xff1E233A),
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: Color(0xff1E233A),
          borderRadius: BorderRadius.circular(28),
        ),
      ),
    );
  }
}
