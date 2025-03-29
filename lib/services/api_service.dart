import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://127.0.0.1:8000/api/items/';

  Future<List<Item>> fetchItems() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Item.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }
}

class Item {
  final int id;
  final String name;
  final String description;

  Item({required this.id, required this.name, required this.description});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}

class ApiImage {  // Rename Image to ApiImage to avoid the conflict
  final String title;
  final String imageUrl;

  ApiImage({required this.title, required this.imageUrl});

  factory ApiImage.fromJson(Map<String, dynamic> json) {
    return ApiImage(
      title: json['title'],
      imageUrl: json['image'],  // The URL of the image
    );
  }
}

