import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pomodoro_app/features/timer/widgets/add_timer_tabs.dart';

class MainTimerScreen extends StatefulWidget {
  const MainTimerScreen({super.key});

  @override
  State<MainTimerScreen> createState() => _MainTimerScreenState();
}

class _MainTimerScreenState extends State<MainTimerScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _playButtonAnimation = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 300,
    ),
  );
  bool _isPlaying = false;

  void _togglePlay() {
    if (_playButtonAnimation.isCompleted) {
      _playButtonAnimation.reverse();
    } else {
      _playButtonAnimation.forward();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  final List<String> _tabs = [
    "hell",
    "hello",
  ];

  void _onTapAddTab() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        height: 850,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13),
            topRight: Radius.circular(13),
          ),
        ),
        child: const AddTimerTabs(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: GestureDetector(
          onTap: _onTapAddTab,
          child: Container(
            padding: const EdgeInsets.all(
              10,
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: const FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.white,
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text(
            "hell",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Container(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: Size(size.width - 60, 400),
                    painter: TimerPainter(),
                  ),
                  GestureDetector(
                    onTap: _togglePlay,
                    child: AnimatedIcon(
                      size: 70,
                      icon: AnimatedIcons.pause_play,
                      progress: _playButtonAnimation,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 타이머 틀
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final bgPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;
    canvas.drawCircle(center, radius, bgPaint);

    // 타이머 진행도
    final progressPaint = Paint()
      ..color = Colors.grey.shade900
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..strokeCap = StrokeCap.round;

    final progressRect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawArc(progressRect, -1 / 2 * pi, 3 / 2 * pi, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
