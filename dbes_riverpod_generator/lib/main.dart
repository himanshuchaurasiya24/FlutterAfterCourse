import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'main.g.dart';

// final nameProvider = Provider<String>((ref) {
//   final res = ref.watch(nameStateProvider);
//   return res;
// });
// final nameStateProvider = StateProvider((ref) => 'null');
@riverpod
String StringLabel(StringLabelRef ref) => 'Hello World!';
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
  // final textController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var res = ref.watch(nameProvider);
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Riverpod Generator'),
            centerTitle: true,
          ),
          body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'res',
                ),
                // TextField(
                //   controller: textController,
                //   onSubmitted: (value) {
                //     ref.read(nameStateProvider.notifier).state =
                //         value.toString();
                //   },
                // )
              ],
            ),
          ),
        ));
  }
}
