import 'dart:math';

import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "hell",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          bottom: TabBar(
            tabs: const [
              Tab(
                text: "타이머",
              ),
              Tab(
                text: "일정",
              ),
            ],
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade900,
              fontSize: 17,
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
