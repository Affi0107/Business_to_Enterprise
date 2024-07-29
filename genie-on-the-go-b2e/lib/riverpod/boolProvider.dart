import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoolState extends StateNotifier<List<bool>> {
  BoolState() : super([false, false, false, false, false, false, false, false]);

  // Function to set all booleans to true
  void setAllTrue(int index) {
    var ls = state;
    ls[index - 1] = true;
    state = ls;
  }
}

final BoolProvider =
    StateNotifierProvider<BoolState, List<bool>>((ref) => BoolState());
