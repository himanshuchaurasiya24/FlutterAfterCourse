import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

// to use the state notifier class we have to create another type of provider that is statenotifierprovider
final numberProvider =
    StateNotifierProvider<NumberNotifier, List<String>>((ref) {
  return NumberNotifier();
});

class NumberNotifier extends StateNotifier<List<String>> {
  NumberNotifier()
      : super(
          ['number 12', 'number 30'],
        );
  void add(String number) {
    state = [...state, number];
  }

  void remove(String number) {
    state = [
      ...state.where(
        (element) => element != number,
      )
    ];
  }

  void update(String oldNumber, String newNumber) {
    final updatedList = <String>[];
    for (int i = 0; i < state.length; i++) {
      if (state[i] == oldNumber) {
        updatedList.add(newNumber);
      } else {
        updatedList.add(state[i]);
      }
    }
    state = updatedList;
    debugPrint('updated');
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(numberProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Crud'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref
              .read(numberProvider.notifier)
              .add('number ${Random().nextInt(100) + 1}');
        },
        label: const Text('Add'),
      ),
      body: Center(
        child: ListView(
          children: res
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    ref.read(numberProvider.notifier).remove(e);
                  },
                  onLongPress: () {
                    ref
                        .read(numberProvider.notifier)
                        .update(e, 'number ${Random().nextInt(100) + 1}');
                  },
                  child: Text(e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
