import 'package:flutter/material.dart';
import 'package:teamzone/assets/theams/theam.dart';
import 'package:teamzone/component/circle_progress.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CurrentState extends StatefulWidget {
  CurrentState({Key? key}) : super(key: key);

  @override
  _CurrentStateState createState() => _CurrentStateState();
}

class _CurrentStateState extends State<CurrentState> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(52, 130, 197, 1),
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
                          percent: 0.6,
                          progressColor: const Color.fromRGBO(79, 168, 244, .8),
                          circularStrokeCap: CircularStrokeCap.round,
                          animation: true,
                          center: const Text(
                            '70%',
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
                              color: const Color.fromRGBO(52, 130, 197, 1),
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
                                  progressColor: Colors.amber[200],
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
                              color: const Color.fromRGBO(52, 130, 197, 1),
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
                    Row(
                      children: <Widget>[
                        Container(
                          height: 170,
                          width: 150,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(52, 130, 197, 1),
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
                                  percent: 0.4,
                                  progressColor:
                                      const Color.fromRGBO(225, 53, 53, .8),
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
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 170,
                          width: 150,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(52, 130, 197, 1),
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
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
