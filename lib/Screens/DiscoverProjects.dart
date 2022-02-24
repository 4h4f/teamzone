import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
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
                  margin: const EdgeInsets.all(20),
                  height: 240,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('lib/assets/images/back.png'),
                      fit: BoxFit.cover,
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
                          children: const <Widget>[
                            Text("Client"),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Abdelrhamn mohammed"),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            RichText(
                              text: const TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.date_range,
                                      size: 16,
                                    ),
                                  ),
                                  TextSpan(
                                      text: '    Created at 20/2/2022',
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
                        Column(
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
                        ),
                      ],
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
