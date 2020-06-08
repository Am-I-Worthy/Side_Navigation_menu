import 'package:flutter/material.dart';
import 'DrawerBody.dart';
import 'DrawerHeader.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double left;

  DrawerController dc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _openDrawer() {
      _scaffoldKey.currentState.openDrawer();
      setState(() {
        left = MediaQuery.of(context).size.width / 1.5;
      });
    }

    void _closeDrawer() {
      Navigator.of(context).pop();
      setState(() {
        left = null;
      });
    }

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 246),
              left: left ?? 0.0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: RaisedButton(
                    onPressed: _openDrawer,
                    child: const Text('Open Drawer'),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 246),
              curve: Curves.easeOut,
              top: 0.0,
              left: left ?? 0.0,
              child: AppBar(
                onPressed: () {
                  _openDrawer();
                },
              ),
            ),
          ],
        ),
        drawer: GestureDetector(
          onHorizontalDragUpdate: (value) {
            if (value.delta.dx < 0.0) {
              _closeDrawer();
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blue,
                        Color(0xffffffff),
                      ],
                    ),
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.55),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          DrawerHeaderCus(),
                          DrawerBody(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        drawerEnableOpenDragGesture: false,
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  final Function onPressed;

  AppBar({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                onPressed();
              })
        ],
      ),
    );
  }
}





