import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/models.dart';

class FetchUserApi {
  static Future<List<User>> fetchUsers() async {
    // print('fetch Users');
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;

    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();

    // final users = results.map((e) {
    //   final name = UserName(
    //     first: e['name']['first'],
    //     title: e['name']['title'],
    //     last: e['name']['last'],
    //   );
    //   final dob = UserDOB(
    //     age: e['dob']['age'],
    //     date: DateTime.parse(e['dob']['date']),
    //   );
    //   final coordinates = UserLocationCoordinates(
    //       latitude: e['location']['coordinates']['latitude'],
    //       longitude: e['location']['coordinates']['longitude']);
    //   final timezone = UserTimezone(
    //       description: e['location']['timezone']['description'],
    //       offset: e['location']['timezone']['offset']);
    //   final location = UserLocation(
    //       city: e['location']['city'],
    //       state: e['location']['state'],
    //       country: e['location']['country'],
    //       postcode: e['location']['postcode'].toString(),
    //       coordinates: coordinates,
    //       timezone: timezone);
    //   return User(
    //       cell: e['cell'],
    //       email: e['email'],
    //       gender: e['gender'],
    //       nat: e['nat'],
    //       phone: e['phone'],
    //       name: name,
    //       dob: dob,
    //       location: location);
    // }).toList();
    // print('Fetch users completed');
    return users;
  }
}
