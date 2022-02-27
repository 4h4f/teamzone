import 'package:flutter/material.dart';
import 'package:teamzone/Screens/Welcome.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Abdelrhman'),
            accountEmail: Text('Abdoeltayeb10@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('lib/assets/images/profile1.jpg'),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xff30384c),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Welcome()),
            ),
          ),
        ],
      ),
    );
  }
}
