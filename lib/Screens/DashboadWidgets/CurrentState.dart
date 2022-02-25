import 'package:flutter/material.dart';

class CurrentState extends StatefulWidget {
  CurrentState({Key? key}) : super(key: key);

  @override
  _CurrentStateState createState() => _CurrentStateState();
}

class _CurrentStateState extends State<CurrentState> {
  List<String> taskName = [
    "Emergency calls ",
    "Health Ai System ",
    "Big Data Analysis",
    "International Airliens System",
    "International Airliens System"
  ];
  List<String> taskCreationDate = [
    "2/3/2021",
    "16/7/2022",
    "28/9/2021",
    "1/1/2020",
    "1/1/2020"
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
                  color: Color.fromRGBO(52, 130, 197, 1),
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
                          Icon(
                            Icons.account_tree_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'In Progress Tasks',
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
                              showDialog(
                                context: context,
                                builder: (context) => SimpleDialog(
                                  title: Text(taskName[index]),
                                  contentPadding: EdgeInsets.all(20),
                                  children: [Text('abdelrhaman mohammed')],
                                ),
                              );
                            },
                            child: Container(
                              //-------------------------------- List View Container------
                              margin: const EdgeInsets.all(20),
                              height: 100,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(52, 130, 197, .8),
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


/* Container(
                    margin: EdgeInsets.all(20),
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(52, 130, 197, .8),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.4),
                            blurRadius: 20,
                            spreadRadius: 1,
                          ),
                        ]),
                  ) */