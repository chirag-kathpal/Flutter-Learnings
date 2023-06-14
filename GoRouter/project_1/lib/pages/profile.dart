// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String userName;
  final String userId;
  const Profile({
    Key? key,
    required this.userName,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: Center(
              child: Text('Profile'),
            ),
          ),
          Text(userName),
          Text(userId),
        ],
      ),
    );
  }
}
