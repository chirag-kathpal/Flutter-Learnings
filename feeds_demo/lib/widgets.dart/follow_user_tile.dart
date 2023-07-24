import 'package:feeds_demo/screens/select_user_page.dart';
import 'package:flutter/material.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

/// A UI widget that displays a [User] tile to follow/unfollow.
class FollowUserTile extends StatefulWidget {
  const FollowUserTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<FollowUserTile> createState() => _FollowUserTileState();
}

class _FollowUserTileState extends State<FollowUserTile> {
  bool _isFollowing = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    checkIfFollowing();
  }

  Future<void> checkIfFollowing() async {
    final result =
        await context.feedBloc.isFollowingFeed(followerId: widget.user.id!);
    _setStateFollowing(result);
  }

  Future<void> follow() async {
    try {
      _setStateFollowing(true);
      await context.feedBloc.followFeed(followeeId: widget.user.id!);
    } on Exception catch (e, st) {
      _setStateFollowing(false);
      debugPrint(e.toString());
      debugPrintStack(stackTrace: st);
    }
  }

  Future<void> unfollow() async {
    try {
      _setStateFollowing(false);
      context.feedBloc.unfollowFeed(unfolloweeId: widget.user.id!);
    } on Exception catch (e, st) {
      _setStateFollowing(true);
      debugPrint(e.toString());
      debugPrintStack(stackTrace: st);
    }
  }

  void _setStateFollowing(bool following) {
    setState(() {
      _isFollowing = following;
    });
  }

  @override
  Widget build(BuildContext context) {
    return UserTile(
      user: widget.user,
      trailing: TextButton(
        onPressed: () {
          if (_isFollowing) {
            unfollow();
          } else {
            follow();
          }
        },
        child: _isFollowing ? const Text('unfollow') : const Text('follow'),
      ),
    );
  }
}
