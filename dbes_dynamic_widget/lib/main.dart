import 'dart:math';

import 'package:dbes_dynamic_widget/string_generator.dart';
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> randomStringList = ref.watch(stringNotifierProvider);
    final random = Random();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Widget'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // first for dynamic child

            Column(
              children: [
                ...randomStringList.map(
                  (e) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          bottom: 10,
                          top: 5,
                        ),
                        height: 30,
                        width: 280,
                        color: Colors.blue,
                        child: Text(
                          e,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: const Icon(Icons.remove),
                        onTap: () {
                          ref.read(stringNotifierProvider.notifier).remove(e);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
            // second child
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    ref.read(stringNotifierProvider.notifier).addString(
                        'This is the random String ${random.nextInt(1000) + 1}');
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                  label: const Text('Add'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    ref.read(stringNotifierProvider.notifier).clear();
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.red,
                  ),
                  label: const Text('Clear'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
