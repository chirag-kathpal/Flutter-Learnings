import 'package:coin_vault/theme/colors.dart';
import 'package:flutter/material.dart';

class DailyScreen extends StatefulWidget {
  const DailyScreen({super.key});

  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.03),
                  spreadRadius: 10,
                  blurRadius: 3,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 25,
                right: 20,
                left: 20,
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.bar_chart),
                      Icon(Icons.more_vert),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/profile.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        width: (size.width - 40) * 0.6,
                        child: Column(
                          children: [
                            Text(
                              'Andrew Cliff',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: mainFontColor,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
