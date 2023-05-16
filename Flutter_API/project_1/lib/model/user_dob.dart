class UserDOB {
  final int age;
  final DateTime date;

  UserDOB({required this.age, required this.date});

  factory UserDOB.fromMap(Map<String,dynamic> json){
    return UserDOB(
      age: json['age'],
      date: DateTime.parse(json['date']),
    );
  }
}
