import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pomodoro_app/features/timer/main_timer_screen.dart';
import 'package:pomodoro_app/features/timer/widgets/add_timer_tabs.dart';
import 'package:pomodoro_app/features/timer/widgets/timers_listtile.dart';

class TimersScreen extends StatefulWidget {
  const TimersScreen({super.key});

  @override
  State<TimersScreen> createState() => _TimersScreenState();
}

class _TimersScreenState extends State<TimersScreen> {
  void _onMoveDetailTimer() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MainTimerScreen(),
      ),
    );
  }

  void _onTapAddTab() {
    showModalBottomSheet(
      isDismissible: true,
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: GestureDetector(
          onTap: _onTapAddTab,
          child: Container(
            padding: const EdgeInsets.all(
              15,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
            child: const FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Pomodoro",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                for (var i = 0; i < 5; i++) ...[
                  GestureDetector(
                    onTap: _onMoveDetailTimer,
                    child: const TimerListTile(),
                  ),
                  const Divider(
                    height: 10,
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
