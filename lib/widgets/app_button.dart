import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moon/constants/appcolors.dart';
class AppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isLoading;

  final Color? buttonColor, textColor, borderColor;
  final String text;
  final double? height, width;
  final Widget? icon;
  final BorderRadiusGeometry? borderradius;

  const AppButton({
    Key? key,
    this.onTap,
    required this.text,
    this.buttonColor,
    this.textColor,
    this.isLoading = false,
    this.height,
    this.width,
    this.icon,
    this.borderColor,
    this.borderradius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: borderradius ?? BorderRadius.circular(50),
          color: buttonColor ?? AppColors.primaryColor,
          border: Border.all(
            color: borderColor ?? Colors.transparent,
          ),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 50,
                  child: SpinKitThreeBounce(
                    color: Colors.white,
                    size: 20,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon ?? const SizedBox(),
                      icon != null
                          ? const SizedBox(
                              width: 10,
                            )
                          : const SizedBox(),
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: textColor ?? Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? buttonColor, textColor, borderColor;
  final String text;
  final double? height, width;
  final Widget? icon;
  final BorderRadiusGeometry? borderradius;

  const RoundedButton(
      {Key? key,
      this.onTap,
      required this.text,
      this.buttonColor,
      this.textColor,
      this.height,
      this.width,
      this.icon,
      this.borderColor,
      this.borderradius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: borderradius ?? BorderRadius.circular(50),
          color: buttonColor,
          border:
              Border.all(color: borderColor ?? Colors.transparent, width: 0.4),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon ?? const SizedBox(),
                icon != null
                    ? const SizedBox(
                        width: 10,
                      )
                    : const SizedBox(),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textColor ?? Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
