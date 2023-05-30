import 'package:flutter_test/flutter_test.dart';
import 'package:project_1/counter.dart';

void main() {
  // pretest
  // setUp(() => null);
  // setUpAll(() => null);

  // setup is called before every test and setupAll is called before all tests

  // Testing
  group('Counter Class - ', () {
    // description - given, when, then
    test(
      'given counter class when it is instantiated then value of count should be 0',
      () {
        // Arrange
        final Counter counter = Counter();
        // Act
        final val = counter.count;
        // assert
        expect(val, 0);
      },
    );

    test(
      'given counter class when it is incremented then the value of count should be 1',
      () {
        final Counter counter = Counter();
        counter.incrementCounter();
        final val = counter.count;
        expect(val, 1);
      },
    );

    test('given counter class when it is decremented should be -1', () {
      final Counter counter = Counter();
      counter.decrementCounter();
      final val = counter.count;
      expect(val, -1);
    });
  });

  test(
      'given counter class when it is reset then the value of count should be 0',
      () {
    final Counter counter = Counter();
    counter.reset();
    final val = counter.count;
    expect(val, 0);
  });

  // posttest
  // tearDown(() => null);
  // tearDownAll(() => null);

  // teardown is called after each test and teardownall is called after all the tests
}

// for models class
// expect(user,isA<User>());