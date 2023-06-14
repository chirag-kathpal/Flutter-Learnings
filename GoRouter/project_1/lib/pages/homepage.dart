import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_1/project/routes/app_routes_constants.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Center(
            child: Text('Home'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context)
                  .pushNamed(MyAppRouteConstants.aboutRouteName);
            },
            child: Text('About Page'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(
                  MyAppRouteConstants.profileRouteName,
                  params: {'userName': 'Chirag Kathpal', 'userId': '14'});
            },
            child: Text('Profile Page'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context)
                  .pushNamed(MyAppRouteConstants.contactUsRouteName);
            },
            child: Text('Contact_us page'),
          ),
        ],
      ),
    );
  }
}
