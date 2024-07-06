import 'dart:math';

import 'package:square/providers/base_model.dart';

class AppProvider extends BaseModel {
  // =============         App Variables              ============= //

  // ===========>
  int _bottomNavIndex = 0;

  /// Manages the index of the bottom navigation bar.
  int get bottomNavIndex => _bottomNavIndex;
  setBottomNavIndex(int value) async {
    _bottomNavIndex = value;
    notifyListeners();
  }
  // <===========

  // ================================================================= //
  // ================================================================= //
  // ================================================================= //
  // ================================================================= //
  // ================================================================= //
  // ================================================================= //

  // =============         App Methods                  ============= //

  init() async {}

  rollDice() => Random().nextInt(10) > 6;

  // ================================================================= //
}
