import 'package:eriell_company/ui/themes/app_style.dart';
import 'package:flutter/material.dart';

class EriellAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final Widget? action;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;

  const EriellAppBar({
    Key? key,
    this.title,
    this.action,
    this.bottom,
    this.leading,
    this.titleWidget,
    this.centerTitle = true,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      bottom: bottom,
      leading: leading,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      title: titleWidget ?? Text(title ?? '', style: AppStyle.appBar),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(56 + ((bottom?.preferredSize.height != null ? (bottom!.preferredSize.height + 16) : 0)));
}
