import 'package:flutter/material.dart';
import 'package:whats_app/tabs/call.dart';
import 'package:whats_app/tabs/camera.dart';
import 'package:whats_app/tabs/chats.dart';
import 'package:whats_app/tabs/status.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
        primaryColor: new Color(0xff075e54),
        accentColor: new Color(0xff075E54)),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController myTabController;
  @override
  void initState() {
    myTabController = new TabController(length: 4, vsync: this, initialIndex: 1)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Whats App'),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: null),
            IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onPressed: null)
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            controller: myTabController,
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: 'CHATS',
              ),
              Tab(
                text: 'STATUS',
              ),
              Tab(
                text: 'CALLS',
              )
            ],
          ),
        ),
        body: new TabBarView(
          controller: myTabController,
          children: [
            new Camera(),
            new Chats(),
            new Status(),
            new Call(),
          ],
        ),
        floatingActionButton: myTabController.index == 0
            ? FloatingActionButton(
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              )
            : myTabController.index == 1
                ? FloatingActionButton(
                    child: Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                  )
                : myTabController.index == 2
                    ? FloatingActionButton(
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      )
                    : FloatingActionButton(
                        child: Icon(
                          Icons.add_call,
                          color: Colors.white,
                        ),
                      ));
  }
}
