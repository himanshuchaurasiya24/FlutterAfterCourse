import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'player_notifier.g.dart';

@riverpod
class PlayerNotifier extends _$PlayerNotifier {
  final List<Map<String, dynamic>> allPlayers = [
    {'name': 'Rohit Sharma', 'country': 'India'},
    {'name': 'Virat Kohli', 'country': 'India'},
    {'name': 'Glen Maxwell', 'country': 'Australia'},
    {'name': 'Aron Finch', 'country': 'Australia'},
    {'name': 'Martin Guptil', 'country': 'New Zealand'},
    {'name': 'Trent Boult', 'country': 'New Zealand'},
    {'name': 'David Miller', 'country': 'South Africa'},
    {'name': 'Kagiso Rabada', 'country': 'South Africa'},
    {'name': 'Chris Gayle', 'country': 'West Indies'},
    {'name': 'Jason Holder', 'country': 'West Indies'},
  ];
  @override
  build() {
    return allPlayers;
  }

  void filterPlayer(String playerName) {
    List<Map<String, dynamic>> results = [];
    if (playerName.isEmpty) {
      results = allPlayers;
    } else {
      results = state.where((element) {
        return element['name']
            .toString()
            .toLowerCase()
            .contains(playerName.toLowerCase());
      }).toList();
    }
    state = results;
  }
}





















// @riverpod
// class PlayerNotifier extends _$PlayerNotifier {
//   final List<Map<String, dynamic>> allPlayers = [
//     {'name': 'Rohit Sharma', 'country': 'India'},
//     {'name': 'Virat Kohli', 'country': 'India'},
//     {'name': 'Glen Maxwell', 'country': 'Australia'},
//     {'name': 'Aron Finch', 'country': 'Australia'},
//     {'name': 'Martin Guptil', 'country': 'New Zealand'},
//     {'name': 'Trent Boult', 'country': 'New Zealand'},
//     {'name': 'David Miller', 'country': 'South Africa'},
//     {'name': 'Kagiso Rabada', 'country': 'South Africa'},
//     {'name': 'Chris Gayle', 'country': 'West Indies'},
//     {'name': 'Jason Holder', 'country': 'West Indies'},
//   ];
//   @override
//   build() {
//     return allPlayers;
//   }

//   void filterPlayer(String playerName) {
//     List<Map<String, dynamic>> results = [];
//     if (playerName.isEmpty) {
//       results = allPlayers;
//     } else {
//       results = state.where(
//         (element) => element['name'].toString().contains(
//               playerName.toLowerCase(),
//             ),
//       );
//     }
//   }
// }
