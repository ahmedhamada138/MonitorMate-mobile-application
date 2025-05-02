import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HeartbeatEffect extends StatefulWidget {
  final RxString heartRate;
  final String icon;

  const HeartbeatEffect({super.key, required this.heartRate, required this.icon});

  @override
  _HeartbeatEffectState createState() => _HeartbeatEffectState();
}

class _HeartbeatEffectState extends State<HeartbeatEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // إعداد المتحكم للتحريك
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300), // مدة التأثير
      vsync: this,
    );

    // إعداد التحريك لتغيير الحجم من 1.0 إلى 1.2 ثم العودة إلى 1.0
    _animation = Tween(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse(); // العودة إلى الحجم الأصلي
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // التخلص من المتحكم لتجنب تسريب الذاكرة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value, // تغيير الحجم بناءً على التحريك
            child: SvgPicture.asset(
              widget.icon, // مسار الأيقونة
              // color: iconColor, // تغيير لون الأيقونة
              width: 50,
              height: 60,
            ),
          );
        },
      ),
    );
    // Obx(() {
    //   // تشغيل التأثير عند تغيير القيمة

    //   // تحديد لون الأيقونة بناءً على القيمة
    //   // Color iconColor = ;

    //   return
    // });
  }

 
}
