import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen'),
      centerTitle: true,
      // forceMaterialTransparency: true,
      ),
      body: Column(
        children: [

        ],

      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.pushNamed(context, '/add_employee');
      }, label: const Text('Add Employee'), icon: const Icon(Icons.add_outlined),),
    );
  }
}