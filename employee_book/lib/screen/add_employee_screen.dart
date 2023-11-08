import 'package:employee_book/widget/custom_date_picker_form_field.dart';
import 'package:employee_book/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
final   TextEditingController _usernameController = TextEditingController();
final   TextEditingController _firstNameController = TextEditingController();
final   TextEditingController _lastNameController = TextEditingController();
final   TextEditingController _dateOfBirthNameController = TextEditingController();
DateTime? _dateOfBirth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Employee'),centerTitle: true,actions: [IconButton(onPressed: (){
        // todo something
      }, icon: const Icon(Icons.save_outlined),)],),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextFormField(controller: _usernameController, txtlable: 'username',),
            const SizedBox(
              height: 8.0,
            ),
            CustomTextFormField(controller: _firstNameController, txtlable: 'First Name'),
            const SizedBox(
              height: 8.0,
            ),
       CustomTextFormField(controller: _lastNameController, txtlable: 'Last Name'),
        const SizedBox(
          height: 8.0,
        ),
            CustomDatePickerFormField(callBack: (){
              pickDateOfBirth(context);
            }, controller: _dateOfBirthNameController, txtLabel: 'Date of Birth'),
            const SizedBox(
              height: 8.0,
            ),
            
          ],
        ),
      ) ,
    );
  }
  Future<void> pickDateOfBirth(BuildContext context) async{
    final currentDate = DateTime.now();
    final newDate = await showDatePicker(
    context: context, 
    initialDate: _dateOfBirth??currentDate, 
    firstDate: DateTime(DateTime.now().year-100), 
    lastDate: DateTime(DateTime.now().year+1),
    builder: (context, child) {
      return Theme(
        data: ThemeData().copyWith(),
       child: child??const Text(''),);
    },
    
    );
    if(newDate==null){
      return;
    }
    setState(() {
      var dob = DateFormat('dd/MM/yyyy').format(newDate);
      _dateOfBirth=newDate;
      _dateOfBirthNameController.text= dob;
    });
    
  }
  
}
