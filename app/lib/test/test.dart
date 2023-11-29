import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Open Link Example'),
        ),
        
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              
            },
            child: Text('다른 브라우저로 열기'),
          ),
        ),
      ),
    );
  }

}