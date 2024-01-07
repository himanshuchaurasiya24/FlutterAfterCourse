import 'package:diagnostic_center/database/app_db.dart';
import 'package:diagnostic_center/ui/screens/center_information/add_center_information_screen.dart';
import 'package:diagnostic_center/ui/screens/center_information/update_center_information.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CenterInformation extends StatefulWidget {
  const CenterInformation({super.key});

  @override
  State<CenterInformation> createState() => _CenterInformationState();
}

class _CenterInformationState extends State<CenterInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Center Information Panel',
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
                return AddCenterInformation();
              },
            ),
          );
        },
        label: const Text('Add Center Information'),
      ),
      body: FutureBuilder(
        future: Provider.of<AppDb>(context).getCenterInformationList(),
        builder: (context, snapshot) {
          final List<CenterInformationModelData>? centerInformationList =
              snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Some Error ${snapshot.error}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          }
          if (centerInformationList != null) {
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'Center Information Not Filled',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            } else {
              return ListView.builder(
                itemCount: centerInformationList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return UpdateCenterInformation(
                                centerName:
                                    centerInformationList[index].centerName,
                                centerAddress:
                                    centerInformationList[index].centerAddress,
                                centerEmail:
                                    centerInformationList[index].centerEmail);
                          },
                        ),
                      ).then((value) {
                        setState(() {});
                      });
                    },
                    title: Text(
                      centerInformationList[index].centerName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      centerInformationList[index].centerEmail,
                    ),
                    trailing: Text(
                      centerInformationList[index].centerAddress,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.grey),
                    ),
                  );
                },
              );
            }
          }
          if (snapshot.data == null) {
            return Center(
              child: Text(
                'Null database',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          }
          return const Center(
            child: Text('Returning from the last'),
          );
        },
      ),
    );
  }
}
