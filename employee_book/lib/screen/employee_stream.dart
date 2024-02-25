


import 'package:employee_book/local/db/app_db.dart';
import 'package:employee_book/notifier/employee_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
class EmployeeStream extends StatefulWidget {
   const EmployeeStream({super.key});

  @override
  State<EmployeeStream> createState() => _EmployeeStreamState();
}

class _EmployeeStreamState extends State<EmployeeStream> {

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
    debugPrint('build Context called');
    // final employees = context.select<EmployeeChangeNotifier, List<EmployeeData>>((notifier)=>notifier.employeeListFuture);
    final isLoading = context.select<EmployeeChangeNotifier, bool>((notifier)=>notifier.isLoading);

    return Scaffold(
      appBar: AppBar(title: const Text('Employee Stream'),
      centerTitle: true,
      ),
      body: isLoading?
      const Center(
        child: CircularProgressIndicator(),
      ):
           Selector<EmployeeChangeNotifier, List<EmployeeData>>(
            selector: (context, notifier){
              return notifier.employeeListFuture;
            },
            builder: (context, employees, child) {
             return ListView.builder(itemBuilder: (context, index) {
            final employee= employees[index];
            return GestureDetector(
              onTap: (){
                // to navigate to edit screen;
                Navigator.pushNamed(context, '/edit_employee', arguments: employee.id).
                then((value) {
                  if(value==true){
                    setState(() {
                    
                  });
                  }
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
          },
          itemCount:employees.length,
          );
           },)
          );
  }
 
}