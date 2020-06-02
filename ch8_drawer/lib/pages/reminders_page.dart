import 'package:flutter/material.dart';

class RemindersPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
      ),
      body: Center(
        child: Icon(
            Icons.access_alarm,
            color: Colors.purple,
            size: 120.0
        ),
      ),
    );
  }

}