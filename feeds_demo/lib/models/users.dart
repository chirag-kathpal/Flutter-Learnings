import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

class DemoUser {
  final User user;
  final Token token;

  const DemoUser({
    required this.user,
    required this.token,
  });
}

const demoUsers = [
  DemoUser(
    user: User(
      id: 'sachaarbonel',
      data: {
        'handle': '@sachaarbonel',
        'first_name': 'Sacha',
        'last_name': 'Arbonel',
        'full_name': 'Sacha Arbonel',
        'profile_image': 'https://avatars.githubusercontent.com/u/18029834?v=4',
      },
    ),
    token: Token(
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic2FjaGFhcmJvbmVsIn0.LFn4ZWqRair_Szoj_FMvO7hLG-yvZO_INhFjba6mR5Y'),
  ),
  DemoUser(
    user: User(
      id: 'GroovinChip',
      data: {
        'handle': '@GroovinChip',
        'first_name': 'Reuben',
        'last_name': 'Turner',
        'full_name': 'Reuben Turner',
        'profile_image': 'https://avatars.githubusercontent.com/u/4250470?v=4',
      },
    ),
    token: Token(
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiR3Jvb3ZpbkNoaXAifQ.QUU71Z_pG-rAhIlNhRJL6v6zwlxoXhwWXtp9rJryils'),
  ),
  DemoUser(
    user: User(
      id: 'gordonphayes',
      data: {
        'handle': '@gordonphayes',
        'first_name': 'Gordon',
        'last_name': 'Hayes',
        'full_name': 'Gordon Hayes',
        'profile_image': 'https://avatars.githubusercontent.com/u/13705472?v=4',
      },
    ),
    token: Token(
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiZ29yZG9ucGhheWVzIn0.ZfvyrF4dgyET4RZ8B8Bz3hCLELVSt2fkxszCMxYVra8'),
  ),
];

extension UserData on User {
  String get handle => data?['handle'] as String? ?? '';
  String get firstName => data?['first_name'] as String? ?? '';
  String get lastName => data?['last_name'] as String? ?? '';
  String get fullName => data?['full_name'] as String? ?? '';
  String get profileImage => data?['profile_image'] as String? ?? '';
}
