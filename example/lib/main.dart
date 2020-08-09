import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:timezone_name/timezone_name.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _timeZoneName = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String timeZoneName;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      timeZoneName = await TimezoneName.name;
    } on PlatformException {
      timeZoneName = 'Failed to get timezone name.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _timeZoneName = timeZoneName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TimeZone App'),
        ),
        body: Center(
          child: Text('Current TimeZone: $_timeZoneName\n'),
        ),
      ),
    );
  }
}
