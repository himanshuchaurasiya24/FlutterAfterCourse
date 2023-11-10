import 'package:employee_book/local/db/app_db.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class EmployeeStream extends StatefulWidget {
   const EmployeeStream({super.key});

  @override
  State<EmployeeStream> createState() => _EmployeeStreamState();
}

class _EmployeeStreamState extends State<EmployeeStream> {
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
      appBar: AppBar(title: const Text('Employee Stream'),
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
            return GestureDetector(
              onTap: (){
                // to navigate to edit screen;
                Navigator.pushNamed(context, '/edit_employee', arguments: employee.id).then((value) {
                  setState(() {
                    
                  });
                });
              },
              child: Card(
                color: const  Color.fromARGB(255, 243, 137, 129),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.red,
                    style: BorderStyle.solid,
                    width: 1.2
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(employee.userName),
                      Text(employee.firstName),
                      Text(employee.lastName),
                      Text(dateOfBirth(employee.dateOfBirth)),
                    ],
                  ),
                  IconButton(onPressed:(){
                    _db.deleteEmployee(employee.id);
                    setState(() {
                      
                    });
                  }, icon: const Icon(Icons.delete_outlined),),
                    ],
                  )
                ),
              ),
            );
          },itemCount: employees.length,);
        }
        
        return const Center(child: Text('No Data To Display'),);
      },
      ),
      
    );
  }
 
}