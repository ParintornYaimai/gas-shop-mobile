// lib/utils/size_extensions.dart
import 'package:flutter/material.dart';

extension ResponsiveContext on BuildContext {
  double wp(double percentage) => MediaQuery.of(this).size.width * percentage / 100;
  double hp(double percentage) => MediaQuery.of(this).size.height * percentage / 100;
  double sp(double percentage) => MediaQuery.of(this).size.width * percentage / 100;
  
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  
  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;
}