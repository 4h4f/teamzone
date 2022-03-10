import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:teamzone/Models/discoverProjectModel.dart';

import 'package:teamzone/Screens/Dashboard.dart';

import 'package:http/http.dart' as http;

Future<Projects> getProjectInfo() async {
  final response = await http.get(
    Uri.parse('http://137.184.88.117/api/projects'),
  );
  //inspect(response.body);
  //print(response.statusCode);
  return projectsFromJson(response.body);
}

/*Future getpjinfo() async {
  ProjectModel pjo = await getProjectInfo();
  return pjo.data.name;
}*/

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
  // late Future<ProjectModel> pro;

  /* @override
  void initState() {
    super.initState();

    // fetchName function is a asynchronously to GET http data
    /* getProjectInfo().then((result) {
      // Once we receive our name we trigger rebuild.
      setState(() {
        pj = result;
      });
    });*/
  }*/

  //late ProjectModel pj;
  //late var pr;
  //late ProjectModel projectInfo;
  /* @override
  initState() {
    super.initState();
    // Add listeners to this class
    // pr = getProjectInfo();
    convertProjectInfo();
  }*/

  /*@override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    // pr = getProjectInfo() as ProjectModel;
  }*/

  /*void convertProjectInfo() async {
    pj = await getProjectInfo();
  }*/

  @override
  Widget build(BuildContext context) {
    /* return SafeArea(
      child: FutureBuilder<ProjectModel>(
          future: getProjectInfo(),
          builder:
              (BuildContext context, AsyncSnapshot<ProjectModel> snapshot) {
            inspect(snapshot.data);
            if (snapshot.hasData) {
              return Center(
                child: Text('$snapshot.data.data.id'),
              );
            }
            /* if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null) {
                return Text('no data');
              } else {
                return Center(
                  child: Text('$snapshot.data.data.id'),
                );
              }*/

            //inspect(snapshot.data);

            else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }*/

    //getProject();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white, //const Color.fromRGBO(155, 89, 182, 0.7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff30384c),
        title: Text('Discover Projects'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getProjectInfo(),
        builder: (BuildContext context, AsyncSnapshot<Projects> snapshot) {
          if (snapshot.hasData) {
            inspect(snapshot.data!.data);
            return Column(
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
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 12)),

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
                  itemCount: snapshot.data?.data.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return InkWell(
                      onTap: () async {
                        //ProjectModel temp = await getProjectInfo();
                        //inspect(temp);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Dashboard(
                                  code: snapshot.data!.data[index].code,
                                  username: snapshot
                                      .data!.data[index].owner.username)),
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
                                    snapshot.data!.data[index].name,
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
                                  Text(snapshot
                                      .data!.data[index].owner.username),
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
                                            text: '  ' +
                                                snapshot
                                                    .data!.data[index].createdAt
                                                    .toString(),
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
            );
          } else {
            return const Center(
                child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: CircularProgressIndicator(),
            ));
          }
        },
      ),
    ));
  }
  /*
  Column(
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
                  onTap: () async {
                    //ProjectModel temp = await getProjectInfo();
                    //inspect(temp);
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );*/
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
   */

  /*void getProject() async {
    ProjectModel pr = await ProjectApiController.getProjectInfo();
    projectInfo = pr;
  }*/
}
