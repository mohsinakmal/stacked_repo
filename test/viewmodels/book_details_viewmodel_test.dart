import 'package:flutter_test/flutter_test.dart';
import 'package:stacked_state_management/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('BookDetailsViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}