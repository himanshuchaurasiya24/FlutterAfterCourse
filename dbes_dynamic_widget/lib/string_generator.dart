import 'package:flutter_riverpod/flutter_riverpod.dart';

class StringGenerator extends Notifier<List<String>> {
  @override
  List<String> build() {
    return [];
  }

  void addString(String randomString) {
    state = [...state, randomString];
  }

  void remove(String remove) {
    // state = [...state.where((element) => element != remove)];
    state.remove(remove);
    state = [...state];
  }

  void clear() {
    state = [];
  }
}

var stringNotifierProvider =
    NotifierProvider<StringGenerator, List<String>>(StringGenerator.new);
