import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ripples_code_navigation_bar/gallery.dart';
import 'package:ripples_code_navigation_bar/home.dart';
import 'package:ripples_code_navigation_bar/navigation_notifier.dart';
import 'package:ripples_code_navigation_bar/person.dart';

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
    final index = ref.watch(navigationNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Bar'),
        centerTitle: true,
      ),
      body: [const Home(), const Gallery(), const Person()][index],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
            selectedIcon: Icon(Icons.home_outlined),
          ),
          NavigationDestination(
            icon: Icon(Icons.browse_gallery),
            label: 'Gallery',
            selectedIcon: Icon(Icons.browse_gallery_outlined),
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Person',
            selectedIcon: Icon(Icons.person_outlined),
          ),
        ],
        selectedIndex: index,
        indicatorColor: Colors.deepPurple.shade200,
        onDestinationSelected: (value) {
          ref.read(navigationNotifierProvider.notifier).setSelectedIndex(value);
        },
      ),
    );
  }
}
