class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final UserLocationCoordinates coordinates;
  final UserTimezone timezone;

  UserLocation(
      {required this.city,
      required this.state,
      required this.country,
      required this.postcode,
      required this.coordinates,
      required this.timezone});
}

class UserLocationCoordinates {
  final String latitude;
  final String longitude;

  UserLocationCoordinates({required this.latitude, required this.longitude});
}

class UserTimezone {
  final String offset;
  final String description;

  UserTimezone({required this.description, required this.offset});
}
