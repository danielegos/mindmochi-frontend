import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import screens
// import 'screens/cellbiology.dart';
// import 'screens/newscreen.dart';
// import 'screens/api_item.dart';
// import 'screens/api_image.dart';
import 'screens/aminoacids.dart';
// import 'screens/cellbiologyminigame.dart';
import 'screens/usmedschoolmap.dart';
import 'screens/functionalgroups.dart';
import 'screens/iupacpractice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MedMochi',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 34, 255, 108)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    }
    else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

// Homepage

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    // ...

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      // case 1:
      //   page = FavoritesPage();
      //   break;
      // case 1:
      //   page = MedSchoolMatcherPage();
      //   break;
      // case 2:
      //   page = CellBiology();
      //   break;
      // case 3:
      //   page = ItemList();
      //   break;
      // case 4:
      //   page = ImagePage();
      //   break;
      case 1:
        page = AminoAcids();
        break;
      // case 6:
      //   page = CellBiologyMinigame();
      //   break;

      case 2:
        page = FunctionalGroups();
      case 3:
        page = IupacPractice();
      case 4:
        page = USMedSchoolMapScreen();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }


    // ...
    
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
             

              SafeArea(

                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                      icon: Image.asset(
                          'logo/mm_logo.png',
                          // width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                          height: 30,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) => Text("Image not found."),
                        ),                      
                      
                      label: Text('Home'),
                    ),
                    // NavigationRailDestination(
                    //   icon: Icon(Icons.favorite),
                    //   label: Text('Favorites'),
                    // ),
                    // NavigationRailDestination(
                    //   icon: Icon(Icons.car_crash), 
                    //   label: Text('Med School Prereq Checker')
                    //   ),
                    // NavigationRailDestination(
                    //   icon: Icon(Icons.biotech), 
                    //   label: Text('Cell Biology')
                    //   ),
                    // NavigationRailDestination(
                    //   icon: Icon(Icons.wifi), 
                    //   label: Text('Django API Test')
                    //   ),
                    // NavigationRailDestination(
                    //   icon: Icon(Icons.image), 
                    //   label: Text('Django Image API Test')
                    //   ),
                    NavigationRailDestination(
                      icon: Icon(Icons.line_axis), 
                      label: Text('Amino Acid Quiz')
                      ),
                    // NavigationRailDestination(
                    //   icon: Icon(Icons.brightness_low_sharp), 
                    //   label: Text('Cell Biology Mini Game')
                    //   ),
                    NavigationRailDestination(
                      icon: Icon(Icons.hexagon_outlined), 
                      label: Text('Functional Group Quiz')
                      ),
                    NavigationRailDestination(
                      icon: Icon(Icons.abc), 
                      label: Text('IUPAC Naming Quiz')
                      ),
                    NavigationRailDestination(
                      icon: Icon(Icons.school), 
                      label: Text('USMedSchoolMap')
                      ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

// ...

// class FavoritesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();

//     if (appState.favorites.isEmpty) {
//       return Center(
//         child: Text('No favorites yet.'),
//       );
//     }

//     return ListView(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(20),
//           child: Text('You have '
//               '${appState.favorites.length} favorites:'),
//         ),
//         for (var pair in appState.favorites)
//           ListTile(
//             leading: Icon(Icons.favorite),
//             title: Text(pair.asLowerCase),
//           ),
//       ],
//     );
//   }
// }


class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Image: MedMochi logo
          Center(
            child: Image.asset(
              'logo/mm_logo.png',
              width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
              height: 200,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Text("Image not found."),
            ),
          ),
          SizedBox(height: 20),


          BigCard(pair: pair),

          // BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
                



              Text("Select a module from the menu to get started!"),

              // ElevatedButton.icon(
              //   onPressed: () {
              //     appState.toggleFavorite();
              //   },
              //   icon: Icon(icon),
              //   label: Text('Like'),
              // ),
              // SizedBox(width: 10),
              // ElevatedButton(
              //   onPressed: () {
              //     appState.getNext();
              //   },
              //   child: Text('Next'),
              // ),
            ],
          ),
          // SizedBox(height: 20),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => MedSchoolMatcherPage()),
          //     );
          //   },
          //   child: Text("Go to Med School Prereq Checker"),
          // ),


        ],
      ),
    );
  }
}

// ...


class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      height: 1,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal
    );

    return Card(
      color: theme.colorScheme.primary,
      //elevation: 30, // Uncomment to enable Shadow
      //shadowColor: theme.colorScheme.tertiary, // Shadow color
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          // pair.asLowerCase,
          "MedMochi", 
          style: style,


                    

     
     

        ),
      ),
    );
  }
}