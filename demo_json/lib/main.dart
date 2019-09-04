import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:demo_json/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: buildHomePage(title: 'JSON serialization demo'),
    );
  }

  Widget buildHomePage({String title}){
    final String jsonString = '''
{
  "name": "John Smith",
  "email": "john@example.com"
}    
    ''';
    final Map<String, dynamic> json = jsonDecode(jsonString);
    final User user = User.fromJson(json);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(jsonString),
            Divider(height: 4,),
            Text('Username: ${user.name}'),
            Text('Email: ${user.email}')
          ],
        ),
      ),
    );
  }
}

