import 'package:eriell_company/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  final double? radius;
  final double? iconSize;

  const CustomCheckBox({
    Key? key,
    this.radius,
    this.iconSize,
    this.isChecked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 9,
      backgroundColor: ColorName.primary,
      child: CircleAvatar(
        radius: radius ?? 8,
        backgroundColor: isChecked ? ColorName.primary : ColorName.white,
        child: isChecked ? Icon(Icons.check, size: iconSize ?? 14, color: ColorName.white) : const SizedBox(),
      ),
    );
  }
}
