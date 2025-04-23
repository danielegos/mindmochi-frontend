import 'package:flutter/material.dart';

// create new screen
class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to the new screen!"),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pop(context); // Navigate back
            //   },
            //   child: Text("Go Back"),
            // ),
          ],
        ),
      ),
    );
  }
}