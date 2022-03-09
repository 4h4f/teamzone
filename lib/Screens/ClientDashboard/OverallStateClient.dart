import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:teamzone/Models/ClientModel.dart';
import 'package:teamzone/assets/theams/theam.dart';
import 'package:teamzone/component/circle_progress.dart';
import 'package:percent_indicator/percent_indicator.dart';
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

class ClientOverallState extends StatefulWidget {
  final String? username;
  final String? code;
  ClientOverallState({Key? key, @required this.username, @required this.code})
      : super(key: key);

  @override
  _OverallStateState createState() => _OverallStateState();
}

class _OverallStateState extends State<ClientOverallState> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      allTask = await allTasks();
      taskComplet = await taskcomp();
      field = await failtasks();
      active = await inproTask();
      setState(() {});
    });
    /* Future.delayed(Duration.zero, () async {
      //your async 'await' codes goes here
      allTask = await allTasks();
      taskComplet = await taskcomp();
      field = await failtasks();
    });*/
    /*() async {
      taskComplet = await taskcomp();
    };*/

    super.initState();
  }

  List<Task> taskComplet = [];
  List<Task> allTask = [];
  List<Task> field = [];
  List<Task> active = [];
  Future<List<Task>> taskcomp() async {
    List<Task> temp = [];
    ClientProjcet pj = await getProjectInfo(
        widget.username.toString(), widget.code.toString());
    for (int i = 0; i < pj.data.tasks.length; i++) {
      //temp.add(pj.data.tasks[i]);
      // print(pj.data.tasks[i].status);
      if (pj.data.tasks[i].status == "Completed") {
        //print(pj.data.tasks[i].status == "Completed");
        temp.add(pj.data.tasks[i]);
      }
    }
    // inspect(temp);
    return temp;
  }

  //************ */
  Future<List<Task>> allTasks() async {
    List<Task> temp = [];
    ClientProjcet pj = await getProjectInfo(
        widget.username.toString(), widget.code.toString());
    for (int i = 0; i < pj.data.tasks.length; i++) {
      //temp.add(pj.data.tasks[i]);
      temp.add(pj.data.tasks[i]);
    }
    // inspect(temp);
    return temp;
  }

  Future<List<Task>> failtasks() async {
    List<Task> temp = [];
    ClientProjcet pj = await getProjectInfo(
        widget.username.toString(), widget.code.toString());
    for (int i = 0; i < pj.data.tasks.length; i++) {
      //temp.add(pj.data.tasks[i]);
      // print(pj.data.tasks[i].status);
      if (pj.data.tasks[i].status == "failed") {
        //print(pj.data.tasks[i].status == "Completed");
        temp.add(pj.data.tasks[i]);
      }
    }
    // inspect(temp);
    return temp;
  }

  Future<List<Task>> inproTask() async {
    List<Task> temp = [];
    ClientProjcet pj = await getProjectInfo(
        widget.username.toString(), widget.code.toString());
    for (int i = 0; i < pj.data.tasks.length; i++) {
      //temp.add(pj.data.tasks[i]);
      // print(pj.data.tasks[i].status);
      if (pj.data.tasks[i].status == "Active") {
        //print(pj.data.tasks[i].status == "Completed");
        temp.add(pj.data.tasks[i]);
      }
    }
    // inspect(temp);
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    print(allTask.length);
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: getProjectInfo(
                  widget.username.toString(), widget.code.toString()),
              builder: (BuildContext context,
                  AsyncSnapshot<ClientProjcet> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 170,
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Color(
                              0xff30384c), //Color.fromRGBO(52, 130, 197, 1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Column(
                                  children: const [
                                    Text(
                                      'Project Status',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Overall Project Progress',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                CircularPercentIndicator(
                                  radius: 60,
                                  lineWidth: 12.0,
                                  backgroundColor: Colors.white,
                                  percent: taskComplet.length / allTask.length,
                                  progressColor:
                                      const Color.fromRGBO(79, 168, 244, .8),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  animation: true,
                                  center: Text(
                                    taskComplet.length.toString() +
                                        "/" +
                                        allTask.length.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 170,
                                  width: 150,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Color(
                                          0xff30384c), //const Color.fromRGBO(52, 130, 197, 1),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 0),
                                        ),
                                      ]),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.done,
                                              color: Colors.amber[200],
                                              size: 30,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              "DONE TASKS",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CircularPercentIndicator(
                                          radius: 50,
                                          lineWidth: 12.0,
                                          backgroundColor: Colors.white,
                                          percent:
                                              active.length / allTask.length,
                                          progressColor: Colors.amber,
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          animation: true,
                                          center: Text(
                                            taskComplet.length.toString() +
                                                "/" +
                                                allTask.length.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 170,
                                  width: 150,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Color(
                                          0xff30384c), //const Color.fromRGBO(52, 130, 197, 1),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3),
                                        ),
                                      ]),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: const <Widget>[
                                            Icon(
                                              Icons.workspaces,
                                              color: Color.fromRGBO(
                                                  34, 219, 63, 1),
                                              size: 30,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "IN PROGRESS TASKS",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CircularPercentIndicator(
                                          radius: 50,
                                          lineWidth: 12.0,
                                          backgroundColor: Colors.white,
                                          percent:
                                              active.length / allTask.length,
                                          progressColor: const Color.fromRGBO(
                                              34, 219, 63, 1),
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          animation: true,
                                          center: Text(
                                            active.length.toString() +
                                                "/" +
                                                allTask.length.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 170,
                              width: 150,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Color(
                                      0xff30384c), //const Color.fromRGBO(52, 130, 197, 1),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 0),
                                    ),
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  children: [
                                    Row(
                                      children: const <Widget>[
                                        Icon(
                                          Icons.error_outline,
                                          color:
                                              Color.fromRGBO(225, 53, 53, .8),
                                          size: 30,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "FAILED TASKS",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CircularPercentIndicator(
                                      radius: 50,
                                      lineWidth: 12.0,
                                      backgroundColor: Colors.white,
                                      percent: field.length / allTask.length,
                                      progressColor:
                                          const Color.fromRGBO(225, 53, 53, .8),
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      animation: true,
                                      center: Text(
                                        field.length.toString() +
                                            "/" +
                                            allTask.length.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: CircularProgressIndicator(),
                  ));
                }
              }),
        ),
      ),
    );
  }
/*Column(
            children: <Widget>[
             
              Container(
                height: 170,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xff30384c), //Color.fromRGBO(52, 130, 197, 1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          children: const [
                            Text(
                              'Project Status',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Overall Project Progress',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        CircularPercentIndicator(
                          radius: 60,
                          lineWidth: 12.0,
                          backgroundColor: Colors.white,
                          percent: taskComplet.length / allTask.length,
                          progressColor: const Color.fromRGBO(79, 168, 244, .8),
                          circularStrokeCap: CircularStrokeCap.round,
                          animation: true,
                          center: Text(
                            taskComplet.length.toString() +
                                "/" +
                                allTask.length.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 170,
                          width: 150,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color(
                                  0xff30384c), //const Color.fromRGBO(52, 130, 197, 1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 0),
                                ),
                              ]),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.done,
                                      color: Colors.amber[200],
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "ON HOLD TASKS",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CircularPercentIndicator(
                                  radius: 50,
                                  lineWidth: 12.0,
                                  backgroundColor: Colors.white,
                                  percent: 0.4,
                                  progressColor: Colors.amber,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  animation: true,
                                  center: const Text(
                                    '1/10',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 170,
                          width: 150,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color(
                                  0xff30384c), //const Color.fromRGBO(52, 130, 197, 1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ]),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              children: [
                                Row(
                                  children: const <Widget>[
                                    Icon(
                                      Icons.workspaces,
                                      color: Color.fromRGBO(34, 219, 63, 1),
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "IN PROGRESS TASKS",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CircularPercentIndicator(
                                  radius: 50,
                                  lineWidth: 12.0,
                                  backgroundColor: Colors.white,
                                  percent: 0.4,
                                  progressColor:
                                      const Color.fromRGBO(34, 219, 63, 1),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  animation: true,
                                  center: const Text(
                                    '8/10',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 170,
                      width: 150,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color(
                              0xff30384c), //const Color.fromRGBO(52, 130, 197, 1),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 0),
                            ),
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            Row(
                              children: const <Widget>[
                                Icon(
                                  Icons.error_outline,
                                  color: Color.fromRGBO(225, 53, 53, .8),
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "FAILED TASKS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CircularPercentIndicator(
                              radius: 50,
                              lineWidth: 12.0,
                              backgroundColor: Colors.white,
                              percent: field.length / allTask.length,
                              progressColor:
                                  const Color.fromRGBO(225, 53, 53, .8),
                              circularStrokeCap: CircularStrokeCap.round,
                              animation: true,
                              center: Text(
                                field.length.toString() +
                                    "/" +
                                    allTask.length.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ), */
  /* SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromRGBO(52, 130, 197, 1),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(20)),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const Text(
                  'Project Status',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
                CircularPercentIndicator(radius: 50)
              ],
            ),
          ],
        ),
      ),
    );
  }*/
}
