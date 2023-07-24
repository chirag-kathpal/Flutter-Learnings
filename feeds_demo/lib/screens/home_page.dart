import 'package:feeds_demo/screens/people_page.dart';
import 'package:feeds_demo/screens/profile_page.dart';
import 'package:feeds_demo/screens/timeline_page.dart';
import 'package:flutter/material.dart';

/// Home page of the sample application.
///
/// Provides navigation to the rest of the app through a [PageView].
///
/// Pages:
/// - [TimelinePage] (default)
/// - [ProfilePage]
/// - [PeoplePage]
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          TimelinePage(),
          ProfilePage(),
          PeoplePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          _pageController.jumpToPage(value);
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.timeline), label: 'timeline'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'people'),
        ],
      ),
    );
  }
}
