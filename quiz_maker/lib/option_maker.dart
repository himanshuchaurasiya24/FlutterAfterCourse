class OptionMaker {
  final List<String> answers;
  OptionMaker({required this.answers});
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
