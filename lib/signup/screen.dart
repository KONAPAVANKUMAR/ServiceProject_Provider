import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:serviceapp/global.dart';

import 'UIfunctions.dart';
import 'apiFunctions.dart';

class SignupPage extends StatefulWidget {
  SignupPage({required this.title});
  final String title;
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // controller
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                ),
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              TextButton(
                child: Text('Sign Up',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                onPressed: () {
                  if (_usernameController.text.isEmpty ||
                      _passwordController.text.isEmpty ||
                      _emailController.text.isEmpty) {
                    showAlertDialog(
                        context, 'Error', 'Please fill all the fields');
                  } else {
                    createServiceProvider(
                      context,
                      _usernameController.text,
                      _passwordController.text,
                      _emailController.text,
                    );
                  }
                },
              )
            ],
          ),
        ));
  }
}
