import "package:async/async.dart";
import 'package:flutter/material.dart';
import "dart:async";
import "package:http/http.dart";
import "package:http/http.dart" as http;

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String? result = "";

  Future<Response> getData() async {
    final String authority = "www.googleapis.com";
    final String path = "/books/v1/volumes/junbDwAAQBAJ";
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }

  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  void returnFG() {
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();
    futureGroup.future.then((List<int> value) {
      int total = 0;
      for (var element in value) {
        total += element;
      }
      setState(() {
        result = total.toString();
      });
    });
  }

  Future count() async {
    int one = await returnOneAsync();
    int two = await returnTwoAsync();
    int three = await returnThreeAsync();
    String totsl = (one + two + three).toString();
    setState(() {
      result = totsl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future'),
      ),
      body: Center(
        child: Column(children: [
          Spacer(),
          ElevatedButton(
            onPressed: () async {
              returnFG();
            },
            child: Text("Go"),
          ),
          Spacer(),
          Text(result.toString()),
          Spacer(),
          CircularProgressIndicator(),
          Spacer(),
        ]),
      ),
    );
  }
}
