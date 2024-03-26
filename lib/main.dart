import 'package:flutter/material.dart';
import 'package:sofi_interview_2/presentation/router.dart';
import 'package:sofi_interview_2/presentation/weight_input.dart';

// Create a weight tracker app that reads and writes weight logs . For now assume the database is in memory and resets on app launch.

// Each log has a weight, timestamp, and notes.

//create a notebook class that holds logs
//

void main() {
  runApp(MyApp(
    router: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});

  final AppRouter router;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Weight Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: router.generateRoute,
    );
  }
}
