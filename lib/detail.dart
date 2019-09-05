import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'html.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.data}) : super(key: key);

  final Map data;

  @override
  _DetailPageState createState() => new _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ScrollController _scrollController = new ScrollController();
  String _progress = "0%";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _scrollController.addListener(onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });
          print("BottomEdge: ${notification.metrics.extentAfter == 0}");
        },
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Stack(
              alignment: Alignment.centerRight,
              children: <Widget>[
                ListView.builder(
                    itemCount: 50,
                    itemExtent: 50.0,
                    itemBuilder: (context, index) {
                      return Card(child: ListTile(title: Text("$index")));
                    }),
                CircleAvatar(
                  radius: 30.0,
                  child: Text(_progress),
                  backgroundColor: Colors.black54,
                ),
              ],
            )),
      ),
    );
  }

//  onScroll() {}
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: _buildBody(context),
//    );
//  }
//
//  _onStartScroll(ScrollMetrics metrics) {
//    print("Scroll Start");
//  }
//
//  _onUpdateScroll(ScrollMetrics metrics) {
//    print("Scroll Update");
//  }
//
//  _onEndScroll(ScrollMetrics metrics) {
//    print("Scroll End");
//  }
//
//  _buildBody(BuildContext context) {
//    return SingleChildScrollView(
//      child: NotificationListener<ScrollNotification>(
//        onNotification: (scrollNotification) {
//          if (scrollNotification is ScrollStartNotification) {
//            _onStartScroll(scrollNotification.metrics);
//          } else if (scrollNotification is ScrollUpdateNotification) {
//            _onUpdateScroll(scrollNotification.metrics);
//          } else if (scrollNotification is ScrollEndNotification) {
//            _onEndScroll(scrollNotification.metrics);
//          }
//          double progress = scrollNotification.metrics.pixels /
//              scrollNotification.metrics.maxScrollExtent;
//          //重新构建
//          setState(() {
//            _progress = "${(progress * 100).toInt()}%";
//          });
//        },
//        child: Stack(
//          alignment: Alignment.centerRight,
//          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//              child: Column(
//                children: <Widget>[
//                  new Text(
//                    widget.data['title'],
//                    style: Theme.of(context).textTheme.title,
//                  ),
//                  new SizedBox(height: 12.0),
//                  new Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      new Text(widget.data['author'] ?? ''),
//                      new Text("Дэлгэрэнгүй"),
//                    ],
//                  ),
//                  new SizedBox(height: 12.0),
//                  new Divider(),
//                  new SizedBox(height: 12.0),
//                  new Text(widget.data['description']),
//                  new SizedBox(height: 12.0),
//                  Text(
//                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
//                      "Lorem Ipsum has been the industry's standard dummy text ever since the "
//                      "1500s, when an unknown printer took a galley of type and scrambled it "
//                      "to make a type specimen book. It has survived not only five centuries, "
//                      "but also the leap into electronic typesetting, remaining essentially unchanged. "
//                      "It was popularised in the 1960s with the release of Letraset sheets containing "
//                      "Lorem Ipsum passages, and more recently with desktop publishing software like "
//                      "Aldus PageMaker including versions of Lorem Ipsum."
//                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
//                      "Lorem Ipsum has been the industry's standard dummy text ever since the "
//                      "1500s, when an unknown printer took a galley of type and scrambled it "
//                      "to make a type specimen book. It has survived not only five centuries, "
//                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
//                      "Lorem Ipsum has been the industry's standard dummy text ever since the "
//                      "1500s, when an unknown printer took a galley of type and scrambled it "
//                      "to make a type specimen book. It has survived not only five centuries, "
//                      "but also the leap into electronic typesetting, remaining essentially unchanged. "
//                      "It was popularised in the 1960s with the release of Letraset sheets containing "
//                      "Lorem Ipsum passages, and more recently with desktop publishing software like "
//                      "Aldus PageMaker including versions of Lorem Ipsum."
//                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
//                      "Lorem Ipsum has been the industry's standard dummy text ever since the "
//                      "1500s, when an unknown printer took a galley of type and scrambled it "
//                      "to make a type specimen book. It has survived not only five centuries, "
//                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
//                      "Lorem Ipsum has been the industry's standard dummy text ever since the "
//                      "1500s, when an unknown printer took a galley of type and scrambled it "
//                      "to make a type specimen book. It has survived not only five centuries, "
//                      "but also the leap into electronic typesetting, remaining essentially unchanged. "
//                      "It was popularised in the 1960s with the release of Letraset sheets containing "
//                      "Lorem Ipsum passages, and more recently with desktop publishing software like "
//                      "Aldus PageMaker including versions of Lorem Ipsum."
//                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
//                      "Lorem Ipsum has been the industry's standard dummy text ever since the "
//                      "1500s, when an unknown printer took a galley of type and scrambled it "
//                      "to make a type specimen book. It has survived not only five centuries, "),
//                ],
//              ),
//            ),
//            CircleAvatar(
//              //显示进度百分比
//              radius: 30.0,
//              child: Text(_progress),
//              backgroundColor: Colors.black54,
//            )
//          ],
//        ),
//      ),
//    );
//      SingleChildScrollView(
//        controller: _scrollController,
//        child: SafeArea(
//          child: Padding(
//            padding: new EdgeInsets.all(24.0),
//            child: new Column(
//              children: <Widget>[
//                new Text(
//                  widget.data['title'],
//                  style: Theme.of(context).textTheme.title,
//                ),
//                new SizedBox(height: 12.0),
//                new Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    new Text(widget.data['author'] ?? ''),
//                    new Text("Дэлгэрэнгүй"),
//                  ],
//                ),
//                new SizedBox(height: 12.0),
//                new Divider(),
//                new SizedBox(height: 12.0),
//                new Text(widget.data['description']),
//                new SizedBox(height: 12.0),
//                CircularPercentIndicator(
//                  radius: 60.0,
//                  lineWidth: 5.0,
//                  percent: 1.0,
//                  center: new Text("100%"),
//                  progressColor: Colors.green,
//                ),
//                Text(
//                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
//                    "Lorem Ipsum has been the industry's standard dummy text ever since the "
//                    "1500s, when an unknown printer took a galley of type and scrambled it "
//                    "to make a type specimen book. It has survived not only five centuries, "
//                    "but also the leap into electronic typesetting, remaining essentially unchanged. "
//                    "It was popularised in the 1960s with the release of Letraset sheets containing "
//                    "Lorem Ipsum passages, and more recently with desktop publishing software like "
//                    "Aldus PageMaker including versions of Lorem Ipsum."
//                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
//                    "Lorem Ipsum has been the industry's standard dummy text ever since the "
//                    "1500s, when an unknown printer took a galley of type and scrambled it "
//                    "to make a type specimen book. It has survived not only five centuries, "
//                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
//                    "Lorem Ipsum has been the industry's standard dummy text ever since the "
//                    "1500s, when an unknown printer took a galley of type and scrambled it "
//                    "to make a type specimen book. It has survived not only five centuries, "
//                    "but also the leap into electronic typesetting, remaining essentially unchanged. "
//                    "It was popularised in the 1960s with the release of Letraset sheets containing "
//                    "Lorem Ipsum passages, and more recently with desktop publishing software like "
//                    "Aldus PageMaker including versions of Lorem Ipsum."
//                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
//                    "Lorem Ipsum has been the industry's standard dummy text ever since the "
//                    "1500s, when an unknown printer took a galley of type and scrambled it "
//                    "to make a type specimen book. It has survived not only five centuries, "
//                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
//                    "Lorem Ipsum has been the industry's standard dummy text ever since the "
//                    "1500s, when an unknown printer took a galley of type and scrambled it "
//                    "to make a type specimen book. It has survived not only five centuries, "
//                    "but also the leap into electronic typesetting, remaining essentially unchanged. "
//                    "It was popularised in the 1960s with the release of Letraset sheets containing "
//                    "Lorem Ipsum passages, and more recently with desktop publishing software like "
//                    "Aldus PageMaker including versions of Lorem Ipsum."
//                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
//                    "Lorem Ipsum has been the industry's standard dummy text ever since the "
//                    "1500s, when an unknown printer took a galley of type and scrambled it "
//                    "to make a type specimen book. It has survived not only five centuries, "),
////                new Row(
////                  mainAxisAlignment: MainAxisAlignment.end,
////                  children: <Widget>[
////                    new IconButton(
////                      icon: new Icon(FontAwesomeIcons.angleRight),
////                      onPressed: () {
////                        Navigator.of(context).push(MaterialPageRoute(
////                            builder: (context) =>
////                                new WebPage(data: widget.data)));
////                      },
////                    )
////                  ],
////                ),
//              ],
//            ),
//          ),
//        ));
//  }
}
