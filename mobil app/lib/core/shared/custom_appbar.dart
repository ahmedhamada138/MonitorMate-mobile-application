import 'package:flutter/material.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';

PreferredSize appBar(String title,{double height=50}) {
  return PreferredSize(
    preferredSize:  Size.fromHeight(height), // ارتفاع الـ AppBar
    child: AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colorapp.primaryColorgradint, Colorapp.primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      title:  Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      elevation: 0, // إزالة الظل
      backgroundColor: Colors.transparent, // ضروري ليعمل التدرج
    ),
  );
}
