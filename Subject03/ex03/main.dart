import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    title: 'limitless',
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    home: const MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class DataType {}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> data = {
    "userId": -1,
    "id": -1,
    "title": '',
    "completed": false,
  };

  Future<int> fetchData() async {
    final client = http.Client();
    try {
      final uri = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");
      final response = await client.get(uri);
      print("a");

      final responseBody = utf8.decode(response.bodyBytes);
      print("a");

      List<Map> list = json.decode(responseBody);
      print("c");

      setState(() {
        data["userId"] = list[0]["userId"];
        data["id"] = list[0]["id"];
        data["title"] = list[0]["title"];
        data["completed"] = list[0]["completed"];
      });
      print("b");
    } catch (e) {
      print("통신 에러가 발생하였습니다");
    } finally {
      client.close();
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Json2Dart',
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            if (data["id"] != -1)
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: Column(
                      children: [
                        Text('title: ${data["title"]}'),
                        Text('userId: ${data["userId"]}'),
                        Text('id: ${data["id"]}'),
                        Text('completed: ${data["completed"]}'),
                      ],
                    ),
                  ),
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(20),
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: ElevatedButton(
                    onPressed: () {
                      fetchData();
                    },
                    child: const Text('Fetch Data'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
