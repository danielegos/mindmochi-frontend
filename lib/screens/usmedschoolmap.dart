// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class USMedSchoolMapScreen extends StatelessWidget {
//   final Uri _url = Uri.parse('https://usmedschoolmap.onrender.com');

//   Future<void> _openLink(BuildContext context) async {
//     if (!await launchUrl(
//       _url,
//       mode: LaunchMode.inAppWebView,
//     )) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Could not launch $_url')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('US Med School Map'),
//       ),
//       body: Center(
//         child: ElevatedButton.icon(
//           onPressed: () => _openLink(context),
//           icon: Icon(Icons.map),
//           label: Text('Open Interactive Map'),
//         ),
//       ),
//     );
//   }
// }
