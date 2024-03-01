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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod App'),
        ),
        body: const SelectedButton(),
      ),
    );
  }
}

final isRedProvider = Provider<bool>((ref) {
  final color = ref.watch(selectedButtonProvider);
  return color == 'red';
});
final selectedButtonProvider = StateProvider<String>((ref) => '');

class SelectedButton extends ConsumerWidget {
  const SelectedButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(isRedProvider);
    debugPrint('Rebuilt');
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          res.toString(),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(selectedButtonProvider.notifier).state = 'red';
          },
          child: const Text('Red'),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(selectedButtonProvider.notifier).state = 'blue';
          },
          child: const Text('Blue'),
        ),
      ],
    ));
  }
}
