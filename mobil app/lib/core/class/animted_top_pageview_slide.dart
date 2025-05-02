import 'dart:async';

import 'package:flutter/material.dart';

class AnimtedTopPageviewSlide {
  final PageController pageController;

  final int? totalPages;

  AnimtedTopPageviewSlide(this.pageController, this.totalPages);
  Timer? timer;
  int currentPage = 0;
  onPageChanged(int index) {
    currentPage = index;
   
  }

  onDotPreass(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
  }

  void startAutoScroll() {
    timer = Timer.periodic(const Duration(seconds: 7), (Timer timer) {
      if (currentPage < totalPages! - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
         duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }
}
