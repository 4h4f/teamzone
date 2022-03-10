import 'dart:convert';
import 'dart:developer';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:teamzone/Models/ProjectModel.dart';
import 'package:teamzone/Screens/DashboadWidgets/FieldTask.dart';
import 'package:teamzone/Screens/NavBar.dart';
import 'DashboadWidgets/CurrentState.dart';
import 'DashboadWidgets/DoneState.dart';
import 'DashboadWidgets/OverallState.dart';
import 'package:http/http.dart' as http;

Future<ProjectModel> getProjectInfo() async {
  final response = await http.post(
    Uri.parse('http://137.184.88.117/api/client/project'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'username': 'Trudie Walter', //Chadrick Friesen
      'code': 'p1Mi1ipJ',
    }),
  );
  inspect(response);
  print(response.statusCode);
  return projectFromJson(response.body);
}

class Dashboard extends StatefulWidget {
  final String? code;
  final String? username;
  final String? email;
  Dashboard(
      {Key? key,
      @required this.code,
      @required this.username,
      @required this.email})
      : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    //print(widget.code);
    final screens = [
      OverallState(code: widget.code, username: widget.username),
      CurrentState(code: widget.code, username: widget.username),
      DoneState(code: widget.code, username: widget.username),
      FiledTask(code: widget.code, username: widget.username)
    ];
    final iconItems = <Widget>[
      const Icon(
        Icons.dashboard,
        size: 20,
      ),
      const Icon(
        Icons.done,
        size: 20,
      ),
      const Icon(
        Icons.error_outline,
        size: 20,
      ),
    ];
    return Scaffold(
      drawer: NavBar(username: widget.username),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            const Color(0xff30384c), //const Color.fromRGBO(52, 130, 197, 1),
        elevation: 0,
        title: const Text(
          'Dashbord',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => widget));
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        child: BottomNavyBar(
          selectedIndex: index,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.dashboard),
              title: Text(
                'Status',
                style: TextStyle(color: Colors.black),
              ),
              activeColor: Colors.lightBlue,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.alt_route_sharp),
              title: Text('In Progress', style: TextStyle(color: Colors.black)),
              activeColor: Colors.amberAccent,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.done_outline_rounded),
              title: Text('Done', style: TextStyle(color: Colors.black)),
              activeColor: Colors.lightGreen,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.error_outline_sharp),
              title: Text('Done', style: TextStyle(color: Colors.black)),
              activeColor: Colors.redAccent,
            )
          ],
          onItemSelected: (index) => setState(() => this.index = index),
        ),
        /* child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Color.fromRGBO(48, 56, 76, 1),
          animationDuration: Duration(milliseconds: 400),
          animationCurve: Curves.easeInCirc,
          color: Color.fromRGBO(48, 56, 76, 1),
          items: iconItems,
          index: index,
          height: 50,
          onTap: (index) => setState(() => this.index = index),
        ),*/
      ),
    );
  }
}
