import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ripples_code_prevent_widget_rebuild/user.dart';
import 'package:ripples_code_prevent_widget_rebuild/user_notifier.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(
    const User(name: 'Himanshu Chaurasiya', address: 'Ghazipur'),
  ),
);

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build method called');
    // final user = ref.watch(userProvider); // this rebuild the whole ui even if the required chamge is necessary for wwidget rebuild
    // to prevent this or to rebuild the data only after specific change we can use the following
    final user = ref.watch(
      userProvider.select((value) => value.name),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Rebuild Prevention'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) {
                ref.read(userProvider.notifier).updateName(value);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onSubmitted: (value) {
                ref.read(userProvider.notifier).updateAddress(value);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text(user),
            const SizedBox(
              height: 10,
            ),
            // Text(user.address),
          ],
        ),
      ),
    );
  }
}
