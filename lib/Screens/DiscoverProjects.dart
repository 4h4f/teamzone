import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:teamzone/Screens/Dashboard.dart';

class DiscoverProjects extends StatefulWidget {
  DiscoverProjects({Key? key}) : super(key: key);

  @override
  _DiscoverProjectsState createState() => _DiscoverProjectsState();
}

class _DiscoverProjectsState extends State<DiscoverProjects> {
  List<String> projectnames = [
    "Emergency calls ",
    "Health Ai System ",
    "Big Data Analysis",
    "International Airliens System"
  ];
  List<String> projectCreationDate = [
    "2/3/2021",
    "16/7/2022",
    "19/11/2021",
    "5/12/2022",
  ];
  List<String> projectClient = [
    "Ben adam",
    "Ali khalid",
    "Ahmed mohammed",
    "Kareem ali",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            Colors.white, //const Color.fromRGBO(155, 89, 182, 0.7),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff30384c),
          title: Text('Discover Projects'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              //-----------------------------
              height: 120,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xff30384c),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)),
                      child: const TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                            hintText: 'Search by project name',
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 12)),

                        // controller: controller,
                      ),
                    ),
                  )
                  //-----------------------------------
                ],
              ),
            ),
            /*const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Select your project',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),*/
            Expanded(
                child: ListView.builder(
              itemCount: projectnames.length,
              itemBuilder: (BuildContext ctx, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    height: 160,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('lib/assets/images/discover.png'),
                        fit: BoxFit.contain,
                        alignment: Alignment.topRight,
                      ),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                projectnames[index],
                                style: const TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: <Widget>[
                              Text("Client"),
                              SizedBox(
                                width: 5,
                              ),
                              Text(projectClient[index]),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.date_range,
                                        size: 16,
                                      ),
                                    ),
                                    TextSpan(
                                        text: '  ' + projectCreationDate[index],
                                        style: TextStyle(
                                          color: Colors.black,
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          /* Column(
                            children: <Widget>[
                              NeumorphicButton(
                                margin: EdgeInsets.only(top: 50),
                                onPressed: () {
                                  print(projectnames[index]);
                                },
                                style: const NeumorphicStyle(
                                  shape: NeumorphicShape.flat,
                                  lightSource: LightSource.bottomRight,
                                  boxShape: NeumorphicBoxShape.circle(),
                                  color: Colors.white,
                                  depth: .1,
                                ),
                                child: const Icon(
                                  Icons.navigate_next,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),*/
                        ],
                      ),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
