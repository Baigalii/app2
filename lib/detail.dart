import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.data}) : super(key: key);

  final Map data;

  @override
  _DetailPageState createState() => new _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ScrollController _scrollController = new ScrollController();
  String _progress = "0%";
  String message = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("scroll end");
      }
    });
  }

  _onStartScroll(ScrollMetrics metrics) {
    setState(() {
      message = "Scroll Start";
    });
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    setState(() {
      message = "Scroll Update";
    });
  }

  _onEndScroll(ScrollMetrics metrics) {
    setState(() {
      message = "Scroll End";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Мэдээний дэлгэрэнгүй",
          style: TextStyle(color: Colors.red, fontSize: 15.0),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.red),
            onPressed: () {
              Navigator.pushNamed(context, '/news');
            }),
        backgroundColor: Colors.white,
        actions: <Widget>[
          CircleAvatar(
            radius: 30.0,
            child: Text(_progress),
            backgroundColor: Colors.black54,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollStartNotification) {
                    _onStartScroll(notification.metrics);
                  } else if (notification is ScrollUpdateNotification) {
                    _onUpdateScroll(notification.metrics);
                  } else if (notification is ScrollEndNotification) {
                    _onEndScroll(notification.metrics);
                  }
                  double progress = notification.metrics.pixels /
                      notification.metrics.maxScrollExtent;
                  setState(() {
                    _progress = "${(progress * 100).toInt()}%";
                  });
                },
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the "
                      "1500s, when an unknown printer took a galley of type and scrambled it "
                      "to make a type specimen book. It has survived not only five centuries, "
                      "but also the leap into electronic typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release of Letraset sheets containing "
                      "Lorem Ipsum passages, and more recently with desktop publishing software like "
                      "Aldus PageMaker including versions of Lorem Ipsum."
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the "
                      "1500s, when an unknown printer took a galley of type and scrambled it "
                      "to make a type specimen book. It has survived not only five centuries, "
                      "but also the leap into electronic typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release of Letraset sheets containing "
                      "Lorem Ipsum passages, and more recently with desktop publishing software like "
                      "Aldus PageMaker including versions of Lorem Ipsum."
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the "
                      "1500s, when an unknown printer took a galley of type and scrambled it "
                      "to make a type specimen book. It has survived not only five centuries, "
                      "but also the leap into electronic typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release of Letraset sheets containing "
                      "Lorem Ipsum passages, and more recently with desktop publishing software like "
                      "Aldus PageMaker including versions of Lorem Ipsum."
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the "
                      "1500s, when an unknown printer took a galley of type and scrambled it "
                      "to make a type specimen book. It has survived not only five centuries, "
                      "but also the leap into electronic typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release of Letraset sheets containing "
                      "Lorem Ipsum passages, and more recently with desktop publishing software like "
                      "Aldus PageMaker including versions of Lorem Ipsum."
                      "to make a type specimen book. It has survived not only five centuries, "
                      "but also the leap into electronic typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release of Letraset sheets containing "
                      "Lorem Ipsum passages, and more recently with desktop publishing software like "
                      "Aldus PageMaker including versions of Lorem Ipsum."
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the "
                      "1500s, when an unknown printer took a galley of type and scrambled it "
                      "to make a type specimen book. It has survived not only five centuries, "
                      "but also the leap into electronic typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release of Letraset sheets containing "
                      "Lorem Ipsum passages, and more recently with desktop publishing software like "
                      "but also the leap into electronic typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release of Letraset sheets containing "
                      "Lorem Ipsum passages, and more recently with desktop publishing software like "
                      "Aldus PageMaker including versions of Lorem Ipsum."
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the "
                      "1500s, when an unknown printer took a galley of type and scrambled it "
                      "to make a type specimen book. It has survived not only five centuries, "
                      "but also the leap into electronic typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release of Letraset sheets containing "
                      "Lorem Ipsum passages, and more recently with desktop publishing software like"
                      "Aldus PageMaker including versions of Lorem Ipsum."),
                )),
          ),
        ],
      ),
    );
  }
}
