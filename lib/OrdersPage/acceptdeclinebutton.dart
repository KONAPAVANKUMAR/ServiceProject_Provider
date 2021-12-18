import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:serviceapp/Homepage/apiFunctions.dart';
import 'package:serviceapp/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'apifunctions.dart';

class AcceptDeclineButton extends StatefulWidget {
  AcceptDeclineButton({required this.serviceid, required this.clientid});
  final serviceid, clientid;
  @override
  _AcceptDeclineButton createState() => _AcceptDeclineButton();
}

class _AcceptDeclineButton extends State<AcceptDeclineButton> {
  var serviceid;
  var clientid;

  var isAccepted = false;
  var isDeclined = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      serviceid = widget.serviceid;
      clientid = widget.clientid;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isAccepted == true) {
      return Text(
        'accepted',
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            fontSize: 15,
            color: Colors.green,
          ),
        ),
      );
    } else if (isDeclined == true) {
      return Text(
        'rejected',
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            fontSize: 15,
            color: Colors.red,
          ),
        ),
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            child: Text(
              "Accept",
              style: GoogleFonts.montserrat(color: Colors.white),
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              acceptOrder(this.serviceid, this.clientid).then((value) {
                setState(() {
                  isAccepted = true;
                });
              });
            },
          ),
          SizedBox(
            width: 10,
          ),
          TextButton(
            child: Text(
              "Decline",
              style: GoogleFonts.montserrat(color: Colors.white),
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () {
              declineOrder(this.serviceid, this.clientid).then((value) {
                setState(() {
                  isDeclined = true;
                });
              });
            },
          ),
        ],
      );
    }
  }
}
