import 'package:flutter/material.dart';

class DoneState extends StatefulWidget {
  DoneState({Key? key}) : super(key: key);

  @override
  _DoneStateState createState() => _DoneStateState();
}

class _DoneStateState extends State<DoneState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Text('Done'),
            )
          ],
        ),
      ),
    );
  }
}
