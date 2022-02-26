import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'DashboadWidgets/CurrentState.dart';
import 'DashboadWidgets/DoneState.dart';
import 'DashboadWidgets/OverallState.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final screens = [
      OverallState(),
      CurrentState(),
      DoneState(),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(52, 130, 197, 1),
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
                  onPressed: () {},
                  icon: Icon(
                    Icons.calendar_today,
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
        child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.blue,
          animationDuration: Duration(milliseconds: 400),
          animationCurve: Curves.easeInCirc,
          color: Color.fromRGBO(76, 167, 245, 1),
          items: iconItems,
          index: index,
          height: 50,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
