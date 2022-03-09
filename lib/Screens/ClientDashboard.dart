import 'dart:convert';
import 'dart:developer';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:teamzone/Models/ClientModel.dart';
import 'package:teamzone/Models/ProjectModel.dart';
import 'package:teamzone/Screens/DashboadWidgets/FieldTask.dart';
import 'package:teamzone/Screens/NavBar.dart';
import 'ClientDashboard/DoneStateClient.dart';
import 'ClientDashboard/FieldTaskClient.dart';
import 'ClientDashboard/OverallStateClient.dart';
import 'DashboadWidgets/CurrentState.dart';
import 'DashboadWidgets/DoneState.dart';
import 'DashboadWidgets/OverallState.dart';
import 'package:http/http.dart' as http;
import 'ClientDashboard/CurrentStateClient.dart';

Future<ClientProjcet> getProjectInfo(String username, String code) async {
  final response = await http.post(
    Uri.parse('http://137.184.88.117/api/users/client/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'username': username, //Chadrick Friesen
      'code': code,
    }),
  );
  inspect(response);
  print(response.statusCode);
  return clientProjcetFromJson(response.body);
}

@override
void initState() {}

class ClientDashboard extends StatefulWidget {
  final String? username;
  final String? email;
  final String? code;
  ClientDashboard(
      {Key? key,
      @required this.username,
      @required this.email,
      @required this.code})
      : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<ClientDashboard> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    inspect(widget.username);
    final screens = [
      ClientOverallState(
          username: widget.username.toString(), code: widget.code.toString()),
      ClientCurrentState(
          username: widget.username.toString(), code: widget.code.toString()),
      ClientDoneState(
          username: widget.username.toString(), code: widget.code.toString()),
      ClientFiledTask(
          username: widget.username.toString(), code: widget.code.toString())
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
      drawer: NavBar(username: widget.username, email: widget.email),
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
      //screens[index],
      body: FutureBuilder(
          future: getProjectInfo(
              widget.username.toString(), widget.code.toString()),
          builder:
              (BuildContext context, AsyncSnapshot<ClientProjcet> snapshot) {
            if (snapshot.hasData) {
              return screens[index];
            } else {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        child: BottomNavyBar(
          selectedIndex: index,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: const Icon(Icons.dashboard),
              title: const Text(
                'Status',
                style: TextStyle(color: Colors.black),
              ),
              activeColor: Colors.lightBlue,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.alt_route_sharp),
              title: const Text('In Progress',
                  style: TextStyle(color: Colors.black)),
              activeColor: Colors.amberAccent,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.done_outline_rounded),
              title: const Text('Done', style: TextStyle(color: Colors.black)),
              activeColor: Colors.lightGreen,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.error_outline_sharp),
              title: const Text('Done', style: TextStyle(color: Colors.black)),
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
