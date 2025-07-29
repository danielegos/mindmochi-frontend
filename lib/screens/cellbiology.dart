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
                          'Cell Biology Crash Course',
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
                          'Deoxyribonucleic acid (DNA) is the biological information which encodes all known life in the universe. Its code consists in four nucleotide bases Adenine, Cytosine, Thymine, Guanine. Each is dubbed with the first letter of its name, A, C, T, G.',
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
                                shape:BoxShape.circle,
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
                          'Eukaryotic and prokaryotic cells differ in important ways.',
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
                                    'Prokaryotes',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'Eukaryotes',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Circular DNA in the cytoplasm'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('DNA is stored as linear chromosomes within the nucleus'),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('[talk about cell membrane]'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('[talk about cell membrane]'),
                                ),
                              ],
                            ),
                            
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Always unicellular'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Some are unicellular and others are multicellular'),
                                ),
                              ],
                            ),

                                                        TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('[size]'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('[size]'),
                                ),
                              ],
                            ),


                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Cells do not differentiate'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Multicellular eukaryotes can have cell differentiation'),
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

