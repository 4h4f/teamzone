import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:teamzone/Screens/NavBar.dart';
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
      drawer: NavBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            Color(0xff30384c), //const Color.fromRGBO(52, 130, 197, 1),
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
