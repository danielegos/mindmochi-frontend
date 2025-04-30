// import 'package:flutter/material.dart';

// class CellBiology extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Cell Biology")),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
              
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 elevation: 4,
//                 margin: EdgeInsets.all(16),
//                 color: const Color.fromARGB(255, 255, 255, 255), // Card background
//                 child: Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.all(16),
//                   alignment: Alignment.centerLeft,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start, // left-align all children
//                     mainAxisSize: MainAxisSize.min, // shrink to fit contents
//                     children: [
//                       Text(
//                         'Unit 1',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.w500,
//                           color: Color.fromARGB(255, 0, 0, 0),
//                           decoration: TextDecoration.none,
//                         ),
//                       ),
//                       SizedBox(height: 8), // Optional spacing
//                       Text(
//                         'Overview: This unit covers basic cell biology concepts.', 
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.black87,
//                           decoration: TextDecoration.none,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         'Topics: DNA Structure, Synthesis, Repair',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[700],
//                           decoration: TextDecoration.none,
//                         ),
//                       ),

//                       // Body text
//                       SizedBox(height: 40),
//                       Text(
//                         'DNA is stored as a circular chromosome in prokaryotes and is organized into separate linear chromosomes in eukaryotes.',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: const Color.fromARGB(255, 0, 0, 0),
//                           decoration: TextDecoration.none,
//                         ),
//                       ),

//                       SizedBox(height: 20),
//                       // The Table
//                       Table(
//                         border: TableBorder.all(color: Colors.grey), // Optional
//                         columnWidths: const {
//                           0: FlexColumnWidth(2),
//                           1: FlexColumnWidth(3),
//                         },
//                         children: [
//                           TableRow(
//                             decoration: BoxDecoration(color: Colors.blue[50]),
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.all(8),
//                                 child: Text(
//                                   'Topic',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(8),
//                                 child: Text(
//                                   'Description',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           TableRow(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.all(8),
//                                 child: Text('Variables'),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(8),
//                                 child: Text('Storing and manipulating data'),
//                               ),
//                             ],
//                           ),
//                           TableRow(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.all(8),
//                                 child: Text('Functions'),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(8),
//                                 child: Text('Reusable blocks of logic'),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),


//                     ],
//                   ),
//                 ),
//               )




//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// ------------ Attempt 2 ----------------

  import 'package:flutter/material.dart';

  class CellBiology extends StatefulWidget {
    @override
    _CellBiologyState createState() => _CellBiologyState();
  }

  class _CellBiologyState extends State<CellBiology> {
    Offset _circlePosition = Offset(100, 100);

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
                // --- Unit Overview Card ---
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  margin: EdgeInsets.all(16),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Unit 1',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: 8),
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
                          'Topics: DNA Structure, Synthesis, Repair',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: 40),
                        Text(
                          'DNA is stored as a circular chromosome in prokaryotes and is organized into separate linear chromosomes in eukaryotes.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: 20),
                        Table(
                          border: TableBorder.all(color: Colors.grey),
                          columnWidths: const {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(3),
                          },
                          children: [
                            TableRow(
                              decoration: BoxDecoration(color: Colors.blue[50]),
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'Coding DNA',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'Noncoding DNA',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Contains genes'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Does not contain genes'),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Needed to produce proteins, tRNA, and other biomolecules.'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Does not code for proteins or other biomolecules.'),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Relatively small portion of genome.'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Much larger portion of genome.'),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('-'*20),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Involved in maintaining chromosome integrity and regulating gene expression.'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Filler text.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

                // --- Draggable Circle Card ---
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  margin: EdgeInsets.all(16),
                  color: Colors.grey[100],
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    child: Stack(
                      children: [
                        Positioned(
                          left: _circlePosition.dx,
                          top: _circlePosition.dy,
                          child: GestureDetector(
                            onPanUpdate: (details) {
                              setState(() {
                                _circlePosition += details.delta;
                              });
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  margin: EdgeInsets.all(16),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'DNA is stored as a circular chromosome in prokaryotes and is organized into separate linear chromosomes in eukaryotes.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: 20),
                        Table(
                          border: TableBorder.all(color: Colors.grey),
                          columnWidths: const {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(3),
                          },
                          children: [
                            TableRow(
                              decoration: BoxDecoration(color: Colors.blue[50]),
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'Coding DNA',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'Noncoding DNA',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Contains genes'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Does not contain genes'),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Needed to produce proteins, tRNA, and other biomolecules.'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Does not code for proteins or other biomolecules.'),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Relatively small portion of genome.'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Much larger portion of genome.'),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('-'*20),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Involved in maintaining chromosome integrity and regulating gene expression.'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Filler text.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    }
  }

