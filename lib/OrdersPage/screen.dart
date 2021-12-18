import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serviceapp/Homepage/apiFunctions.dart';
import 'acceptdeclinebutton.dart';
import 'apifunctions.dart';

class OrdersPage extends StatefulWidget {
  OrdersPage();
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  var orders = [];
  var isOrdersLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // get all services
    getServices().then((value) async {
      var thisOrders = [];
      // get each service in forloop
      for (var i = 0; i < value.length; i++) {
        var service = value[i];

        var serviceId = service['_id'];

        await getOrders(service).then((value) {
          for (var eachOrder in value) {
            // print(eachOrder);
            thisOrders.add(eachOrder);
          }
        });
      }

      return thisOrders;
    }).then((thisOrders) {
      setState(() {
        this.orders = thisOrders;
        isOrdersLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Order Requests",
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Center(
        // listview
        child: isOrdersLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  var order = orders[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        order['service']['name'].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'client : ' +
                                order['userDetails']['username'].toString(),
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Text(
                            order['userDetails']['email'].toString(),
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      trailing: order['status'] == null
                          ? AcceptDeclineButton(
                              serviceid: order['service']['_id'].toString(),
                              clientid: order['user'].toString(),
                            )
                          : Text(
                              '${order['status']}',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  color: order['status'] == 'accepted'
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => OrderDetailsPage(
                        //       order: order,
                        //     ),
                        //   ),
                        // );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
