import 'package:project_1/model/UserName.dart';
import 'package:project_1/model/user_dob.dart';
import 'package:project_1/model/user_location.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDOB dob;
  final UserLocation location;
  User(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat,
      required this.name,
      required this.dob,
      required this.location});

  // factory Constructor- if we don't want to map in the user_api.dart file
  // we can put all the parsing logic in factory constructor
  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName(
      first: e['name']['first'],
      title: e['name']['title'],
      last: e['name']['last'],
    );
    final dob = UserDOB.fromMap(e['dob']);

    // final dob = UserDOB(
    //   age: e['dob']['age'],
    //   date: DateTime.parse(e['dob']['date']),
    // );

    final coordinates = UserLocationCoordinates(
        latitude: e['location']['coordinates']['latitude'],
        longitude: e['location']['coordinates']['longitude']);
    final timezone = UserTimezone(
        description: e['location']['timezone']['description'],
        offset: e['location']['timezone']['offset']);
    final location = UserLocation(
        city: e['location']['city'],
        state: e['location']['state'],
        country: e['location']['country'],
        postcode: e['location']['postcode'].toString(),
        coordinates: coordinates,
        timezone: timezone);
    return User(
        cell: e['cell'],
        email: e['email'],
        gender: e['gender'],
        nat: e['nat'],
        phone: e['phone'],
        name: name,
        dob: dob,
        location: location);
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
