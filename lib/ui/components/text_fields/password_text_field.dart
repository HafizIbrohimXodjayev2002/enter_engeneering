import 'package:eriell_company/core/dimensions.dart';
import 'package:eriell_company/gen/assets.gen.dart';
import 'package:eriell_company/gen/colors.gen.dart';
import 'package:eriell_company/ui/themes/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordTextField extends StatefulWidget {
  final String hintText;
  final bool? isObscuredText;
  final int minLines;
  final int maxLines;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final VoidCallback? onPressed;
  final VoidCallback? onEditingComplete;
  final TextInputType keyboardType;
  final String? error;
  final int? maxLength;
  final TextEditingController controller;
  final List<TextInputFormatter>? formatter;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final bool? enabledField;
  final bool autoFocus;
  final String titleHintText;
  final bool hasSuffixIcon;

  const PasswordTextField(
      {Key? key,
      this.autoFocus = false,
      this.onPressed,
      this.onSuffixIconPressed,
      this.formatter,
      required this.titleHintText,
      this.hasSuffixIcon = true,
      this.onEditingComplete,
      required this.controller,
      this.textInputAction = TextInputAction.done,
      this.hintText = '',
      this.minLines = 1,
      this.maxLines = 1,
      this.keyboardType = TextInputType.text,
      this.suffixIcon,
      this.maxLength,
      this.isObscuredText,
      this.error,
      this.onChanged,
      this.focusNode,
      this.enabledField = true,
      this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldFieldState();
}

class _PasswordTextFieldFieldState extends State<PasswordTextField> {
  bool _isVisible = true;
  bool _labelTextVisible = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _labelTextVisible = true;
        });
      } else {
        setState(() {
          _labelTextVisible = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _labelTextVisible || widget.controller.text.isNotEmpty
            ? Padding(
                padding: Dimensions.paddingH24,
                child: Text(
                  widget.titleHintText,
                  style: AppStyle.header7.copyWith(
                    color: widget.error == null
                        ? _focusNode.hasFocus
                            ? Colors.blue
                            : ColorName.subtitleColorDark
                        : ColorName.red,
                  ),
                ),
              )
            : Dimensions.vSpace20,
        _labelTextVisible || widget.controller.text.isNotEmpty ? Dimensions.vSpace8 : const SizedBox.shrink(),
        TextFormField(
          onTap: widget.onPressed,
          focusNode: widget.focusNode,
          maxLength: widget.maxLength,
          autofocus: widget.autoFocus,
          textInputAction: widget.textInputAction,
          onChanged: (v) {
            if (v.isNotEmpty && !_labelTextVisible) {
              setState(() {});
            }
            widget.onChanged?.call(v);
          },
          textAlign: widget.textAlign,
          inputFormatters: widget.formatter,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          controller: widget.controller,
          style: const TextStyle(),
          obscureText: widget.isObscuredText ?? _isVisible,
          keyboardType: widget.keyboardType,
          enabled: widget.enabledField,
          onEditingComplete: () {
            widget.textInputAction == TextInputAction.done ? _focusNode.unfocus() : _focusNode.nextFocus();
            widget.onEditingComplete?.call();
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorName.white,
            suffixIcon: _isVisible
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    child: Padding(
                      padding: Dimensions.paddingRight8,
                      child: Assets.icons.icLightPasswordOff.svg(),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    child: Padding(
                      padding: Dimensions.paddingRight8,
                      child: Assets.icons.icLightPasswordOn.svg(),
                    ),
                  ),
            errorBorder: OutlineInputBorder(
              borderRadius: Dimensions.radiusAll28,
              borderSide: const BorderSide(color: ColorName.red, style: BorderStyle.solid),
            ),
            border: OutlineInputBorder(
              borderRadius: Dimensions.radiusAll28,
              borderSide: const BorderSide(color: ColorName.red, style: BorderStyle.solid),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: Dimensions.radiusAll28,
              borderSide: const BorderSide(color: ColorName.gray2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: Dimensions.radiusAll28,
              borderSide: const BorderSide(color: ColorName.darkBlue),
            ),
            errorText: widget.error,
            hintText: widget.hintText,
            hintStyle: AppStyle.interW500x14Grey,
            errorStyle: AppStyle.header7.copyWith(color: ColorName.red),
            contentPadding: Dimensions.paddingFormLeft24Right12TB18,
          ),
        ),
      ],
    );
  }
}
