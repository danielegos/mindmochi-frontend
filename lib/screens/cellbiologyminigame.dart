import 'package:flutter/material.dart';

void main() => runApp(CellBiologyMinigame());

class CellBiologyMinigame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cell Biology Minigame',
      // theme: ThemeData(
      //   primarySwatch: Colors.teal,
      // ),
      home: Scaffold(
        appBar: AppBar(title: Text('Drag to the Organelle')),
        body: CellMinigame(),
      ),
    );
  }
}

class CellMinigame extends StatefulWidget {
  @override
  _CellMinigameState createState() => _CellMinigameState();
}

class _CellMinigameState extends State<CellMinigame> {
  String _feedbackMessage = '';
  bool _answered = false;

  final String correctAnswer = 'Mitochondria';

  Widget _buildOrganelleTarget(String label) {
    return DragTarget<String>(
      onWillAcceptWithDetails: (data) => true,
      onAcceptWithDetails: (data) {
        setState(() {
          if (data == correctAnswer) {
            _feedbackMessage = '✅ Correct!';
          } else {
            _feedbackMessage = '❌ Try again!';
          }
          _answered = true;
        });
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 120,
          height: 100,
          margin: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(label,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  Widget _buildDraggableCircle() {
    return Draggable<String>(
      data: 'Mitochondria', // answer encoded in the draggable
      feedback: _circle(),
      childWhenDragging: Opacity(opacity: 0.4, child: _circle()),
      child: _circle(),
    );
  }

  Widget _circle() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Which organelle is responsible for energy production?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 24),
        _buildDraggableCircle(),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildOrganelleTarget("Nucleus"),
            _buildOrganelleTarget("Mitochondria"),
            _buildOrganelleTarget("Golgi Apparatus"),
          ],
        ),
        SizedBox(height: 32),
        if (_answered)
          Text(
            _feedbackMessage,
            style: TextStyle(
              fontSize: 20,
              color: _feedbackMessage.contains("Correct") ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}
