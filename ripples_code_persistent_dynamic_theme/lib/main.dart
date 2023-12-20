import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLightTheme = StateProvider<bool>((ref) {
  return true;
});
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lightTheme = ref.watch(isLightTheme);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme ? ThemeData.light() : ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lightTheme = ref.watch(isLightTheme);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persitent Dynamic Theme'),
        centerTitle: true,
      ),
      body: Center(
        child: IconButton(
            onPressed: () {
              ref.read(isLightTheme.notifier).state = !lightTheme;
            },
            icon: const Icon(Icons.night_shelter)),
      ),
    );
  }
}
