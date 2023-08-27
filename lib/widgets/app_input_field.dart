import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_text.dart';

class AppInputField extends StatelessWidget {
  final String hintText;
  final String? upperText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardtype;
  final Widget? suffixIcon, prefixIcon;
  final void Function()? onTap, onpress, ontap2;
  final EdgeInsetsGeometry contentPadding;
  final bool? enabled, readOnly;
  final double? width, height;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextInputAction textInputAction;
  final int? maxLength;
 final void Function(String)? onChanged;
 const  AppInputField({
    Key? key,
    required this.hintText,
    this.controller,
    this.keyboardtype,
    this.ontap2,
    this.obscureText = false,
    this.suffixIcon,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
    this.onTap,
    this.onChanged,
    this.onpress,
    this.validator,
    this.readOnly,
    this.enabled,
    this.width,
    this.prefixIcon,
    this.height,
    this.upperText,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 11, bottom: 2),
            child: AppText(
              text: upperText ?? "",
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(33),
            child: GestureDetector(
              onTap: ontap2,
              child: TextFormField(
                onChanged: onChanged,
                style: GoogleFonts.poppins(color: Colors.white),
                validator: validator,
                maxLength: maxLength,
                readOnly: readOnly ?? false,
                maxLines: maxLines,
                textInputAction: textInputAction,
                enabled: enabled,
                autofocus: false,
                obscureText: obscureText,
                keyboardType: keyboardtype,
                controller: controller,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(33),
                      borderSide: BorderSide.none),
                  prefixIcon: prefixIcon,
                  prefixIconColor: const Color(0xff8E8D91),
                  suffixIcon: suffixIcon,
                  fillColor: const Color(0xff1E233A),
                  filled: true,
                  hintText: hintText,
                  contentPadding: contentPadding,
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff8E8D91),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppInputField2 extends StatelessWidget {
  final String hintText;
  final String? upperText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardtype;
  final Widget? suffixIcon, prefixIcon;
  final void Function()? onTap, onpress, ontap2;

  final EdgeInsetsGeometry contentPadding;
  final bool? enabled, readOnly;
  final double? width, height;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextInputAction textInputAction;
  final int? maxLength;
  const AppInputField2({
    Key? key,
    required this.hintText,
    this.controller,
    this.keyboardtype,
    this.ontap2,
    this.obscureText = false,
    this.suffixIcon,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
    this.onTap,
    this.onpress,
    this.validator,
    this.readOnly,
    this.enabled,
    this.width,
    this.prefixIcon,
    this.height,
    this.upperText,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(33),
            child: GestureDetector(
              onTap: ontap2,
              child: TextFormField(
                style: GoogleFonts.poppins(color: Colors.white),
                validator: validator,
                maxLength: maxLength,
                readOnly: readOnly ?? false,
                maxLines: maxLines,
                textInputAction: textInputAction,
                enabled: enabled,
                autofocus: false,
                obscureText: obscureText,
                keyboardType: keyboardtype,
                controller: controller,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(33),
                      borderSide: BorderSide.none),
                  prefixIcon: prefixIcon,
                  prefixIconColor: const Color(0xff8E8D91),
                  suffixIcon: suffixIcon,
                  fillColor: const Color(0xff1E233A),
                  filled: true,
                  hintText: hintText,
                  contentPadding: contentPadding,
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff8E8D91),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
