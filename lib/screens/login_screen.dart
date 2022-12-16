// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_one/models/users_model.dart';
import 'package:task_one/screens/home_screen.dart';
import 'package:task_one/utils/my_text_field.dart';
import 'package:task_one/utils/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  var userEmail = [];
  var userName = [];
  login(email, password) async {
    for (var i = 0; i < userList.length; i++) {
      userList[i];
      userEmail.add(userList[i].email);
      userName.add(userList[i].username);
    }
    for (var i = 0; i < userEmail.length; i++) {
      if (userEmail[i].toString() == email ||
          userName[i].toString() == password) {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        print("........................failed");
        print(userEmail[i]);
        Navigator.pushReplacementNamed(context, "/HomeScreen");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getUserApi();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    height: size.height / 3.8,
                    "assets/logo.jpg",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  MyTextField(
                      hintText: "Email",
                      color: Colors.black,
                      controller: emailController),
                  const SizedBox(
                    height: 16,
                  ),
                  MyTextField(
                      hintText: "Password",
                      color: Colors.black,
                      controller: passwordController),
                  const SizedBox(
                    height: 16,
                  ),
                  RoundedButton(
                      ontap: () {
                        if (_formKey.currentState!.validate()) {
                          login(emailController.text.trim.toString(),
                              passwordController.text.trim.toString());
                        }
                      },
                      title: "LOGIN",
                      color: const Color(0xffE43228))
                ]),
          ),
        ),
      ),
    );
  }
}
