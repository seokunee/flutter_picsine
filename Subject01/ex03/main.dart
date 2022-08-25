import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my_widget',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 65, 185, 69),
          title: const Text("ex02"),
        ),
        body: const Center(
          child: RandomWord(),
        ),
      ),
    );
  }
}

class RandomWord extends StatefulWidget {
  const RandomWord({Key? key}) : super(key: key);

  @override
  State<RandomWord> createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        final alreadySaved = _saved.contains(_suggestions[index]);

        return Dismissible(
          key: UniqueKey(),
          background: Container(
              alignment: Alignment.center,
              color: Colors.green,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("remove",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ))),
          secondaryBackground: Container(
              alignment: Alignment.center,
              color: Colors.green,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: const Text("remove",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ))),
          onDismissed: (DismissDirection direction) {
            setState(() {
              _saved.remove(_suggestions[index]);
              _suggestions.remove(_suggestions[index]);
            });
          },
          child: Card(
            child: ListTile(
              title: Text(
                _suggestions[index].asPascalCase,
                style: _biggerFont,
              ),
              subtitle: _suggestions[index].asPascalCase.length % 2 == 0
                  ? const Text('done')
                  : const Text('do not yet'),
              trailing: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null,
                semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
              ),
              onTap: () {
                setState(() {
                  if (alreadySaved) {
                    _saved.remove(_suggestions[index]);
                  } else {
                    _saved.add(_suggestions[index]);
                  }
                });
              },
            ),
          ),
        );
      },
    );
  }
}
