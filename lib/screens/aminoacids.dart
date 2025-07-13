import 'dart:math';
import 'package:flutter/material.dart';

class AminoAcids extends StatefulWidget {
  @override
  _AminoAcidsState createState() => _AminoAcidsState();
}

class _AminoAcidsState extends State<AminoAcids> {
    final List<Map<String, String>> aminoAcids = [
    {'name': 'Glycine', 'three': 'Gly', 'one': 'G', 'image': 'glycine.png'},
    {'name': 'Alanine', 'three': 'Ala', 'one': 'A', 'image': 'alanine.png'},
    {'name': 'Valine', 'three': 'Val', 'one': 'V', 'image': 'valine.png'},
    {'name': 'Leucine', 'three': 'Leu', 'one': 'L', 'image': 'leucine.png'},
    {'name': 'Isoleucine', 'three': 'Ile', 'one': 'I', 'image': 'isoleucine.png'},
    {'name': 'Serine', 'three': 'Ser', 'one': 'S', 'image': 'serine.png'},
    {'name': 'Threonine', 'three': 'Thr', 'one': 'T', 'image': 'threonine.png'},
    {'name': 'Cysteine', 'three': 'Cys', 'one': 'C', 'image': 'cysteine.png'},
    {'name': 'Methionine', 'three': 'Met', 'one': 'M', 'image': 'methionine.png'},
    {'name': 'Phenylalanine', 'three': 'Phe', 'one': 'F', 'image': 'phenylalanine.png'},
    {'name': 'Tyrosine', 'three': 'Tyr', 'one': 'Y', 'image': 'tyrosine.png'},
    {'name': 'Tryptophan', 'three': 'Trp', 'one': 'W', 'image': 'tryptophan.png'},
    {'name': 'Asparagine', 'three': 'Asn', 'one': 'N', 'image': 'asparagine.png'},
    {'name': 'Glutamine', 'three': 'Gln', 'one': 'Q', 'image': 'glutamine.png'},
    {'name': 'Aspartic acid', 'three': 'Asp', 'one': 'D', 'image': 'aspartate.png'},
    {'name': 'Glutamic acid', 'three': 'Glu', 'one': 'E', 'image': 'glutamate.png'},
    {'name': 'Lysine', 'three': 'Lys', 'one': 'K', 'image': 'lysine.png'},
    {'name': 'Arginine', 'three': 'Arg', 'one': 'R', 'image': 'arginine.png'},
    {'name': 'Histidine', 'three': 'His', 'one': 'H', 'image': 'histidine.png'},
    {'name': 'Proline', 'three': 'Pro', 'one': 'P', 'image': 'proline.png'},
  ];

  Map<String, String>? currentQuestion;
  String? selectedName;
  String? selectedThree;
  String? selectedOne;
  String feedback = "";

  @override
  void initState() {
    super.initState();
    _generateNewQuestion();
  }

  void _generateNewQuestion() {
    final random = Random();
    final index = random.nextInt(aminoAcids.length);
    setState(() {
      currentQuestion = aminoAcids[index];
      selectedName = null;
      selectedThree = null;
      selectedOne = null;
      feedback = "";
    });
  }

  List<T> _getShuffledOptions<T>(String correctValue, List<String> allValues) {
    final options = <String>{correctValue};
    final random = Random();
    while (options.length < 3) {
      options.add(allValues[random.nextInt(allValues.length)]);
    }
    final list = options.toList()..shuffle();
    return list as List<T>;
  }

  void _checkAnswers() {
    final correct = selectedName == currentQuestion!['name'] &&
        selectedThree == currentQuestion!['three'] &&
        selectedOne == currentQuestion!['one'];

    setState(() {
      feedback = correct ? "✅ Correct!" : "❌ Try Again!";
    });

    if (correct) {
      Future.delayed(Duration(seconds: 2), () {
        _generateNewQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestion == null) return CircularProgressIndicator();

    final allNames = aminoAcids.map((a) => a['name']!).toList();
    final allThrees = aminoAcids.map((a) => a['three']!).toList();
    final allOnes = aminoAcids.map((a) => a['one']!).toList();

    final nameOptions =
        _getShuffledOptions<String>(currentQuestion!['name']!, allNames);
    final threeOptions =
        _getShuffledOptions<String>(currentQuestion!['three']!, allThrees);
    final oneOptions =
        _getShuffledOptions<String>(currentQuestion!['one']!, allOnes);

    return Scaffold(
      appBar: AppBar(title: Text("Amino Acids Quiz")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                'assets/amino_acids/${currentQuestion!['image']}',
                height: 200,
                errorBuilder: (context, error, stackTrace) => Text("Image not found."),
              ),
              SizedBox(height: 16),
              _buildDropdown("Full Name", selectedName, nameOptions,
                  (val) => setState(() => selectedName = val)),
              _buildDropdown("Three-letter Code", selectedThree, threeOptions,
                  (val) => setState(() => selectedThree = val)),
              _buildDropdown("One-letter Code", selectedOne, oneOptions,
                  (val) => setState(() => selectedOne = val)),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _checkAnswers,
                child: Text("Submit"),
              ),
              SizedBox(height: 16),
              Text(
                feedback,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),    
    );
  }

  Widget _buildDropdown(
    String label,
    String? selectedValue,
    List<String> options,
    void Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        DropdownButton<String>(
          value: selectedValue,
          hint: Text("Select $label"),
          isExpanded: true,
          items: options
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
