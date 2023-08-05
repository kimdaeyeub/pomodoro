import 'package:day_picker/day_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTimerTabs extends StatefulWidget {
  const AddTimerTabs({super.key});

  @override
  State<AddTimerTabs> createState() => _AddTimerTabsState();
}

class _AddTimerTabsState extends State<AddTimerTabs> {
  final List<DayInWeek> _days = [
    DayInWeek("월", dayKey: "monday"),
    DayInWeek("화", dayKey: "tuesday"),
    DayInWeek("수", dayKey: "wednesday"),
    DayInWeek("목", dayKey: "thursday"),
    DayInWeek("금", dayKey: "friday"),
    DayInWeek("토", dayKey: "saturday"),
    DayInWeek("일", dayKey: "sunday"),
  ];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  String _hours = "12";
  String _minutes = "00";

  void _timeStartPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 300,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hm,
          onTimerDurationChanged: (Duration value) {
            setState(() {
              if (value.inHours < 10) {
                _hours = "0${value.inHours}";
              } else {
                _hours = value.inHours.toString();
              }
              if (value.inMinutes > 60) {
                final minutes = (value.inMinutes % 60);
                if (minutes < 10) {
                  _minutes = "0$minutes";
                } else {
                  _minutes = minutes.toString();
                }
              } else {
                _minutes = value.inMinutes.toString();
              }
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "타이머 추가",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "반복 횟수",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "반복 횟수",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "반복 횟수",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: const Text("3"),
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: _timeStartPicker,
                child: TimeCard(
                  time: "$_hours:$_minutes",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeCard extends StatelessWidget {
  final String time;
  const TimeCard({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "타이머 시간",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade400,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              time,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
