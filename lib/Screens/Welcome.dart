import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';
import 'package:teamzone/Screens/ClientLogin.dart';
import 'ManagerLogin.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 56, 76, 1),
      //const Color.fromRGBO(155, 89, 182, 0.7),
      // ignore: sized_box_for_whitespace
      body: SafeArea(
        // ignore: sized_box_for_whitespace
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 120,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(90, 106, 146, 1),
                  //Color(0xff30384c), //Color.fromRGBO(52, 130, 197, 1),
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
                          Text(
                            "TEAM ZONE",
                            style: TextStyle(
                              letterSpacing: 4,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //-----------------------------------
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),

                    const Text(
                      'Select your login type',
                      style: TextStyle(
                        //fontFamily: 'RobotoSerif',
                        //fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 2.0,
                        wordSpacing: 5.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    //------------------------------------------
                    Container(
                      height: 440,
                      width: MediaQuery.of(context).size.height - 40,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(252, 243, 207, 1),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              blurRadius: 10,
                              spreadRadius: 1),
                        ],
                        image: const DecorationImage(
                          image: AssetImage(
                              "lib/assets/images/welcomeScreen2.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding:
                            //const EdgeInsets.symmetric(horizontal: 50, vertical: 120),
                            EdgeInsets.only(top: 240, left: 50, right: 50),
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: const Border(
                                  bottom: BorderSide(color: Colors.white),
                                  left: BorderSide(color: Colors.white),
                                  right: BorderSide(color: Colors.white),
                                  top: BorderSide(color: Colors.white),
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
                                  'Manager',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            //-------------------------------
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: const Border(
                                  bottom: BorderSide(color: Colors.white),
                                  left: BorderSide(color: Colors.white),
                                  right: BorderSide(color: Colors.white),
                                  top: BorderSide(color: Colors.white),
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
                                  'Client',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Clientlogin()),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
