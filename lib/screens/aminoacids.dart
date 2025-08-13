//
// TODO: Edit charged amino acid pngs!
//


import 'dart:math';
import 'package:flutter/material.dart';

class AminoAcids extends StatefulWidget {
  @override
  _AminoAcidsState createState() => _AminoAcidsState();
}

class _AminoAcidsState extends State<AminoAcids> {
  final List<Map<String, dynamic>> aminoAcids = [
    {'names': ['Glycine'], 'three': 'Gly', 'one': 'G', 'image': 'glycine.png'},
    {'names': ['Alanine'], 'three': 'Ala', 'one': 'A', 'image': 'alanine.png'},
    {'names': ['Valine'], 'three': 'Val', 'one': 'V', 'image': 'valine.png'},
    {'names': ['Leucine'], 'three': 'Leu', 'one': 'L', 'image': 'leucine.png'},
    {'names': ['Isoleucine'], 'three': 'Ile', 'one': 'I', 'image': 'isoleucine.png'},
    {'names': ['Serine'], 'three': 'Ser', 'one': 'S', 'image': 'serine.png'},
    {'names': ['Threonine'], 'three': 'Thr', 'one': 'T', 'image': 'threonine.png'},
    {'names': ['Cysteine'], 'three': 'Cys', 'one': 'C', 'image': 'cysteine.png'},
    {'names': ['Methionine'], 'three': 'Met', 'one': 'M', 'image': 'methionine.png'},
    {'names': ['Phenylalanine'], 'three': 'Phe', 'one': 'F', 'image': 'phenylalanine.png'},
    {'names': ['Tyrosine'], 'three': 'Tyr', 'one': 'Y', 'image': 'tyrosine.png'},
    {'names': ['Tryptophan'], 'three': 'Trp', 'one': 'W', 'image': 'tryptophan.png'},
    {'names': ['Asparagine'], 'three': 'Asn', 'one': 'N', 'image': 'asparagine.png'},
    {'names': ['Glutamine'], 'three': 'Gln', 'one': 'Q', 'image': 'glutamine.png'},
    {'names': ['Aspartic acid', 'Aspartate'], 'three': 'Asp', 'one': 'D', 'image': 'aspartate.png'},
    {'names': ['Glutamic acid', 'Glutamate'], 'three': 'Glu', 'one': 'E', 'image': 'glutamate.png'},
    {'names': ['Lysine'], 'three': 'Lys', 'one': 'K', 'image': 'lysine.png'},
    {'names': ['Arginine'], 'three': 'Arg', 'one': 'R', 'image': 'arginine.png'},
    {'names': ['Histidine'], 'three': 'His', 'one': 'H', 'image': 'histidine.png'},
    {'names': ['Proline'], 'three': 'Pro', 'one': 'P', 'image': 'proline.png'},
  ];

  Map<String, dynamic>? currentQuestion;
  String feedback = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController threeController = TextEditingController();
  TextEditingController oneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _generateNewQuestion();
  }

  void _generateNewQuestion() {
    final random = Random();
    final index = random.nextInt(aminoAcids.length);
    final newQuestion = aminoAcids[index];

    setState(() {
      currentQuestion = newQuestion;
      feedback = "";
      nameController.clear();
      threeController.clear();
      oneController.clear();
    });
  }

  void _checkAnswers() {
    final nameInput = nameController.text.trim().toLowerCase();
    final threeInput = threeController.text.trim().toLowerCase();
    final oneInput = oneController.text.trim().toLowerCase();

    final List<String> validNames = (currentQuestion!['names'] as List<dynamic>)
        .map((n) => n.toString().toLowerCase())
        .toList();

    final correct =
        validNames.contains(nameInput) &&
        threeInput == currentQuestion!['three']!.toLowerCase() &&
        oneInput == currentQuestion!['one']!.toLowerCase();

    setState(() {
      feedback = correct ? "✅ Correct!" : "❌ Try Again!\n Answer: $validNames";
    });

    // Changed conditional to true so it always resets the question
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
      appBar: AppBar(title: Text("Amino Acid Quiz")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'amino_acids/${currentQuestion!['image']}',
                  width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                  height: 200,
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

              Text("Three-letter Code:"),
              TextField(
                controller: threeController,
                decoration: InputDecoration(hintText: "e.g. Gly"),
              ),
              SizedBox(height: 16),

              Text("One-letter Code:"),
              TextField(
                controller: oneController,
                decoration: InputDecoration(hintText: "e.g. G"),
              ),
              SizedBox(height: 24),

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
