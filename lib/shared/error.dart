import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  const ErrorMessage({super.key, this.message = 'oops...something broke!'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
