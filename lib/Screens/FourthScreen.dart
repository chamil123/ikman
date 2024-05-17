import 'package:flutter/material.dart';

class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fourth Screen'),
      ),
      body: ListView(
        children: [
          Center(child: Text('Fourth Screen Content')),
          // Add more widgets as needed
        ],
      ),
    );
  }
}