import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            (context).push('/counter');
          },
          icon: const Icon(Icons.add_outlined),
          label: const Text('Counter'),
        ),
      ),
    );
  }
}
