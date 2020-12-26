import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Merry Christmas!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  AudioCache audioCache = AudioCache();

  List<String> noteList = [
    '0232',
    '2',
    '2',
    '0232',
    '2',
    '2',
    '0232',
    '5',
    '003',
    '0',
    '0232',
    '0003',
    '3',
    '3',
    '3',
    '0233',
    '2',
    '2',
    '2',
    '2',
    '2002',
    '0',
    '0100',
    '2',
    '2220',
    '2225',
    '0232',
    '2',
    '2',
    '0232',
    '2',
    '2',
    '0232',
    '5',
    '003',
    '0',
    '0232',
    '0003',
    '3',
    '3',
    '3',
    '0233',
    '2',
    '2',
    '2',
    '2',
    '2225',
    '5',
    '2223',
    '0',
    '023',
  ];

  // List<String> noteList = [
  //   1, // Dash-
  //   2, //ing
  //   3, //through
  //   4, // the
  //   5, //snow
  //   6, //in
  //   6, //a
  //   1, //one-
  //   2, //horse
  //   3, //o
  //   4, //pen
  //   7, //sleigh
  //   8, //O
  //   9, //-ver
  //   10, //the
  //   2, //fields
  //   3, //we
  //   11, //go
  //   12, //laugh-
  //   13, //ing
  //   10, //all
  //   3, //the
  //   14, //way
  //   1, // Bells-
  //   2, //on
  //   3, //bob
  //   4, // tail
  //   5, //ring
  //   1, // mak-
  //   2, // -ing
  //   3, // spir-
  //   4, // its
  //   7, // bright
  //   8, // What
  //   9, //fun
  //   10, //it
  //   2, //is
  //   3, //to
  //   15, //laugh,
  //   13, //and
  //   13, //sing,
  //   13, //a
  //   15, //sleigh-
  //   13, //ing,
  //   10, //song
  //   2, //to-
  // ];

  List<String> lyricsList = [
    '',
    'Jin',
    'gle',
    'bells',
    'Jin',
    'gle',
    'bells',
    'Jin',
    'gle',
    'all',
    'the',
    'way',
    'Oh',
    'what',
    'fun',
    'it',
    'is',
    'to',
    'ride',
    'in',
    'a',
    'one-',
    'horse',
    'o-',
    'pen',
    'sleigh',
    '',
    'Jin',
    'gle',
    'bells',
    'Jin',
    'gle',
    'bells',
    'Jin',
    'gle',
    'all',
    'the',
    'way',
    'Oh',
    'what',
    'fun',
    'it',
    'is',
    'to',
    'ride',
    'in',
    'a',
    'one-',
    'horse',
    'o-',
    'pen',
    'sleigh',
  ];

  @override
  void initState() {
    if (Platform.isIOS) {
      if (audioCache.fixedPlayer != null) {
        audioCache.fixedPlayer.startHeadlessService();
      }
    }
    super.initState();
  }

  void _incrementCounter() {
    audioCache.play(
      '${noteList[_counter]}.wav',
    );

    print('PLAYING ${noteList[_counter]}.wav');
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff29335d),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Image.asset('assets/santa.png'),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '#FlutterCounterChallenge2020,\n the Christmas style!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 22,),
                  ),
                ),
                Text(
                  '${lyricsList[_counter]}',
                  style: Theme.of(context).textTheme.headline4.copyWith( fontSize: 55,
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _counter = 0;
              });
            },
            tooltip: 'Increment',
            child: Icon(Icons.delete_forever),
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class _Btn extends StatelessWidget {
  final String txt;
  final VoidCallback onPressed;

  const _Btn({Key key, this.txt, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 48.0,
      child: RaisedButton(child: Text(txt), onPressed: onPressed),
    );
  }
}
