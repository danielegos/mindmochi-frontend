import 'package:flutter/material.dart';

final List<String> allPrereqs = [
  'Biology',
  'General Chemistry',
  'Organic Chemistry',
  'Physics',
  'Biochemistry',
  'English',
  'Math',
  'Psychology',
  'Sociology',
];

final List<Map<String, dynamic>> medSchools = [
  {
    'name': 'Stanford University School of Medicine',
    'requiredPrereqs': [
      'Biology',
      'General Chemistry',
      'Organic Chemistry',
      'Physics',
      'English',
    ],
  },
  {
    'name': 'Harvard Medical School',
    'requiredPrereqs': [
      'Biology',
      'General Chemistry',
      'Organic Chemistry',
      'Biochemistry',
      'Math',
    ],
  },
  {
    'name': 'UCLA David Geffen School of Medicine',
    'requiredPrereqs': [
      'Biology',
      'General Chemistry',
      'Physics',
      'English',
      'Psychology',
    ],
  },
];


class MedSchoolMatcherPage extends StatefulWidget {
  @override
  _MedSchoolMatcherPageState createState() => _MedSchoolMatcherPageState();
}

class _MedSchoolMatcherPageState extends State<MedSchoolMatcherPage> {
  final List<String> selectedPrereqs = [];

  List<String> qualifiedSchools = [];

  void findQualifiedSchools() {
    final List<String> matches = [];

    for (var school in medSchools) {
      final List<String> required = List<String>.from(school['requiredPrereqs']);
      final bool meetsAll = required.every((req) => selectedPrereqs.contains(req));
      if (meetsAll) {
        matches.add(school['name']);
      }
    }

    setState(() {
      qualifiedSchools = matches;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Med School Prereq Checker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Select the courses you have completed:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: allPrereqs.map((prereq) {
                  return CheckboxListTile(
                    title: Text(prereq),
                    value: selectedPrereqs.contains(prereq),
                    onChanged: (checked) {
                      setState(() {
                        if (checked == true) {
                          selectedPrereqs.add(prereq);
                        } else {
                          selectedPrereqs.remove(prereq);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: findQualifiedSchools,
              child: Text('Find Schools'),
            ),
            SizedBox(height: 20),
            Text(
              'Qualified Med Schools:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...qualifiedSchools.map((school) => ListTile(
                  title: Text(school),
                  leading: Icon(Icons.school),
                )),
          ],
        ),
      ),
    );
  }
}
