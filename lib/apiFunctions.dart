import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:serviceapp/global.dart';
import 'package:serviceapp/signup/UIfunctions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Homepage/screen.dart';

saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
}

authenticateServiceProvider(
    BuildContext context, String username, String password) async {
  await http.post(Uri.parse(authenticateProviderEndpoint), body: {
    "username": username,
    "password": password,
  }).then((response) {
    var responseJson = json.decode(response.body);
    var non_field_errors = responseJson['non_field_errors'];
    if (non_field_errors != null) {
      showAlertDialog(context, "Error", non_field_errors[0]);
    } else {
      var token = responseJson['token'];
      saveToken(token);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(title: "Your Services"),
        ),
      );
    }
  });
}
