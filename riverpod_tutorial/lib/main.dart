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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

final counterStateProvider = StateProvider<int>(
  (ref) {
    return 0;
  },
);

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('state build again');
    var value = ref.watch(counterStateProvider);
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          children: [
            FloatingActionButton.extended(
              onPressed: () => ref.read(counterStateProvider.state).state++,
              label: const Text('+'),
            ),
            Expanded(
              child: Container(),
            ),
            FloatingActionButton.extended(
              onPressed: () => ref.read(counterStateProvider.state).state--,
              label: const Text('-'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Value: $value',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
