import 'package:eriell_company/core/dimensions.dart';
import 'package:eriell_company/ui/themes/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final EdgeInsets margin;

  const CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          elevation: 0,
          primary: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          side: const BorderSide(color: Colors.transparent),
          shape: RoundedRectangleBorder(borderRadius: Dimensions.radiusAll26),
          minimumSize: Size(
            MediaQuery.of(context).size.width,
            Dimensions.defaultButtonHeight,
          ),
        ),
        child: Text(
          title,
          style: AppStyle.interW700x16Gray4,
        ),
      ),
    );
  }
}
