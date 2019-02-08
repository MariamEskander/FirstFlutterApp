//dart is library based  lazm a3ml import
import 'package:first_flutter_app/screen/SecondScreen.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

//void main() {
//  //mmkn aktb code y check 7agat mo3iana aw atl3 popup
//  //lw ktbt 7aga hna htfkd 5asiet l hot reload
//  runApp(Text(
//    "My Text",
//    textDirection: TextDirection.ltr,
//  ));
//}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair =
        new WordPair.random(); //final immutable data type (7alet l type da a)
    //scafolld y3ny s2ala btb2a gwa material app
    return MaterialApp(
        //body fiha required
        home: RandomWords()
//      Scaffold(
//          appBar: AppBar(),
//          body: Center(
//          child:  Text(wordPair.toString(),
//          style: TextStyle(
//            fontSize: 50,
//            color: Colors.red
//          ),),
//          )),
        );
  }
}

//ynf3 statless tnady 3la stateful w l 3ks

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override // Add from this line ...
  Widget build(BuildContext context) {
    final WordPair wordPair = new WordPair.random();
    return new Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                title: Text("My menu title"),
                automaticallyImplyLeading: false,
              ),
              ListTile(
                title: Text("My Menu Item"),
                onTap: () {
                  print("My Menu Item Clicked!");
                },
              )
            ],
          ),
        ), //sf7a kamlaaa
        appBar: AppBar(
          title: Text("My App"),
        ),
        body: _buildSuggestions()
//
//        Center(
//          child: Text(
//            wordPair.toString(),
//            style: TextStyle(fontSize: 50, color: Colors.red),
//          ),
//        )
        );
  } // ... to this line.

  Widget _buildSuggestions() {
    //item count w item builder
    //listview fiha lazy loading bt7ml eli m7tagino bs
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return new Divider();
          }

          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      trailing: Icon(
        Icons.favorite,
        color: Colors.red,
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        child: Text(pair.toString().substring(0, 1)),
      ),
      subtitle: Text("My subtitle"),
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => SecondScreen(pair),
          ),
        );
      },
    );
  }
}
