import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tagNumber = 0;

  void _onTapSomeDay() {
    setState(() {
      _tagNumber = 0;
    });
  }

  void _onTapPomodoro() {
    setState(() {
      _tagNumber = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Logo",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "오늘 할 일",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // 오늘 할 일 진행도
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 20,
                            right: 20,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: _onTapSomeDay,
                                child: AnimatedContainer(
                                  duration: const Duration(
                                    milliseconds: 300,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _tagNumber == 0
                                        ? Colors.white
                                        : Colors.grey.shade300,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    "오늘 할 일",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: _tagNumber == 0
                                          ? Colors.black
                                          : Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: _onTapPomodoro,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _tagNumber == 1
                                        ? Colors.white
                                        : Colors.grey.shade300,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    "내일 할 일",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: _tagNumber == 1
                                          ? Colors.black
                                          : Colors.grey.shade200,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 25,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "코딩",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  CustomPaint(
                                    size: const Size(285, 10),
                                    painter: BarPainter(),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "독서",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  CustomPaint(
                                    size: const Size(285, 8),
                                    painter: BarPainterForBook(),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "운동",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  CustomPaint(
                                    size: const Size(285, 8),
                                    painter: BarPainterForExercise(),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //참여중인 챌린지
                Text(
                  "참여중인 일정",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    constraints: const BoxConstraints(
                      minHeight: 200,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                    ),
                    child: Center(
                      child: Text(
                        "현재 참여중인 일정이 없습니다.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bgLine = Paint()
      ..color = Colors.grey.shade200
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final fillLine = Paint()
      ..color = Colors.deepPurple.shade400
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawLine(const Offset(0, 5), Offset(size.width, 5), bgLine);
    canvas.drawLine(const Offset(0, 5), Offset(size.width - 50, 5), fillLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BarPainterForBook extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bgLine = Paint()
      ..color = Colors.grey.shade200
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final fillLine = Paint()
      ..color = Colors.red.shade400
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawLine(const Offset(0, 5), Offset(size.width, 5), bgLine);
    canvas.drawLine(const Offset(0, 5), Offset(size.width - 80, 5), fillLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BarPainterForExercise extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bgLine = Paint()
      ..color = Colors.grey.shade200
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final fillLine = Paint()
      ..color = Colors.green.shade400
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawLine(const Offset(0, 5), Offset(size.width, 5), bgLine);
    canvas.drawLine(const Offset(0, 5), Offset(size.width - 20, 5), fillLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
