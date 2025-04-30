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
              
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                margin: EdgeInsets.all(16),
                color: const Color.fromARGB(255, 255, 255, 255), // Card background
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // left-align all children
                    mainAxisSize: MainAxisSize.min, // shrink to fit contents
                    children: [
                      Text(
                        'Unit 1',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 0, 0),
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 8), // Optional spacing
                      Text(
                        'Overview: This unit covers basic cell biology concepts.', 
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Topics: Variables, Functions, Control Flow',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                          decoration: TextDecoration.none,
                        ),
                      ),

                      // Body text
                      SizedBox(height: 20),
                      Text(
                        'Topics: Variables, Functions, Control Flow',
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          decoration: TextDecoration.none,
                        ),
                      ),

                    ],
                  ),
                ),
              )



              // End text sections

            ],
          ),
        ),
      ),
    );
  }
}
