import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_future_provider/api_service.dart';
import 'package:flutter_riverpod_future_provider/user_model.dart';

final apiProvider = Provider<ApiService>(
  (ref) => ApiService(),
);
final userDataProvider = FutureProvider<List<UserModel>>((ref) {
  return ref.read(apiProvider).getUser();
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: userData.when(data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(
                  data[index].id.toString(),
                ),
                Text(
                  data[index].name,
                ),
                Text(
                  data[index].color,
                ),
                Text(
                  data[index].pantone_value,
                ),
              ],
            );
          },
        );
      }, error: (objectTrace, error) {
        return Center(
          child: Text(
            error.toString(),
          ),
        );
      }, loading: () {
        return const CircularProgressIndicator();
      }),
    );
  }
}
