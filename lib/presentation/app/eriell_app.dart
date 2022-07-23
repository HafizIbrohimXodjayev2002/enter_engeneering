import 'package:eriell_company/ui/themes/app_themes.dart';
import 'package:eriell_company/routes/app_pages.dart';
import 'package:flutter/material.dart';

class EriellApp extends StatelessWidget {
  const EriellApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Eriell app',
      theme: Themes.lightTheme,
      debugShowCheckedModeBanner: false,
      routerDelegate: AppPages.router.routerDelegate,
      routeInformationParser: AppPages.router.routeInformationParser,
    );
  }
}
