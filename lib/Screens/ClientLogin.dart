import 'package:flutter/material.dart';

class Clientlogin extends StatefulWidget {
  Clientlogin({Key? key}) : super(key: key);

  @override
  _ClientloginState createState() => _ClientloginState();
}

class _ClientloginState extends State<Clientlogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ignore: sized_box_for_whitespace
            Container(
              height: 250,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/background.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Login as a Client',
                    style: TextStyle(
                        color: Color.fromRGBO(49, 39, 79, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(196, 135, 198, .3),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey[200]!))),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.people),
                              border: InputBorder.none,
                              hintText: 'Username or Email',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        //----------------------------------
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        //-----------
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: const Border(
                        bottom: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      color: const Color.fromRGBO(49, 39, 79, 1),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
