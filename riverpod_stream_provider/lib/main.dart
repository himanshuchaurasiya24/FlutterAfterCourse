import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(const Duration(seconds: 2), ((computationCount) {
    return computationCount;
  }));
});
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// future provider and stream provider is more or less the same but stream provider can be used to fetch data from a real time database like firebase firestore;
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
    final streamData = ref.watch(streamProvider);
    debugPrint(
      streamData.toString(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: streamData.when(data: (data) {
        return Center(
          child: Text(
            data.toString(),
          ),
        );
      }, error: (objectTrace, error) {
        return Center(
          child: Text(error.toString()),
        );
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
