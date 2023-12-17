import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_auto_dispose/counter_demo.dart';

// in this provider it does not have any auto dispose method so the state of the counter will be preserved even after the screen is closed so to prevent this or to dispose the counter after the
// user leaves the screen we can use the second provider type;
// final counterProvider = StateNotifierProvider<CounterDemo, int>((ref) {
//   return CounterDemo();
// });
final counterProvider =
    StateNotifierProvider.autoDispose<CounterDemo, int>((ref) {
  // here the counter state will be reset to zero after the user leaves the screen;
  // but if we need to preserve the state even while using the autodispose method we can make use of the keepAlive function below
  // ref.keepAlive(); // this will prevent the state from resetting
  // to dispose the state after particular time use below code;
  final link = ref.keepAlive();
  final timer = Timer(const Duration(seconds: 10), () {
    link.close();
  });
  ref.onDispose(() => timer.cancel()); // to stop the timer
  return CounterDemo();
});

class Counter extends ConsumerWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto Dispose Demo'),
      ),
      body: Center(
        child: Text(
          count.toString(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        label: const Text('+'),
      ),
    );
  }
}
