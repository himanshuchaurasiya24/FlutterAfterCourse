import 'package:dbes_riverpod_hooks/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenA extends ConsumerWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen A'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Counter Value: ${ref.watch(counterProvider)}'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // ref.read(counterProvider.notifier).state = 0;
                Navigator.pop(context);
              },
              child: const Text('Go to Counter App'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
