import 'package:center_app/services/app_db.dart';
import 'package:center_app/ui/screens/doctors/add_doctor.dart';
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddDoctor();
              },
            ),
          );
        },
        label: const Text('Add Doctor'),
      ),
      body: FutureBuilder(
          future: Provider.of<AppDb>(context).getDoctorsList(),
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
                  'Some error occurred while fetching doctor\'s list',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            }
            if (doctorsList != null) {
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
                    subtitle: Text(doctorsList[index].doctorAddress),
                    trailing: Text(
                      doctorsList[index].doctorPhone,
                      textAlign: TextAlign.end,
                    ),
                  );
                },
              );
            }
            return Center(
              child: Text(
                'No data found',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          }),
    );
  }
}
