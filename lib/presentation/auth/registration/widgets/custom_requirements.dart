import 'package:eriell_company/ui/components/switches/custom_check_box.dart';
import 'package:eriell_company/ui/themes/app_style.dart';
import 'package:eriell_company/core/dimensions.dart';
import 'package:flutter/material.dart';

class CustomRequirements extends StatelessWidget {
  final bool isChecked;
  final String requirementTitle;

  const CustomRequirements({Key? key, this.isChecked = false, required this.requirementTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(isChecked: isChecked),
        Dimensions.hSpace8,
        Text(requirementTitle, style: AppStyle.interW500x14Grey),
      ],
    );
  }
}
