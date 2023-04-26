void main() {
  //List of prices
  List prices = [1, 1.99, 4];

  print("Price listing:");

  //priceList() is being called on `prices` list
  //and returns the list of prices
  print(prices.priceList());
  print(prices.labelCount);

  'someString'.isValidEmail;
  var digit = 1.addTen();
  print(digit);

  var number = 3.addtwo;
  print(number);

  print(5.cubed);
  print(6.squared());
}

// To make an extension, you use the following syntax:
// extension on SomeClass {
// // your custom code
// }

// You may give the extension itself a name if you like. In that
// case the syntax is as follows:
// extension YourExtensionName on ClassName {
// // your custom code
// }

extension<T> on List<T> {
  //Extension Method demonstration
  List<T> priceList() => this.map((item) => item).toList();
  int get labelCount => length * 3;
}

extension StringExtensions on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }
}

extension IntExtensions on int {
  int addTen() => this + 10;
  int get addtwo => this + 2;
}

extension DoubleExtensions on double {
  double addTen() => this + 10;
}
// Get
// Rather than making a normal method, you can use a
// getter method. This makes it so that you can call the
// extension using encoded , without the parentheses,
// rather than encoded() .

extension on int {
  int get cubed => this * this * this;
  int squared() {
    return this * this;
  }
}
