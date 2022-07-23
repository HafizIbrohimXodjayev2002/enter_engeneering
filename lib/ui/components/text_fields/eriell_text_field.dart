import 'package:eriell_company/core/dimensions.dart';
import 'package:eriell_company/gen/colors.gen.dart';
import 'package:eriell_company/ui/themes/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EriellTextField extends StatefulWidget {
  final int minLines;
  final int maxLines;
  final String? error;
  final int? maxLength;
  final String? hintText;
  final String? prefixText;
  final String? initialValue;
  final Widget? suffixIcon;
  final bool isObscuredText;
  final TextAlign textAlign;
  final VoidCallback? onPressed;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onSuffixIconPressed;
  final List<TextInputFormatter>? formatter;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final bool? enabledField;
  final bool autoFocus;
  final String titleHintText;
  final bool enableTextCapitalization;
  final bool isIconsBackTransparent;
  final bool readOnly;

  const EriellTextField(
      {Key? key,
      this.autoFocus = false,
      this.onPressed,
      this.onSuffixIconPressed,
      this.readOnly = false,
      this.formatter,
      this.isIconsBackTransparent = false,
      required this.titleHintText,
      this.onEditingComplete,
      this.controller,
      this.textInputAction = TextInputAction.done,
      this.hintText = '',
      this.minLines = 1,
      this.maxLines = 1,
      this.keyboardType = TextInputType.text,
      this.suffixIcon,
      this.maxLength,
      this.error,
      this.onChanged,
      this.focusNode,
      this.enabledField = true,
      this.isObscuredText = false,
      this.textAlign = TextAlign.start,
      this.enableTextCapitalization = false,
      this.prefixText,
      this.initialValue,
      this.nextFocusNode})
      : super(key: key);

  @override
  State<EriellTextField> createState() => _EriellTextFieldState();
}

class _EriellTextFieldState extends State<EriellTextField> {
  late final TextEditingController _controller;
  bool _labelTextVisible = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? TextEditingController();
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }
    _focusNode.addListener(() {
      if (!mounted) return;
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
        _labelTextVisible || _controller.text.isNotEmpty
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
        _labelTextVisible || _controller.text.isNotEmpty ? Dimensions.vSpace8 : const SizedBox(),
        TextFormField(
          focusNode: _focusNode,
          onTap: widget.onPressed,
          readOnly: widget.readOnly,
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
          textCapitalization: widget.enableTextCapitalization ? TextCapitalization.sentences : TextCapitalization.none,
          controller: _controller,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          enabled: widget.enabledField,
          inputFormatters: widget.formatter,
          keyboardType: widget.keyboardType,
          obscureText: widget.isObscuredText,
          onEditingComplete: () {
            if (widget.textInputAction == TextInputAction.done) {
              _focusNode.unfocus();
            } else {
              if (widget.nextFocusNode != null) {
                widget.nextFocusNode!.requestFocus();
              } else {
                _focusNode.nextFocus();
              }
            }
            widget.onEditingComplete?.call();
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorName.white,
            suffixIcon: widget.suffixIcon != null
                ? GestureDetector(
                    onTap: widget.onSuffixIconPressed,
                    child: Container(
                      width: 32,
                      height: 32,
                      margin: Dimensions.paddingAll12,
                      padding: Dimensions.paddingAll6,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorName.cardColorLight,
                      ),
                      child: widget.suffixIcon,
                    ),
                  )
                : null,
            prefixText: widget.prefixText,
            errorBorder: OutlineInputBorder(
              borderRadius: Dimensions.radiusAll28,
              borderSide: const BorderSide(color: ColorName.red, style: BorderStyle.solid, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: Dimensions.radiusAll28,
              borderSide: const BorderSide(color: ColorName.red, style: BorderStyle.solid, width: 1),
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
            prefixStyle: AppStyle.interW500x16White70,
            contentPadding: Dimensions.paddingFormLeft24Right12TB18,
            errorStyle: AppStyle.header7.copyWith(color: ColorName.red),
          ),
        ),
      ],
    );
  }
}
