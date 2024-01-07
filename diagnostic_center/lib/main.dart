import 'package:diagnostic_center/database/app_db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/screens/info_screen.dart';

void main() {
  runApp(Provider(
    create: (context) {
      return AppDb();
    },
    child: const MyApp(),
    dispose: (context, AppDb db) => db.close(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const InfoPage(),
    );
  }
}
