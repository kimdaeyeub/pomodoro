import 'package:day_picker/day_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTimerTabs extends StatefulWidget {
  const AddTimerTabs({super.key});

  @override
  State<AddTimerTabs> createState() => _AddTimerTabsState();
}

class _AddTimerTabsState extends State<AddTimerTabs>
    with SingleTickerProviderStateMixin {
  final List<DayInWeek> _days = [
    DayInWeek("월", dayKey: "monday"),
    DayInWeek("화", dayKey: "tuesday"),
    DayInWeek("수", dayKey: "wednesday"),
    DayInWeek("목", dayKey: "thursday"),
    DayInWeek("금", dayKey: "friday"),
    DayInWeek("토", dayKey: "saturday"),
    DayInWeek("일", dayKey: "sunday"),
  ];

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 300,
    ),
  );

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _desController = TextEditingController();

  late final Animation<Offset> _position =
      Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
          .animate(_animationController);

  void _timePicker() {
    _animationController.forward();
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
              SelectWeekDays(
                width: 300,
                onSelect: (value) {
                  print(value);
                },
                days: _days,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.transparent,
                unSelectedDayTextColor: Colors.black,
                border: false,
                selectedDayTextColor: Colors.white,
                daysFillColor: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: "이름",
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
              const SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "상세 설명",
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
              ElevatedButton(
                onPressed: _timePicker,
                child: const Icon(
                  Icons.plus_one,
                ),
              ),
              SlideTransition(
                position: _position,
                child: CupertinoTimerPicker(
                  onTimerDurationChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
