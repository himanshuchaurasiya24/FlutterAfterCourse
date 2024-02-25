

import 'package:employee_book/screen/employee_notifier_future.dart';
import 'package:employee_book/screen/employee_stream.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pages = const [
    EmployeeNotifierFuture(),
    EmployeeStream(),
  ];
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
int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index ,
        onTap: (value) {
          setState(() {
            index=value;
          });
        },
        backgroundColor: Colors.pink.shade300,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        
        showSelectedLabels: true,
        showUnselectedLabels: true,

        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.list_outlined), activeIcon: Icon(Icons.list), label: 'Employee Future'),
        BottomNavigationBarItem(icon: Icon(Icons.list_outlined), activeIcon: Icon(Icons.list), label: 'Employee Stream'),
      ]),
      body:pages[index],
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.pushNamed(context, '/add_employee').then((value) {
         if(value==true){
          setState(() {
            
          });
         }
          
        });
      }, label: const Text('Add Employee'), icon: const Icon(Icons.add_outlined),),
    );
  }
 
}