import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//to pass data to the provider we can use family modifier

final nameProvider = Provider.family<String, String>(
  // name parameter will be displayed here
  // limitation only single value can be passed from here
  (ref, name) => 'Himanshu $name',
);
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
      home: const Main(),
    );
  }
}

class Main extends ConsumerStatefulWidget {
  const Main({Key? key}) : super(key: key);
  @override
  _MainState createState() => _MainState();
}

class _MainState extends ConsumerState<Main> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider('Chaurasiya'));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Modifier'),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
