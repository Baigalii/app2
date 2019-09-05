import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'list_item.dart';

void main() => runApp(MyApp());

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
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _bottomItems = [
    {"icon": FontAwesomeIcons.fire, "index": 0},
    {"icon": FontAwesomeIcons.bitcoin, "index": 1},
    {"icon": FontAwesomeIcons.apple, "index": 2},
    {"icon": FontAwesomeIcons.hackerNews, "index": 3},
  ];

  String _apiKey = 'dfacb869730c4fca9f8838174b41e837';

  int _currentTab = 0;
  String _apiUrl = '';
  int _total = 0;
  List _articles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    changeTab(index: 0);
  }

  void changeTab({int index = 0}) {
    //tab1 is about top-headlines
    //tab2 is about bitcoins
    //tab3 = apple
    //tab4 = techcrunch

    switch (index) {
      case 0:
        _apiUrl =
            'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=' +
                _apiKey;
        break;
      case 1:
        _apiUrl =
            'https://newsapi.org/v2/everything?q=bitcoin&sortBy=publishedAt&apiKey=' +
                _apiKey;
        break;
      case 2:
        _apiUrl =
            'https://newsapi.org/v2/everything?q=apple&sortBy=popularity&apiKey=' +
                _apiKey;
        break;
      case 3:
        _apiUrl =
            'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=' +
                _apiKey;
        break;
    }

    print(_apiUrl);

    setState(() {
      _loading = true;
      _total = 0;
      _articles = [];
    });

    http.get(_apiUrl).then((response) {
      var data = json.decode(response.body);
      setState(() {
        _total = data['totalResults'];
        _articles = data['articles'];
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigation(context),
      body: new SafeArea(child: _buildBody(context)),
    );
  }

  _buildBottomNavigation(BuildContext context) {
    var _items = <BottomNavigationBarItem>[];

    for (var item in _bottomItems) {
      _items.add(new BottomNavigationBarItem(
        icon: new Icon(
          item['icon'],
          color: Colors.black,
        ),
        title: new Text(''),
      ));
    }

    return new BottomAppBar(
      color: Colors.white,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _bottomItems.map((x) {
          return new IconButton(
            icon: new Icon(
              x['icon'],
              color: _currentTab == x['index'] ? Colors.black : Colors.black38,
            ),
            onPressed: () {
              setState(() {
                _currentTab = x['index'];
              });
              changeTab(index: x['index']);
            },
          );
        }).toList(),
      ),
    );
  }

  _buildBody(BuildContext context) {
    if (_loading) {
      return new SpinKitCircle(
        color: Colors.black,
        size: 50.0,
      );
    }

    print(_articles);

    return new ListView.builder(
      itemBuilder: (context, index) {
        return new Padding(
          padding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: new ListItem(data: _articles[index]),
        );
      },
      itemCount: _total,
    );
  }
}
