import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:serviceapp/Homepage/apiFunctions.dart';
import 'package:serviceapp/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'serviceAddScreen.dart';
import 'serviceDetail.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.title});
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var token;
  var services;
  var isServicesLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken().then((token) {
      this.token = token;
    });
    getServices().then((services) {
      setState(() {
        this.services = services;
        isServicesLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(''),
                Text(
                  widget.title,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      logout(context);
                    },
                    icon: Icon(
                      Icons.logout,
                    ))
              ],
            )),
        body: WillPopScope(
            onWillPop: () async => false,
            child: Center(
              child: isServicesLoading
                  ? Column()
                  : Column(
                      children: List.generate(services.length, (index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            services[index]['name'],
                            style: GoogleFonts.montserrat(
                              color: Colors.blue,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            services[index]['feasiblelocations'],
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ServiceDetailPage(
                                        service: services[index])));
                          },
                        ),
                      );
                    })),
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddServicePage()));
          },
          child: Icon(Icons.add),
        ));
  }
}
