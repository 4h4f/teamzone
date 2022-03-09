import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:teamzone/Models/ClientModel.dart';
import 'package:teamzone/Models/Message.dart';
import 'package:teamzone/Models/UserModels.dart';
import 'package:teamzone/Screens/ClientDashboard.dart';
import 'package:teamzone/Screens/Dashboard.dart';
import 'package:http/http.dart' as http;

class Clientlogin extends StatefulWidget {
  const Clientlogin({Key? key}) : super(key: key);

  @override
  _ClientloginState createState() => _ClientloginState();
}

Future<http.Response> clientLogin(String username, String code) async {
  final response = await http.post(
    Uri.parse('http://137.184.88.117/api/users/client/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    },
    body: jsonEncode(<String, String>{
      'username': username, //Chadrick Friesen
      'code': code,
    }),
  );
  return response;
}

Future<ClientProjcet> userdata(http.Response rs) async {
  return clientProjcetFromJson(rs.body);
}

Future<Message> messagedata(http.Response rs) async {
  return messageFromJson(rs.body);
}

final usernameController = TextEditingController();
final codeController = TextEditingController();

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
                      boxShadow: const [
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
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey[200]!))),
                          child: TextField(
                            controller: usernameController,
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
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: codeController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.code),
                              border: InputBorder.none,
                              hintText: 'Project Code',
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
                    margin: const EdgeInsets.symmetric(horizontal: 40),
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
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      onPressed: () async {
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );*/
                        http.Response response = await clientLogin(
                            usernameController.text, codeController.text);
                        ClientProjcet us = await userdata(response);
                        if (response.statusCode == 200) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClientDashboard(
                                    username: usernameController.text,
                                    email: us.data.owner.email,
                                    code: us.data.code)),
                          );
                        } else if (response.statusCode == 404) {
                          //Message message = await messagedata(response);
                          // ignore: avoid_single_cascade_in_expression_statements
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.TOPSLIDE,
                            dialogType: DialogType.ERROR,
                            body: const Center(
                              child: Text(
                                'User infromation not found',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            title: 'Login Error',
                            desc: 'This is also Ignored',
                            btnOkOnPress: () {},
                          )..show();
                        } else {
                          print(response.body);
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Dialogs.materialDialog(
                            context: context,
                            msg: 'Enter your account email',
                            title: 'Acount Recovery',
                            actions: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: <Widget>[
                                    const TextField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.people),
                                        border: InputBorder.none,
                                        hintText: 'Email',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: IconsButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        text: 'OK',
                                        iconData: Icons.done,
                                        iconColor: Colors.white,
                                        textStyle: const TextStyle(
                                            color: Colors.white),
                                        color: const Color(0xff30384c),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ]);
                      },
                      child: const Text('Reset your password'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
