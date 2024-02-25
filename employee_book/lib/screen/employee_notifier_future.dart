





import 'package:employee_book/notifier/employee_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
class EmployeeNotifierFuture extends StatefulWidget {
   const EmployeeNotifierFuture({super.key});

  @override
  State<EmployeeNotifierFuture> createState() => _EmployeeFutureState();
}

class _EmployeeFutureState extends State<EmployeeNotifierFuture> {

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
      appBar: AppBar(title: const Text('Employee Future'),
      centerTitle: true,
      ),
      body: isLoading?
      const Center(
        child: CircularProgressIndicator(),
      ):
           Consumer<EmployeeChangeNotifier>(builder: (context, notifier, child) {
             return ListView.builder(itemBuilder: (context, index) {
            final employee= notifier.employeeListFuture[index];
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
          },
          itemCount: notifier.employeeListFuture.length,
          );
           },)
          );
  }
}