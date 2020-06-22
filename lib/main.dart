import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  int accpeptedData = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          HomePage(
            offset: Offset(100.0, 100.0),
          ),
          Positioned(
              top: 100.0,
              left: 100.0,
              child: DragTarget(
                  builder: (context, accepted, rejected) => Container(
                        height: 100.0,
                        width: 100.0,
                        color: Colors.red,
                        child: Center(
                          child: Text(accpeptedData.toString()),
                        ),
                      ),
                      onAccept: (int data){
                        accpeptedData =  data;
                      },
                      )
                      )
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  Offset offset;
  HomePage({Key key, this.offset}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    if (widget.offset == null) {
      widget.offset = Offset(0.0, 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: widget.offset.dy,
      left: widget.offset.dx,
      child: Draggable(
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.blue,
          child: Center(
            child: Text("HungLD"),
          ),
        ),
        feedback: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.blue.withOpacity(0.3),
          child: Center(
            child: Text("HungLD"),
          ),
        ),
        data: 20,
        onDraggableCanceled: (v, o) {
          setState(() {
            widget.offset = o;
          });
        },
      ),
    );
  }
}
