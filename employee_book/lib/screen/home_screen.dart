import 'package:employee_book/local/db/app_db.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AppDb _db;
  String dateOfBirth(DateTime dateTime){
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
  @override
  void initState() {
    super.initState();
  _db= AppDb();
  }
  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen'),
      centerTitle: true,
      ),
      body: FutureBuilder<List<EmployeeData>>(future: _db.getEmployees(),builder: (context, snapshot) {
        final List<EmployeeData>? employees= snapshot.data;
        if(snapshot.connectionState!=ConnectionState.done){
          return const  Center(
            child: CircularProgressIndicator(),
          );
        }
        if(snapshot.hasError){
          return  Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if(employees!=null){
          return ListView.builder(itemBuilder: (context, index) {
            final employee= employees[index];
            return Card(
              child: Column(
                children: [
                  Text(employee.userName),
                  Text(employee.firstName),
                  Text(employee.lastName),
                  Text(dateOfBirth(employee.dateOfBirth)),
                ],
              ),
            );
          },itemCount: employees.length,);
        }
        return const Center(child: Text('No Data To Display'),);
      },
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.pushNamed(context, '/add_employee').then((value) {
          if(value==1){
            setState(() {
              
            });
          }
        });
      }, label: const Text('Add Employee'), icon: const Icon(Icons.add_outlined),),
    );
  }
}