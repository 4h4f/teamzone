import 'package:flutter/material.dart';

class OverallState extends StatefulWidget {
  OverallState({Key? key}) : super(key: key);

  @override
  _OverallStateState createState() => _OverallStateState();
}

class _OverallStateState extends State<OverallState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Text('Overall'),
            )
          ],
        ),
      ),
    );
  }
}
