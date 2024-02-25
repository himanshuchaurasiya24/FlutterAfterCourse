import 'package:employee_book/local/db/app_db.dart';
import 'package:employee_book/notifier/employee_change_notifier.dart';
import 'package:employee_book/widget/custom_date_picker_form_field.dart';
import 'package:employee_book/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' as drift;
import 'package:provider/provider.dart';
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
late EmployeeChangeNotifier _employeeChangeNotifier;

final _formKey = GlobalKey<FormState>(); 
@override
  void initState() {
    _employeeChangeNotifier= Provider.of<EmployeeChangeNotifier>(context, listen: false);
  _employeeChangeNotifier.addListener(providerListener);
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _employeeChangeNotifier.dispose();
    _dateOfBirthNameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Employee'),centerTitle: true,actions: 
      [
        IconButton(onPressed: (){
        addEmployee();
      },
      icon: const Icon(Icons.save_outlined),)],),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
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
            
              ],
            ),),
            
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
      if(_dateOfBirth!=null){
        _dateOfBirth=newDate;
      }
      else{
        _dateOfBirth= DateTime.now();
      }
      _dateOfBirthNameController.text= dob;
    });
    
  }
  void addEmployee(){
    final isValid= _formKey.currentState?.validate();

    if(isValid!=null&&isValid){
      final entity = EmployeeCompanion(
          userName: drift.Value(_usernameController.text),
          firstName: drift.Value(_firstNameController.text),
          lastName: drift.Value(_lastNameController.text),
          dateOfBirth: drift.Value(_dateOfBirth!),
        );
        context.read<EmployeeChangeNotifier>().createEmployee(entity);
        
      //  Provider.of<AppDb>(context, listen: false).insertEmployee(entity).then((value) =>
      //   ScaffoldMessenger.of(context)
      //   .showMaterialBanner(
      //     MaterialBanner(
      //     content:  Text('New Employee $value Added'), 
      //     actions: [TextButton(onPressed: (){
      //      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
      //      Navigator.of(context).pop(value);
         
      //   }, child: const Text('OK'))])));
    }else{
      'Some field might be null. Please check it.';
    }   
  }
  void providerListener(){
         if(_employeeChangeNotifier.isAdded){
            ScaffoldMessenger.of(context)
        .showMaterialBanner(
          MaterialBanner(
          content:  const Text('New Employee Added'), 
          actions: [TextButton(onPressed: (){
           ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
           Navigator.of(context).pop(true);
        }, child: const Text('OK'))]));
         }
        }
}
