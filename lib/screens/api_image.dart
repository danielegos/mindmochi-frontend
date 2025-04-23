import 'package:flutter/material.dart';
import '../services/api_service.dart'; // Import mindmochi_django API
import 'package:http/http.dart' as http;
import 'dart:convert';

// Create Image API test page
// Create Image API test page
class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  late Future<List<ApiImage>> images;  // Use ApiImage instead of Image

  Future<List<ApiImage>> fetchImages() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/images/'));
    
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((item) => ApiImage.fromJson(item)).toList();  // Use ApiImage
    } else {
      throw Exception('Failed to load images');
    }
  }

  @override
  void initState() {
    super.initState();
    images = fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Images")),
      body: FutureBuilder<List<ApiImage>>(
        future: images,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No images fouxnd."));
          }

          List<ApiImage> images = snapshot.data!;
          return ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(images[index].title),
                // leading: Image.network(images[index].imageUrl),  // Use Image.network here
                leading: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    images[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                
              );
            },
          );
        },
      ),
    );
  }
}
