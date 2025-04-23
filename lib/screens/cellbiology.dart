import 'package:flutter/material.dart';

class CellBiology extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cell Biology")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hello from Cell Biology",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 20),
              Text(
                "Here's a scrollable area you can expand with more content.\n"
                "Add images, draggable components, or diagrams below!",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              // Add more widgets here to test scrollability
              for (int i = 1; i <= 20; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("Section $i"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
