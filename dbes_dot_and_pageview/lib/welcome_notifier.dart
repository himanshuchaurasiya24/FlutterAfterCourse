import 'package:dbes_dot_and_pageview/welcome_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomeNotifier extends StateNotifier<WelcomeState> {
  WelcomeNotifier() : super(const WelcomeState());
  void pageChanged(int page) {
    state = state.copyWith(page: page);
  }
}

final welcomeProvider =
    StateNotifierProvider<WelcomeNotifier, WelcomeState>((ref) {
  return WelcomeNotifier();
});
