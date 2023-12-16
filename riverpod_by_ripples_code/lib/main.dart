import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) {
  return 'Hello World';
});
final counterProvider = StateProvider<int>((ref) {
  return 0;
});
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
// 1st way here the whole ui will be rebuild;

// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final name = ref.watch(nameProvider);
//     return Scaffold(
//       body: Center(
//         child: Text(name),
//       ),
//     );
//   }
// }
//
//
//
// 2nd here only the text widget will be rebuild
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     debugPrint('ui rebuild');
//     return Scaffold(
//       body: Center(
//         // here only the text widget will be rebuild because it is inside of the consumer widget;
//         child: Consumer(builder: (context, ref, child) {
//           final name = ref.watch(nameProvider);
//           return Text(name);
//         }),
//       ),
//     );
//   }
// }

// 3rd method when the widget is a stateful widget
// class MyHomePage extends ConsumerStatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends ConsumerState<MyHomePage> {
//   // another method for accessing the nameProvider is in initState;
//   @override
//   void initState() {
//     final name = ref.read(nameProvider);
//     debugPrint(name);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final name = ref.watch(nameProvider);

//     return Scaffold(
//       body: Center(
//         child: Text(name),
//       ),
//     );
//   }
// }

// 4th method
class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Center(
        child: Text(
          count.toString(),
          style: const TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        label: const Icon(Icons.add_outlined),
      ),
    );
  }
}
