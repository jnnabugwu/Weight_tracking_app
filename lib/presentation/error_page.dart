import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Theres something that went wrong',
          style: TextStyle(fontSize: 52),
        ),
      ),
    );
  }
}
