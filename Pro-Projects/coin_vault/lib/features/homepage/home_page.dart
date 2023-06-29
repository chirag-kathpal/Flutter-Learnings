import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:coin_vault/features/app_screens/daily_screen.dart';
import 'package:coin_vault/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int pageIndex = 0;
  List<Widget> pages = [
    DailyScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: SafeArea(
        child: SizedBox(
          child: FloatingActionButton(
            backgroundColor: buttonColor,
            // shape:
            //     BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {},
            child: const Icon(
              Icons.add,
              size: 20,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      CupertinoIcons.home,
      CupertinoIcons.creditcard,
      CupertinoIcons.money_dollar,
      CupertinoIcons.person,
    ];
    return AnimatedBottomNavigationBar(
      onTap: (index) {
        setTabs(index);
      },
      backgroundColor: primary,
      icons: iconItems,
      splashColor: secondary,
      inactiveColor: black.withOpacity(0.5),
      gapLocation: GapLocation.center,
      activeIndex: pageIndex,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      elevation: 2,
    );
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
