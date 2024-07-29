import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationState extends StateNotifier<bool> {
  NotificationState() : super(false);
  void change() {
    state = true;
  }

  void opened() {
    state = false;
  }
}

final NotificationProvider =
    StateNotifierProvider<NotificationState, bool>((ref) {
  return NotificationState();
});
