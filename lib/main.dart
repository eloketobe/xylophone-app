import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: XylophonePlay()),
    );
  }
}

class XylophonePlay extends StatefulWidget {
  @override
  _XylophonePlayState createState() => _XylophonePlayState();
}

class _XylophonePlayState extends State<XylophonePlay> {
  final AudioCache player = AudioCache();
  void playSound({int noteNumber}) {
    player.play('note$noteNumber.wav');
  }

  Widget buildXylophone({int, noteNumber, Color color}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.all(0),
          ),
        ),
        onPressed: () {
          playSound(noteNumber: noteNumber);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildXylophone(color: Colors.red, noteNumber: 1),
            buildXylophone(color: Colors.orange, noteNumber: 2),
            buildXylophone(color: Colors.yellow, noteNumber: 3),
            buildXylophone(color: Colors.green, noteNumber: 4),
            buildXylophone(color: Colors.blue, noteNumber: 5),
            buildXylophone(color: Colors.indigo, noteNumber: 6),
            buildXylophone(color: Colors.purpleAccent, noteNumber: 7),
          ],
        ),
      ),
    );
  }
}
