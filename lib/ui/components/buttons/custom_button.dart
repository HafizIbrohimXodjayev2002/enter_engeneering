import 'package:eriell_company/core/dimensions.dart';
import 'package:eriell_company/gen/colors.gen.dart';
import 'package:eriell_company/ui/themes/app_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final bool isActive;
  final bool isLoading;
  final VoidCallback onPressed;

  const CustomButton({
    required this.title,
    this.isActive = false,
    this.isLoading = false,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return widget.isActive
        ? OutlinedButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
              shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
              fixedSize: MaterialStateProperty.resolveWith<Size>(
                (Set<MaterialState> states) {
                  return Size(
                    MediaQuery.of(context).size.width,
                    Dimensions.defaultButtonHeight,
                  );
                },
              ),
              maximumSize: MaterialStateProperty.resolveWith<Size>(
                (Set<MaterialState> states) {
                  return Size(
                    MediaQuery.of(context).size.width,
                    Dimensions.defaultButtonHeight,
                  );
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return ColorName.pressedButtonColor;
                  } else if (states.contains(MaterialState.disabled)) {
                    return ColorName.defaultButtonColor;
                  }
                  return ColorName.primary;
                },
              ),
            ),
            onPressed: () {
              widget.onPressed.call();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  widget.title,
                  style: AppStyle.buttonText.copyWith(color: ColorName.white),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Visibility(
                    visible: widget.isLoading,
                    child: Container(
                      width: 20,
                      height: 20,
                      margin: Dimensions.paddingRight12,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2.4,
                        valueColor: AlwaysStoppedAnimation(ColorName.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : OutlinedButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
              shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
              fixedSize: MaterialStateProperty.resolveWith<Size>(
                (Set<MaterialState> states) {
                  return Size(
                    MediaQuery.of(context).size.width,
                    Dimensions.defaultButtonHeight,
                  );
                },
              ),
              maximumSize: MaterialStateProperty.resolveWith<Size>(
                (Set<MaterialState> states) {
                  return Size(
                    MediaQuery.of(context).size.width,
                    Dimensions.defaultButtonHeight,
                  );
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return ColorName.primary;
                  } else if (states.contains(MaterialState.disabled)) {
                    return ColorName.cardColorLight;
                  }
                  return ColorName.cardColorLight;
                },
              ),
            ),
            onPressed: null,
            child: Text(
              widget.title,
              style: AppStyle.buttonText.copyWith(
                color: ColorName.subtitleColorDark,
              ),
            ),
          );
  }
}
