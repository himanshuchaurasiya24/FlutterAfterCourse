import 'package:employee_book/local/db/app_db.dart';
import 'package:employee_book/notifier/employee_change_notifier.dart';
import 'package:employee_book/route/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
  void main() {
 runApp(
   MultiProvider(
    providers: [
      Provider.value(value: AppDb()),
      ChangeNotifierProxyProvider<AppDb,
       EmployeeChangeNotifier>(create: (context) {
        return EmployeeChangeNotifier();
      }, 
      update: (context, db, notifier) =>
         notifier!..initAppDb(db)..getEmployeeFuture()
      ,)
    ],
  child: const MyApp(),
 
  )
 );
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}