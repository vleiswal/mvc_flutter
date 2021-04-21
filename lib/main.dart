import 'package:flutter/material.dart';
import 'package:mvc_flutter/models/factsResponse.dart';
import 'package:mvc_flutter/services/factsService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  FactsService factsService = FactsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: FutureBuilder(
        future: factsService.getFacts(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            FactsResponse factsResponse = snapshot.data;
            return ListView.builder(
                itemCount: factsResponse.facts.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(factsResponse.facts[index].title),
                  );
                });
            return Text(factsResponse.category);
          } else {
            return CircularProgressIndicator();
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
