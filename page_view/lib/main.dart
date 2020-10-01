import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pgControle = PageController(
    initialPage: 0,
  );
  Color corAppBar = Colors.green;
  int qualpagina = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: corAppBar,
        title: Text("Page View - Página ${qualpagina.toString()}"),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        pageSnapping: true,
        controller: pgControle,
        onPageChanged: (int qual) {
          setState(() {
            qualpagina = qual + 1;
            if (qual == 0) corAppBar = Colors.green;
            if (qual == 1) corAppBar = Colors.red;
            if (qual == 2) corAppBar = Colors.blueAccent;
          });
        },
        children: [
          pagina01(),
          pagina02(),
          pagina03(),
        ],
      ),
    );
  }

  Widget pagina01() {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.green,
      child: Column(
        children: [
          Text("Página 1"),
          RaisedButton(
            color: Colors.blueAccent,
            child: Text("Clique aqui"),
            onPressed: () {
              pgControle.animateToPage(2,
                  duration: Duration(seconds: 2), curve: Curves.bounceInOut);
            },
          ),
        ],
      ),
    );
  }

  Widget pagina02() {
    return Container(
      color: Colors.red,
      child: Column(
        children: <Widget>[
          Text("Página 2"),
          Text("Texto 2"),
          Text("Texto 3"),
        ],
      ),
    );
  }

  Widget pagina03() {
    return Container(
      color: Colors.blueAccent,
      child: Column(children: <Widget>[
        Center(child: Text("Página 3")),
        RaisedButton(
          color: Colors.blueAccent,
          child: Text("Clique aqui"),
          onPressed: () {
            pgControle.animateToPage(
                0, duration: Duration(seconds: 2), curve: Curves.linear);
          },
        ),
      ]),
    );
  }
}
