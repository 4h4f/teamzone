import 'package:flutter/material.dart';

class DiscoverProjects extends StatefulWidget {
  DiscoverProjects({Key? key}) : super(key: key);

  @override
  _DiscoverProjectsState createState() => _DiscoverProjectsState();
}

class _DiscoverProjectsState extends State<DiscoverProjects> {
  List<String> projectnames = [
    "project 1",
    "project 2",
    "project 3",
    "project 4"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(155, 89, 182, 0.7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(155, 89, 182, 0.6),
        title: Text('Discover Projects'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              'Select your project',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: projectnames.length,
            itemBuilder: (BuildContext ctx, int index) {
              return Container(
                margin: EdgeInsets.all(20),
                height: 150,
                decoration: BoxDecoration(
                  // color: const Color.fromRGBO(252, 243, 207, 1),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 1),
                  ],
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
