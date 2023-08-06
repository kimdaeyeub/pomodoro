import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pomodoro_app/features/timer/widgets/timer_painter.dart';

class TimerListTile extends StatelessWidget {
  const TimerListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CustomPaint(
        size: const Size(50, 50),
        painter: TimerPainter(
          color: Colors.red,
          endPoint: 1 / 3,
        ),
      ),
      trailing: const FaIcon(
        FontAwesomeIcons.chevronRight,
        size: 15,
      ),
      title: const Text(
        "코딩",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: const Row(
        children: [
          Text(
            "목표시간:",
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "2시간",
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "반복 횟수",
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "3회",
          )
        ],
      ),
    );
  }
}
