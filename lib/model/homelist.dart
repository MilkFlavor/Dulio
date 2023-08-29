import 'package:dulio/introduction_animation/introduction_animation_screen.dart';
import 'package:dulio/core/Dulio_core.dart';
import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({this.imagePath = '', this.navigateScreen});

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/introduction_animation/introduction_animation.png',
      navigateScreen: IntroductionAnimationScreen(),
    ),
    // Create a widget that allows the user to open an image from the gallery
    HomeList(
        imagePath: 'assets/introduction_animation/introduction_animation.png',
        navigateScreen: DulioCore()),
  ];
}
