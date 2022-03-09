import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:teamzone/Models/ClientModel.dart';
//import 'package:teamzone/Models/ProjectModel.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

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
  // inspect(response);
  print(response.statusCode);
  return clientProjcetFromJson(response.body);
}

class ClientDoneState extends StatefulWidget {
  final String? username;
  final String? code;
  ClientDoneState({Key? key, @required this.username, @required this.code})
      : super(key: key);

  @override
  _DoneStateState createState() => _DoneStateState();
}

class _DoneStateState extends State<ClientDoneState> {
  List<String> taskName = [
    "Authentication",
    "Chat Testing",
  ];
  List<String> taskCreationDate = [
    "2/3/2021",
    "16/7/2022",
  ];
  List<String> master = [
    "Mostafa Ahmed",
    "Mohammed Ibrahem",
  ];
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      taskComplet = await taskcomp();

      setState(() {});
    });
    /*Future.delayed(Duration.zero, () async {
      //your async 'await' codes goes here
      taskComplet = await taskcomp();
    });*/
    /*() async {
      taskComplet = await taskcomp();
    };*/

    super.initState();
  }

  List<Task> taskComplet = [];
  Future<List<Task>> taskcomp() async {
    List<Task> temp = [];
    ClientProjcet pj = await getProjectInfo(
        widget.username.toString(), widget.code.toString());
    for (int i = 0; i < pj.data.tasks.length; i++) {
      //temp.add(pj.data.tasks[i]);
      print(pj.data.tasks[i].status);
      if (pj.data.tasks[i].status == "Completed") {
        print(pj.data.tasks[i].status == "Completed");
        temp.add(pj.data.tasks[i]);
      }
    }
    // inspect(temp);
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xff30384c), //Color.fromRGBO(52, 130, 197, 1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 40),
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.done,
                            color: Colors.lightGreen,
                            size: 40,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Done Tasks',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    //-----------------------------------
                  ],
                ),
              ),
              SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    FutureBuilder(
                        future: getProjectInfo(
                            widget.username.toString(), widget.code.toString()),
                        builder: (BuildContext context,
                            AsyncSnapshot<ClientProjcet> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: taskComplet
                                    .length, //snapshot.data!.data.tasks.length,
                                itemBuilder: (BuildContext ctx, int index) {
                                  /*  if (snapshot.data!.data.tasks[index].status ==
                                      'Completed') {
                                    taskComplet
                                        .add(snapshot.data!.data.tasks[index]);
                                  }*/
                                  return InkWell(
                                    onTap: () {
                                      Dialogs.bottomMaterialDialog(
                                          context: context,
                                          msg: taskComplet[index].description,
                                          title: taskComplet[index].name,
                                          actions: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 50,
                                              ),
                                              child: IconsButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                text: 'Ok',
                                                iconData: Icons.done,
                                                color: Color.fromRGBO(
                                                    52, 130, 197, .6),
                                                textStyle: TextStyle(
                                                    color: Colors.white),
                                                iconColor: Colors.white,
                                              ),
                                            )
                                          ]);
                                    },
                                    child: Container(
                                      //-------------------------------- List View Container------
                                      margin: const EdgeInsets.all(20),
                                      height: 130,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: Color(
                                              0xff30384c), //const Color.fromRGBO(52, 130, 197, .8),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(.4),
                                              blurRadius: 20,
                                              spreadRadius: 1,
                                            ),
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                const Icon(
                                                  Icons.alt_route_sharp,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  /* snapshot
                                                      .data!.data.tasks[0].name,*/
                                                  // taskName[index],
                                                  taskComplet[index].name,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Row(
                                                children: <Widget>[
                                                  const Icon(
                                                    Icons.person_outline,
                                                    size: 20,
                                                    color: Colors.white,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    taskComplet[index]
                                                        .master
                                                        .name,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Row(
                                                children: <Widget>[
                                                  const Icon(
                                                    Icons.date_range_outlined,
                                                    size: 20,
                                                    color: Colors.white,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    'Created at  ' +
                                                        taskComplet[index]
                                                            .createdAt
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            return const Center(
                                child: Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: CircularProgressIndicator(),
                            ));
                          }
                        }
                        /*child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: taskName.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return InkWell(
                              onTap: () {
                                Dialogs.bottomMaterialDialog(
                                    context: context,
                                    msg:
                                        'This task is to give the client the ability to see his project`s progress',
                                    title: taskName[index],
                                    actions: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 50,
                                        ),
                                        child: IconsButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          text: 'Ok',
                                          iconData: Icons.done,
                                          color: Color.fromRGBO(52, 130, 197, .6),
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          iconColor: Colors.white,
                                        ),
                                      )
                                    ]);
                              },
                              child: Container(
                                //-------------------------------- List View Container------
                                margin: const EdgeInsets.all(20),
                                height: 130,
                                width: 300,
                                decoration: BoxDecoration(
                                    color: Color(
                                        0xff30384c), //const Color.fromRGBO(52, 130, 197, .8),
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.4),
                                        blurRadius: 20,
                                        spreadRadius: 1,
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          const Icon(
                                            Icons.alt_route_sharp,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            taskName[index],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: <Widget>[
                                            const Icon(
                                              Icons.person_outline,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              master[index],
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: <Widget>[
                                            const Icon(
                                              Icons.date_range_outlined,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Created at  ' +
                                                  taskCreationDate[index],
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),*/
                        )
                  ],
                ),
              ),

              //-------------------
            ],
          ),
        ),
      ),
    );
  }
}



//DoneState