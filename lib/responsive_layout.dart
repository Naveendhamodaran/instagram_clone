import 'package:flutter/material.dart';
import 'dimensions.dart';
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key, required this.webScreenLayout, required this.mobileScreenLayout});

  final Widget webScreenLayout;
  final Widget mobileScreenLayout;



  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints){
          if(constraints.maxWidth>webScreenSize){
            //web screen
            return webScreenLayout;

          }
          //mobile screen
          return mobileScreenLayout;
        },
    );
  }
}
