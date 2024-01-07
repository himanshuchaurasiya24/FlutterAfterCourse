import 'package:diagnostic_center/ui/screens/center_information/center_information.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const CenterInformation();
                      },
                    ),
                  );
                },
                title: Text(
                  'Center Information',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: const Text(
                  'Edit information like center name, address',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
