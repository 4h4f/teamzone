import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:teamzone/Screens/DiscoverProjects.dart';
import 'package:http/http.dart' as http;
import 'package:teamzone/Models/UserModels.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:teamzone/Models/Message.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

Future<http.Response> managerLogin(String username, String password) async {
  final response = await http.post(
    Uri.parse('http://137.184.88.117/api/users/admin/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    },
    body: jsonEncode(<String, String>{
      'username': username, //Chadrick Friesen
      'password': password,
    }),
  );
  return response;
}

Future<user> userdate(http.Response rs) async {
  return userFromJson(rs.body);
}

Future<Message> messagedata(http.Response rs) async {
  return messageFromJson(rs.body);
}
//print(response.statusCode);
/* if (response.statusCode == 200) {
    //print(response.body);
    return userFromJson(response.body)
        as Data; //data.fromJson(jsonDecode(response.body));
  } else {
    // print(response.body);
    return response; //messageFromJson(response.body) as Message;
  }*/

/*class userData {
  String username;
  String email;
  int id;
  userData({required this.username, required this.email, required this.id});
  factory userData.fromJson(Map<String, dynamic> json) {
    return userData(
        username: json['username'], email: json['email'], id: json['id']);
  }
}

class data {
  userData ud;
  data({required this.ud});
  factory data.fromJson(Map<String, dynamic> parsedJson) {
    return data(ud: userData.fromJson(parsedJson['data']));
  }
}*/
/*class data {
  // var users;
  final String username;
  final String emial;
  final int id;
  data({required this.emial, required this.username, required this.id});

  factory data.fromJson(Map<String, dynamic> json) {
    return data(
      //users: json['data'],
      username: json['username'],
      emial: json['email'],
      id: json['id'],
    );
  }
}

class user {
  final int? id;
  final String? username;
  final String? email;
  final data userData;

  const user({this.id, this.username, this.email, required this.userData});

  factory user.fromJson(Map<String, dynamic> json) {
    return user(
        //id: json['id'], username: json['username'], email: json['email']);
        userData: data.fromJson(
      json['data'],
    ));
  }
}*/
final usernameController = TextEditingController();
final passwordController = TextEditingController();

class _LoginState extends State<Login> {
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
                    'Login as a Manager',
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
                            controller: passwordController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        //-----------
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
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
                        /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DiscoverProjects()),
                        );*/
                        /* setState(() {
                          user us = temp.managerLogin().then((user) {
                            _user = user;
                            
                          });
                        });*/

                        /*var temp = managerLogin();
                          inspect(temp);
                          print(temp);*/

                        /* Object dt =
                            await managerLogin('Chadrick Friese', 'password');

                        // inspect(temp.);
                        inspect((dt as Message).message);*/
                        http.Response respons = await managerLogin(
                            usernameController.text, passwordController.text);
                        print(respons.statusCode);
                        if (respons.statusCode == 200) {
                          user us = (await userdate(respons));
                          print(us.data.name);
                        } else if (respons.statusCode == 404) {
                          Message message = await messagedata(respons);
                          print(message.message);
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
