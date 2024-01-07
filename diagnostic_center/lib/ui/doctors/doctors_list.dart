import 'package:diagnostic_center/database/app_db.dart';
import 'package:diagnostic_center/ui/doctors/add_doctor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorsList extends StatefulWidget {
  const DoctorsList({super.key});

  @override
  State<DoctorsList> createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Doctors Database',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Provider.of<AppDb>(context).getDoctorList(),
        builder: (context, snapshot) {
          final List<DoctorModelData>? doctorsList = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Some error',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          }
          if (doctorsList != null) {
            if (doctorsList.isEmpty) {
              return Center(
                child: Text(
                  'No doctor in the list.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            } else {
              return ListView.builder(
                itemCount: doctorsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Provider.of<AppDb>(context, listen: false)
                          .deleteDoctor(doctorsList[index].id)
                          .then((value) {
                        setState(() {});
                      });
                    },
                    title: Text(
                      doctorsList[index].doctorName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      doctorsList[index].doctorPhoneNumber,
                      style: const TextStyle(fontSize: 20),
                    ),
                    trailing: Text(
                      doctorsList[index].doctorAddress,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.grey),
                    ),
                  );
                },
              );
            }
          }
          if (doctorsList == null) {
            return Center(
              child: Text(
                'Null list.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          }
          return const Center(
            child: Text('Returning from the last'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddDoctor();
              },
            ),
          ).then((value) {
            setState(() {});
          });
        },
        label: const Text('Add a doctor'),
      ),
    );
  }
}
