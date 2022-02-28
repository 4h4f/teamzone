import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class FiledTask extends StatefulWidget {
  FiledTask({Key? key}) : super(key: key);

  @override
  _FiledTaskState createState() => _FiledTaskState();
}

class _FiledTaskState extends State<FiledTask> {
  List<String> taskName = [
    "Report Component",
  ];
  List<String> taskCreationDate = [
    "2/3/2021",
  ];
  List<String> master = [
    "Mohammed Ali",
  ];
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
                          vertical: 10, horizontal: 50),
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.error_outline_sharp,
                            color: Colors.redAccent,
                            size: 40,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Field Tasks',
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
                    ListView.builder(
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
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
                                          padding:
                                              const EdgeInsets.only(left: 10),
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
                                          padding:
                                              const EdgeInsets.only(left: 10),
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
                                ],
                              ),
                            ),
                          );
                        })
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
