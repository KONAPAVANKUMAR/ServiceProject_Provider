import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:serviceapp/Homepage/apiFunctions.dart';
import 'package:serviceapp/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class AddServicePage extends StatefulWidget {
  @override
  _AddServicePageState createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  // controller
  TextEditingController _serviceNameController = TextEditingController();
  TextEditingController _serviceDescriptionController = TextEditingController();
  TextEditingController _serviceLocationsController = TextEditingController();
  TextEditingController _serviceRatingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Add Service')),
        body: Column(
          children: [
            TextField(
              controller: _serviceNameController,
              decoration: InputDecoration(
                hintText: 'Service Name',
              ),
            ),
            TextField(
              controller: _serviceDescriptionController,
              decoration: InputDecoration(
                hintText: 'Service Description',
              ),
            ),
            TextField(
              controller: _serviceLocationsController,
              decoration: InputDecoration(
                hintText: 'Locations',
              ),
            ),
            TextField(
              controller: _serviceRatingController,
              decoration: InputDecoration(
                hintText: 'Rating',
              ),
            ),
            TextButton(
                onPressed: () {
                  addService(
                      context,
                      _serviceNameController.text,
                      _serviceDescriptionController.text,
                      _serviceLocationsController.text,
                      _serviceRatingController.text);
                },
                child: Text('Add Service'))
          ],
        ));
  }
}
