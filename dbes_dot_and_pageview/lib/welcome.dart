import 'dart:math';

import 'package:dbes_dot_and_pageview/welcome_notifier.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Welcome extends ConsumerWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(welcomeProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref
              .read(welcomeProvider.notifier)
              .pageChanged(Random().nextInt(5) + 1);
        },
        label: const Text('Add'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('waesfgd'),
            DotsIndicator(
              dotsCount: 7,
              mainAxisAlignment: MainAxisAlignment.center,
              reversed: false,
              position: state.page,
              decorator: DotsDecorator(
                color: Colors.blue,
                activeColor: Colors.red,
                size: const Size.square(8),
                activeSize: const Size.square(18),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
