import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                  margin: const EdgeInsets.all(0),
                  decoration: BoxDecoration(color: Colors.amber),
                  accountName: const Text('Chirag'),
                  accountEmail: const Text('chiragkath7@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/login-image.png'),
                  ))),
        ],
      ),
    );
  }
}
