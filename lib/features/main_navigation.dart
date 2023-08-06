import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pomodoro_app/features/home_screen.dart';
import 'package:pomodoro_app/features/timer/timers_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final GlobalKey<NavigatorState> _timerScreenKey = GlobalKey<NavigatorState>();
  int _selectedIndex = 1;

  void _onTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) => _onTap(value),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.house,
              color: Colors.black,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.hourglassHalf,
              color: Colors.black,
            ),
            label: "Timer",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.black,
            ),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.bookmark,
              color: Colors.black,
            ),
            label: "Community",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.gear,
              color: Colors.black,
            ),
            label: "Settings",
          ),
        ],
      ),
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: Navigator(
              key: _timerScreenKey,
              onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => const TimersScreen(),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const Center(
              child: Text(
                "Add",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const Center(
              child: Text(
                "Community",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const Center(
              child: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
