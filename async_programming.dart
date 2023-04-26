void main() async {
  var test = getNumber(6);
  var sub = test.listen((event) {
    print(event);
  });
  await Future.delayed(Duration(seconds: 7));
  sub.cancel();
  print("Hello");
}

Stream<int> getNumber(int count) async* {
  int k = 0;
  while (k < count) {
    await Future.delayed(Duration(seconds: 1));
    yield k++;
  }
}

//    Future<void> printDelayedMessage() {
//       return  Future.delayed(Duration(seconds: 4), () => print('Delayed Output.'));
// }

// void main() {
//   printDelayedMessage();
//   print('First output ...');
// }