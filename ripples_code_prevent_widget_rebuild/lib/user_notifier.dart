import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ripples_code_prevent_widget_rebuild/user.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);
  void updateName(String newName) {
    state = state.copyWith(name: newName);
  }

  void updateAddress(String newAddress) {
    state = state.copyWith(address: newAddress);
  }
}
