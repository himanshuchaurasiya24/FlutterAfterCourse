import 'package:diagnostic_center/ui/doctors/doctors_list.dart';
import 'package:diagnostic_center/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class AdminControl extends StatelessWidget {
  const AdminControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Control',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DoctorsList();
                      },
                    ),
                  );
                },
                title: Text(
                  'Doctors List',
                  // style: TextStyle(color: Colors.black),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: const Text(
                    'Add, Delete or Edit doctors information in database'),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'Patient History',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: const Text(
                    'View, Generate Report of the diagnosed patients'),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'Generate Incentives',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: const Text('View, Generate Incentives of doctors'),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'Disease Data',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: const Text('View, Edit Values of various  disease'),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ProfileScreen();
                      },
                    ),
                  );
                },
                title: Text(
                  'Profile',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: const Text(
                    'View, Edit Name and Address of Diagnostic Center'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
