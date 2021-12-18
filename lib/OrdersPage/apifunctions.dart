import 'package:serviceapp/Homepage/apiFunctions.dart';
import 'package:serviceapp/global.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

getOrders(var service) async {
  var serviceId = service['_id'].toString();
  var url = endpointDomain + 'service/' + serviceId.toString() + '/orders';
  var token;

  return await getToken().then((value) async {
    token = value;
    return await http.get(Uri.parse(url), headers: {
      'Authorization': 'Token ' + token,
    }).then((value) async {
      var responseJson = json.decode(value.body);
      for (int i = 0; i < responseJson.length; i++) {
        responseJson[i]['service'] = service;
      }
      return responseJson;
    });
  });
}

acceptOrder(serviceid, clientid) async {
  var url = endpointDomain + 'service/$serviceid/$clientid/accept';
  var token;

  return await getToken().then((value) async {
    token = value;
    return await http.put(Uri.parse(url), headers: {
      'Authorization': 'Token ' + token,
    }).then((value) {
      var responseJson = json.decode(value.body);
      return responseJson;
    });
  });
}

declineOrder(serviceid, clientid) async {
  var url = endpointDomain + 'service/$serviceid/$clientid/reject';
  var token;

  return await getToken().then((value) async {
    token = value;
    return await http.put(Uri.parse(url), headers: {
      'Authorization': 'Token ' + token,
    }).then((value) {
      var responseJson = json.decode(value.body);
      return responseJson;
    });
  });
}

getService(serviceId) async {
  serviceId = serviceId.toString();
  var url = endpointDomain + "service/list/$serviceId";
  var token;
  return await getToken().then((value) async {
    token = value;
    return await http.get(Uri.parse(url), headers: {
      'Authorization': 'Token ' + token,
    }).then((value) {
      var responseJson = json.decode(value.body);
      return responseJson;
    });
  });
}
