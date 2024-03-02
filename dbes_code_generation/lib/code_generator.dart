import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'code_generator.g.dart';

@riverpod
class CodeState extends _CodeState {
  @override
  String build() {
    return '';
  }

  void setStart(String newState) {
    state = newState;
  }
}
