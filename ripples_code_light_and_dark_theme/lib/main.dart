import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<bool>((ref) => true);
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: isLightTheme ? ThemeData.light() : ThemeData.dark(),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Theming'),
        centerTitle: true,
      ),
      body: Center(
        child: Switch(
          value: isLightTheme,
          onChanged: (value) {
            ref.read(themeProvider.notifier).state = value;
          },
        ),
      ),
    );
  }
}
