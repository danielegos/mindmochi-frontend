import 'dart:math';
import 'package:flutter/material.dart';

class IupacPractice extends StatefulWidget {
  @override
  _IupacPracticeState createState() => _IupacPracticeState();
}

class _IupacPracticeState extends State<IupacPractice> {
  final List<Map<String, dynamic>> iupacExamples = [
    {'names': ['1,1-Dibromopentane'], 'image': '1,1-Dibromopentane.png'},
    {'names': ['4-Chloro-1-butene'], 'image': '4-Chloro-1-butene.png'},
    {'names': ['3-Ethylhept-3-ene'], 'image': '3-ethylhept-3-ene.png'},
    {'names': ['But-1-yne'], 'image': 'But-1-yne.png'},
    {'names': ['5-Methylcyclopenta-1,3-diene'], 'image': '5-methylcyclopenta-1,3-diene.png'},
    {'names': ['(2R)-4-amino-2-methylbutan-1-ol'], 'image': '(2R)-4-amino-2-methylbutan-1-ol.png'},
    {'names': ['Phenol'], 'image': 'Phenol.png'},
    {'names': ['Furan'], 'image': 'Furan.png'},
    {'names': ['1H-pyrrole'], 'image': '1H-pyrrole.png'},
    {'names': ['(4R)-2-chloro-1-ethyl-4-methylcyclohexene'], 'image': '(4R)-2-chloro-1-ethyl-4-methylcyclohexene.png'},
    {'names': ['1H-imidazole'], 'image': '1H-imidazole.png'},
    {'names': ['7H-purine'], 'image': '7H-purine.png'},
    {'names': ['Pyrimidine'], 'image': 'Pyrimidine.png'},
    {'names': ['5-sulfanylpentanoic acid'], 'image': '5-sulfanylpentanoic_acid.png'},
    {'names': ['3,5-dihydroxy-3-methylpentanoate'], 'image': '3,5-dihydroxy-3-methylpentanoate.png'},

    // {'names': [''], 'image': '.png'},
  ];

  Map<String, dynamic>? currentQuestion;
  String feedback = "";

  TextEditingController nameController = TextEditingController();
  // TextEditingController threeController = TextEditingController();
  // TextEditingController oneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _generateNewQuestion();
  }

  void _generateNewQuestion() {
    final random = Random();
    final index = random.nextInt(iupacExamples.length);
    final newQuestion = iupacExamples[index];

    setState(() {
      currentQuestion = newQuestion;
      feedback = "";
      nameController.clear();
      // threeController.clear();
      // oneController.clear();
    });
  }

  void _checkAnswers() {
    final nameInput = nameController.text.trim().toLowerCase();
    // final threeInput = threeController.text.trim().toLowerCase();
    // final oneInput = oneController.text.trim().toLowerCase();

    final List<String> validNames = (currentQuestion!['names'] as List<dynamic>)
        .map((n) => n.toString().toLowerCase())
        .toList();

    final correct =
        validNames.contains(nameInput);
        // &&
        // threeInput == currentQuestion!['three']!.toLowerCase() &&
        // oneInput == currentQuestion!['one']!.toLowerCase();

    setState(() {
      feedback = correct ? "✅ Correct!" : "❌ Try Again!\n Answer: $validNames";
    });

    if (true) {
      Future.delayed(Duration(seconds: 2), () {
        _generateNewQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestion == null) return Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(title: Text("IUPAC Naming Quiz")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'iupac_naming/${currentQuestion!['image']}',
                  width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                  height: 450,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Text("Image not found."),
                ),
              ),
              SizedBox(height: 24),

              Text("Full Name:"),
              TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: "e.g. Glycine"),
              ),
              SizedBox(height: 16),

              // Text("Three-letter Code:"),
              // TextField(
              //   controller: threeController,
              //   decoration: InputDecoration(hintText: "e.g. Gly"),
              // ),
              // SizedBox(height: 16),

              // Text("One-letter Code:"),
              // TextField(
              //   controller: oneController,
              //   decoration: InputDecoration(hintText: "e.g. G"),
              // ),
              // SizedBox(height: 24),

              Center(
                child: ElevatedButton(
                  onPressed: _checkAnswers,
                  child: Text("Submit"),
                ),
              ),
              SizedBox(height: 16),

              Center(
                child: Text(
                  feedback,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
