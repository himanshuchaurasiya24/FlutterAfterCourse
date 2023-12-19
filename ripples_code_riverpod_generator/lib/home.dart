import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home.g.dart';
// final nameProvider = Provider<String>((ref) => 'Hello World!!!');

// @riverpod // this is where provider is autodisposable to make it alive
@Riverpod(keepAlive: true)
String name(NameRef ref) {
  return 'Himanshu Chaurasiya';
}

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Generator'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
