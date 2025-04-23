import 'package:flutter/material.dart';

class CellBiology extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cell Biology")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Let's learn about cell biology!"),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
