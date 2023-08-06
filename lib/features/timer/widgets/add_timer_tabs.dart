import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pomodoro_app/features/timer/widgets/time_card.dart';

class AddTimerTabs extends StatefulWidget {
  const AddTimerTabs({super.key});

  @override
  State<AddTimerTabs> createState() => _AddTimerTabsState();
}

class _AddTimerTabsState extends State<AddTimerTabs> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  final TextEditingController _countController = TextEditingController();
  String _hours = "12";
  String _minutes = "00";
  Color _color = const Color(0xffffffff);
  Map<String, dynamic> _formData = {};

  void _showColorPicker() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ColorPicker(
              paletteType: PaletteType.hueWheel,
              pickerColor: Colors.white,
              onColorChanged: (color) {
                setState(() {
                  _color = color;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _timeStartPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        height: 300,
        child: CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hm,
          onTimerDurationChanged: (Duration value) {
            setState(() {
              if (value.inHours < 10) {
                _hours = "0${value.inHours}";
              } else {
                _hours = value.inHours.toString();
              }
              if (value.inMinutes >= 60) {
                final minutes = (value.inMinutes % 60);
                if (minutes < 10) {
                  _minutes = "0$minutes";
                } else {
                  _minutes = minutes.toString();
                }
              } else {
                if (value.inMinutes < 10) {
                  _minutes = "0${value.inMinutes}";
                } else {
                  _minutes = value.inMinutes.toString();
                }
              }
            });
          },
        ),
      ),
    );
  }

  void _onTapForUnFocus() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    _formData = {
      "title": _titleController.text,
      "description": _desController.text,
      "timer": "$_hours:$_minutes",
      "color": "$_color",
      "repeat": _countController.text,
    };
    Navigator.pop(context);
    print(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTapForUnFocus,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "타이머 이름",
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
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "타이머 글귀",
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
                  controller: _desController,
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "타이머 시간",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: _timeStartPicker,
                        child: TimeCard(
                          time: "$_hours:$_minutes",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "반복 횟수",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    // GestureDetector(
                    //   onTap: _onTapIntervalRepeat,
                    //   child: Expanded(
                    //     child: Container(
                    //       alignment: Alignment.centerRight,
                    //       padding: const EdgeInsets.symmetric(
                    //         horizontal: 20,
                    //         vertical: 15,
                    //       ),
                    //       decoration: BoxDecoration(
                    //         color: Colors.grey.shade300,
                    //         borderRadius: BorderRadius.circular(
                    //           10,
                    //         ),
                    //       ),
                    //       child: const Text(
                    //         "3",
                    //         style: TextStyle(
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.w700,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.number,
                        controller: _countController,
                        decoration: InputDecoration(
                          isDense: true,
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
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "타이머 색상",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: _showColorPicker,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: _color,
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: _onSubmit,
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                      child: const Text(
                        "등록",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
