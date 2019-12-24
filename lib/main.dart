import 'package:flutter/material.dart';
import 'package:privacy_policy_generator/screens/about.dart';
import 'package:privacy_policy_generator/screens/disclaimer.dart';
import 'package:privacy_policy_generator/screens/edit.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(primarySwatch: Colors.teal),
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Choice _selectedChoice = choices[0];

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
      if(choice.title == 'About'){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => About()),
        );
      }else if(choice.title == 'Disclaimer'){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Disclaimer()),
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            // overflow menu
            PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
              },
            ),
          ],
          title: Text('Privacy Policy'),
        ),
        body: Edit(),
      ),
    );
  }

}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'About', icon: Icons.info),
  const Choice(title: 'Disclaimer', icon: Icons.description),
];
