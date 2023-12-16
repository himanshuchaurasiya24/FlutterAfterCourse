import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

final numberProvider =
    StateNotifierProvider<NumberNotifier, List<String>>((ref) {
  return NumberNotifier();
});

class NumberNotifier extends StateNotifier<List<String>> {
  NumberNotifier() : super(['number 12', 'number 30']);
  void add(String number) {
    state = [...state, number];
  }

  void remove(String number) {
    state = [...state.where((element) => element != number)];
  }

  void update(String old, String newNumber) {
    final updatedList = <String>[];
    for (int i = 0; i < state.length; i++) {
      if (state[i] == old) {
        updatedList.add(newNumber);
      } else {
        updatedList.add(state[i]);
      }
    }
    state = updatedList;
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numbers = ref.watch(numberProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref
              .read(numberProvider.notifier)
              .add('number ${Random().nextInt(100)}');
        },
        label: const Icon(Icons.add),
      ),
      body: Center(
        child: ListView(
          children: numbers
              .map((e) => GestureDetector(
                    onTap: () {
                      ref.read(numberProvider.notifier).remove(e);
                    },
                    onLongPress: () {
                      ref
                          .read(numberProvider.notifier)
                          .update(e, 'number ${Random().nextInt(100)}');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(e),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
