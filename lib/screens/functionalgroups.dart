import 'dart:math';
import 'package:flutter/material.dart';

class FunctionalGroups extends StatefulWidget {
  @override
  _FunctionalGroupsState createState() => _FunctionalGroupsState();
}

class _FunctionalGroupsState extends State<FunctionalGroups> {
  final List<Map<String, dynamic>> functionalGroups = [

    {'names': ['Alcohol', 'Hydroxy'], 'image': 'alcohol.png'},
    {'names': ['Alkenyl'], 'image': 'alkenyl.png'},
    {'names': ['Alkyl'], 'image': 'alkyl.png'},
    {'names': ['Alkynyl'], 'image': 'alkynyl.png'},
    {'names': ['Phenyl'], 'image': 'phenyl.png'},
    {'names': ['Ketone'], 'image': 'ketone.png'},
    {'names': ['Aldehyde'], 'image': 'aldehyde.png'},
    {'names': ['Acyl Halide', 'Haloformyl'], 'image': 'acyl_halide.png'},
    {'names': ['Carbonate', 'Carbonate Ester'], 'image': 'carbonate.png'},
    {'names': ['Carboxylate'], 'image': 'carboxylate.png'},
    {'names': ['Carboxyl', 'Carboxylic Acid'], 'image': 'carboxyl.png'},
    {'names': ['Ester'], 'image': 'ester.png'},
    {'names': ['Hydroperoxy', 'Hydroperoxide'], 'image': 'hydroperoxide.png'},
    {'names': ['Peroxide', 'Peroxy'], 'image': 'peroxide.png'},
    {'names': ['Ether'], 'image': 'ether.png'},
    {'names': ['Hemiacetal'], 'image': 'hemiacetal.png'},
    {'names': ['Hemiketal'], 'image': 'hemiketal.png'},
    {'names': ['Acetal'], 'image': 'acetal.png'},
    {'names': ['Ketal'], 'image': 'ketal.png'},
    {'names': ['Orthoester'], 'image': 'orthoester.png'},
    {'names': ['Orthocarbonate Ester'], 'image': 'orthocarbonate_ester.png'},
    {'names': ['Carboxylic Anhydride'], 'image': 'carboxylic_anhydride.png'},
    {'names': ['Amide', 'Carboxamide'], 'image': 'amide.png'},
    {'names': ['Amidine'], 'image': 'amidine.png'},
    {'names': ['Guanidine'], 'image': 'guanidine.png'},
    {'names': ['Amine'], 'image': 'amine.png'},
    {'names': ['Imine'], 'image': 'imine.png'},
    {'names': ['Imide'], 'image': 'imide.png'},
    {'names': ['Azide'], 'image': 'azide.png'},
    {'names': ['Azo'], 'image': 'azo.png'},
    {'names': ['Cyanate'], 'image': 'cyanate.png'},
    {'names': ['Isocyanate'], 'image': 'isocyanate.png'},
    {'names': ['Nitrate'], 'image': 'nitrate.png'},
    {'names': ['Nitrile'], 'image': 'nitrile.png'},
    {'names': ['Isonitrile'], 'image': 'isonitrile.png'},
    {'names': ['Nitrite'], 'image': 'nitrite.png'},
    {'names': ['Nitro'], 'image': 'nitro.png'},
    {'names': ['Nitroso'], 'image': 'nitroso.png'},
    {'names': ['Carbamate'], 'image': 'carbamate.png'},
    {'names': ['Thiol'], 'image': 'thiol.png'},
    {'names': ['Sulfide', 'Thioether'], 'image': 'sulfide.png'},
    {'names': ['Disulfide'], 'image': 'disulfide.png'},
    {'names': ['Sulfoxide'], 'image': 'sulfoxide.png'},
    {'names': ['Sulfone'], 'image': 'sulfone.png'},
    {'names': ['Thiocyanate'], 'image': 'thiocyanate.png'},
    {'names': ['Thioester'], 'image': 'thioester.png'},
    {'names': ['Phosphodiester'], 'image': 'phosphodiester.png'},

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
    final index = random.nextInt(functionalGroups.length);
    final newQuestion = functionalGroups[index];

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
        //  &&
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
      appBar: AppBar(title: Text("Functional Group Quiz")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'functional_groups/${currentQuestion!['image']}',
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
