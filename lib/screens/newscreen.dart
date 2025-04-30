import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  static const int _rows = 10;
  static const int _columns = 10;
  static const double _cellSize = 20;

  List<Point<int>> _snake = [Point(5, 5)];
  Point<int> _food = Point(2, 2);
  String _direction = 'right';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
    _snake = [Point(5, 5)];
    _direction = 'right';
    _spawnFood();
    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: 300), (_) => _moveSnake());
  }

  void _spawnFood() {
    final rand = Random();
    Point<int> newFood;
    do {
      newFood = Point(rand.nextInt(_columns), rand.nextInt(_rows));
    } while (_snake.contains(newFood));
    _food = newFood;
  }

  void _moveSnake() {
    final head = _snake.first;
    Point<int> newHead;

    switch (_direction) {
      case 'up':
        newHead = Point(head.x, head.y - 1);
        break;
      case 'down':
        newHead = Point(head.x, head.y + 1);
        break;
      case 'left':
        newHead = Point(head.x - 1, head.y);
        break;
      case 'right':
      default:
        newHead = Point(head.x + 1, head.y);
        break;
    }

    if (newHead.x < 0 ||
        newHead.y < 0 ||
        newHead.x >= _columns ||
        newHead.y >= _rows ||
        _snake.contains(newHead)) {
      _startGame(); // Restart on collision
      return;
    }

    setState(() {
      _snake.insert(0, newHead);
      if (newHead == _food) {
        _spawnFood(); // Eat food
      } else {
        _snake.removeLast(); // Move forward
      }
    });
  }

  void _changeDirection(String newDirection) {
    final opposite = {
      'up': 'down',
      'down': 'up',
      'left': 'right',
      'right': 'left',
    };
    if (_direction != opposite[newDirection]) {
      setState(() => _direction = newDirection);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget _buildGameBoard() {
    return Container(
      width: _columns * _cellSize,
      height: _rows * _cellSize,
      color: Colors.grey[300],
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _columns,
        ),
        itemCount: _rows * _columns,
        itemBuilder: (context, index) {
          final x = index % _columns;
          final y = index ~/ _columns;
          final point = Point(x, y);

          Color color;
          if (_snake.contains(point)) {
            color = Colors.green;
          } else if (point == _food) {
            color = Colors.red;
          } else {
            color = Colors.white;
          }

          return Container(
            margin: EdgeInsets.all(1),
            color: color,
          );
        },
      ),
    );
  }

  Widget _buildControls() {
    return Column(
      children: [
        IconButton(
          icon: Icon(Icons.keyboard_arrow_up),
          onPressed: () => _changeDirection('up'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.keyboard_arrow_left),
              onPressed: () => _changeDirection('left'),
            ),
            SizedBox(width: 48), // Space in middle
            IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: () => _changeDirection('right'),
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.keyboard_arrow_down),
          onPressed: () => _changeDirection('down'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Snake Game")),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 16),
            Text('Snake Length: ${_snake.length}'),
            SizedBox(height: 16),
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    _buildGameBoard(),
                    SizedBox(height: 16),
                    _buildControls(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
