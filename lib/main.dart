import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal/pages/pages.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/utils/bouncing_scroll_behavior.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint(breakpoint: 600, name: MOBILE),
            ResponsiveBreakpoint(breakpoint: 800, name: TABLET, scale: true),
            ResponsiveBreakpoint(breakpoint: 1200, name: DESKTOP),
            ResponsiveBreakpoint(breakpoint: 1400, name: "4K", scale: true),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
      initialRoute: "/",
      routes: {
        "/": (context) => ListPage(),
        "/post": (context) => PostPage(),
        "/style": (context) => TypographyPage(),
      },
      theme: Theme.of(context).copyWith(platform: TargetPlatform.android),
      debugShowCheckedModeBanner: false,
    );
  }
}
