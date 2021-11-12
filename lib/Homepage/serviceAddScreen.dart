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
        appBar: AppBar(
          title: Text(
            'Add Service',
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
          child: Column(
            children: [
              TextField(
                controller: _serviceNameController,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
                decoration: InputDecoration(
                  hintText: 'Service Name',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _serviceDescriptionController,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Service Description',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _serviceLocationsController,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
                decoration: InputDecoration(
                  hintText: 'Locations',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _serviceRatingController,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
                decoration: InputDecoration(
                  hintText: 'Rating',
                ),
              ),
              SizedBox(height: 30),
              TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    addService(
                        context,
                        _serviceNameController.text,
                        _serviceDescriptionController.text,
                        _serviceLocationsController.text,
                        _serviceRatingController.text);
                  },
                  child: Text(
                    'Add Service',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
