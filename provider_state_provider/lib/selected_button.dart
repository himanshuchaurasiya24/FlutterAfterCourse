import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isRedProvider = Provider<bool>((ref) {
  final color = ref.watch(selectedButtonProvider);
  return color == 'red';
});

final selectedButtonProvider = StateProvider<String>((ref) => '');

class SelectedButton extends ConsumerWidget {
  const SelectedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRed = ref.watch(isRedProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider and State Provider'),
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  ref.read(selectedButtonProvider.notifier).state = 'red';
                },
                icon: const Icon(Icons.account_circle_outlined),
                label: const Text('Red'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  ref.read(selectedButtonProvider.notifier).state = 'blue';
                },
                icon: const Icon(Icons.access_alarm),
                label: const Text('Blue'),
              ),
              isRed ? const Text('red') : const Text('blue'),
            ]),
      ),
    );
  }
}
