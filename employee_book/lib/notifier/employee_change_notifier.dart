import 'package:employee_book/local/db/app_db.dart';
import 'package:flutter/material.dart';

class EmployeeChangeNotifier extends ChangeNotifier{
  AppDb? _appDb;
  String _error='';
  String get error =>_error;
  void initAppDb(AppDb db ){
    _appDb= db;
  }
  List<EmployeeData > _employeeListFuture= [];
  List<EmployeeData> get employeeListFuture => _employeeListFuture;
  EmployeeData? _employeeData;
  EmployeeData? get employeeData => _employeeData;
  bool _isAdded =false;
  bool get isAdded => _isAdded;
  bool _isUpdated = false;
  bool get updated =>_isUpdated;
  bool _isDeleted = false;
  bool get isDeleted => _isDeleted;
  bool _isLoading = false;
  bool get isLoading=>_isLoading;
  void getEmployeeFuture(){
    _isLoading= true;
    _appDb?.getEmployees().then((value) {
      _employeeListFuture= value;
      _isLoading= false;
      notifyListeners();
      
    }).onError((error, stackTrace){
      _error= error.toString();
      notifyListeners();
    });
    notifyListeners();
  }
  void getSingleEmployee(int id){
    _appDb?.getEmployee(id).then((value){
      _employeeData=value;
    }).onError((error, stackTrace){
      _error= error.toString();
    });
    notifyListeners();
  }
  void createEmployee(EmployeeCompanion entity){
    _appDb?.insertEmployee(entity).then((value) {
      _isAdded = value>=1?true:false;
    })
    .onError((error, stackTrace) {
      _error= error.toString();
    });
    notifyListeners();
  }
  void updateEmployee(EmployeeCompanion entity){
    _appDb?.updateEmployee(entity).then((value) {
      _isUpdated= value;
    }).onError((error, stackTrace) {
      _error= error.toString();
    });
    notifyListeners();
  }
  void deleteEmployee(int id){
    _appDb?.deleteEmployee(id).then((value) {
      _isDeleted= value==1?true:false;
    }).onError((error, stackTrace) {
      _error= error.toString();
    });
    notifyListeners();
  }
}