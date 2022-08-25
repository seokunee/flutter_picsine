import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hello_layout',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("ex01"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          _table(),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
            ),
          ),
        ],
      )),
    );
  }

  Column _fiveStar() {
    return (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: Colors.grey, size: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(Icons.star, color: Colors.grey, size: 30),
            Icon(Icons.star, color: Colors.grey, size: 60),
            Icon(Icons.star, color: Colors.grey, size: 30),
          ],
        ),
        const Icon(Icons.star, color: Colors.grey, size: 30),
      ],
    ));
  }

  Table _table() {
    return (Table(
      border: const TableBorder(
          horizontalInside: BorderSide(
              width: 3, color: Colors.black, style: BorderStyle.solid),
          verticalInside: BorderSide(
              width: 3, color: Colors.black, style: BorderStyle.solid)),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Container(
              height: 128,
              child: _fiveStar(),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Container(
                height: 80,
                width: 32,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        TableRow(
          decoration: const BoxDecoration(),
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.bottom,
              child: Container(
                height: 80,
                width: 180,
                color: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 70),
              child: Container(width: 50, height: 50, color: Colors.yellow),
            )
          ],
        ),
      ],
    ));
  }
}
