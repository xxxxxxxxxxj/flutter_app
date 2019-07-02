import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HttpDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HttpDemoPageState();
  }
}

class _HttpDemoPageState extends State<HttpDemoPage> {
  String jsonStr = "";

  _httpDemo() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url =
        "https://demo.cwjia.cn/pet-api/worker/queryWorkerById?system=android_5.2.0&phoneModel=HONOR+KIW-CL00&workerId=1186&phoneSystemVersion=Android+6.0.1&petTimeStamp=1562059954001&imei=A00000598A8C45&cellPhone=15717155675&account=1";

    // Await the http get response, then decode the json-formatted responce.
    var response = await http.post(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var itemCount = jsonResponse['totalItems'];
      print("Number of books about http: $itemCount.");
      print("请求的json数据为：$jsonResponse");
      setState(() {
        jsonStr = jsonResponse.toString();
      });
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HTTP DEMO"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: _httpDemo,
                child: Text("执行请求"),
              ),
              Text(
                jsonStr,
                style: TextStyle(color: Colors.red, fontSize: 15),
              )
            ],
          ),
        ));
  }
}
