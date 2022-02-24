import 'package:flutter/material.dart';

class CurrentState extends StatefulWidget {
  CurrentState({Key? key}) : super(key: key);

  @override
  _CurrentStateState createState() => _CurrentStateState();
}

class _CurrentStateState extends State<CurrentState> {
  var temp = [
    {"name": "Roomm", "description": 1},
    {"name": "Twimm", "description": 1},
    {"name": "Tanoodle", "description": 1},
    {"name": "Meevee", "description": 1},
    {"name": "Quamba", "description": 1}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(52, 130, 197, 1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.account_tree_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'In Progress Tasks',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    //-----------------------------------
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 200,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(252, 243, 207, 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.2),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ]),
                  )
                ],
              ),

              //-------------------
            ],
          ),
        ),
      ),
    );
  }
}
