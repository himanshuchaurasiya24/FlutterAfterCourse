import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_family_modifier_multiple_values/user.dart';

// the second String in type define can be used to ask the required data Model
// final nameProvider =
//     Provider.family<String, String>((ref, name) => 'Hello $name');
final nameProvider = Provider.family<String, User>(
    (ref, user) => 'Hello ${user.name} ${user.address}');
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
    final name = ref.watch(
      nameProvider(
        const User(name: 'Chaurasiya', address: 'Ghazipur'),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple value family modifier'),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
