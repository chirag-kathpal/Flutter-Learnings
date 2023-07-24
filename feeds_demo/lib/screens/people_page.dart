import 'package:feeds_demo/widgets.dart/follow_user_tile.dart';
import 'package:flutter/material.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

import '../models/users.dart';

/// Page that displays all [User]s, enabling the current user to
/// follow/unfollow specific users.
class PeoplePage extends StatelessWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('People')),
      body: ListView(
        children: demoUsers
            .where((element) {
              return element.user.id != context.feedBloc.currentUser!.id;
            })
            .map((demoUser) => FollowUserTile(user: demoUser.user))
            .toList(),
      ),
    );
  }
}
