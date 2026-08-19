import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noise Monitor',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NoiseMonitor(),
    );
  }
}


class NoiseMonitor extends StatefulWidget {
  @override
  _NoiseMonitorState createState() => _NoiseMonitorState();
}


class _NoiseMonitorState extends State<NoiseMonitor> {
  final dbRef = FirebaseDatabase.instance.ref();
  String noiseLevel = "Loading...";


  @override
  void initState() {
    super.initState();
    dbRef.child('noise_level').onValue.listen((event) {
      setState(() {
        noiseLevel = event.snapshot.value.toString();
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Noise Level')),
      body: Center(child: Text('Noise Level: $noiseLevel dB')),
    );
  }
}
