import 'package:employee_book/local/db/app_db.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
class EmployeeFuture extends StatefulWidget {
   const EmployeeFuture({super.key});

  @override
  State<EmployeeFuture> createState() => _EmployeeFutureState();
}

class _EmployeeFutureState extends State<EmployeeFuture> {

  String dateOfBirth(DateTime dateTime){
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Future'),
      centerTitle: true,
      ),
     
      
      body: FutureBuilder<List<EmployeeData>>(future: Provider.of<AppDb>(context).getEmployees(),
      builder: (context, snapshot) {
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
              
                    ],
                  )
                ),
              ),
            );
          },itemCount: employees.length,);
        }
        if(employees!=null&&employees.isEmpty){
          
        return const Center(child: Text('No Data To Display'),);
        }
        
        return const Center(child: Text('No Data To Display'),);
      },
      ),
      
    );
  }
 
}