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
  int selecionado = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ABAS com Flutter: ${selecionado.toString()}"),
          bottom: TabBar(
            onTap: (int qualSelecionado) {
              setState(() {
                selecionado = qualSelecionado;
              });
            },
            tabs: [
              Tab(
                icon: Icon(Icons.directions_car),
                text: "Carro",
              ),
              Tab(
                icon: Icon(Icons.directions_bus),
                text: "Ônibus",
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
                text: "Bicicleta",
              ),
              Tab(
                icon: Icon(Icons.directions_boat),
                text: "Barco",
              ),
              Tab(
                icon: Icon(Icons.person_outline),
                text: "Clientes",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                children: [
                  Icon(Icons.directions_car),
                  Text("Você clicou no carro"),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Icon(Icons.directions_bus),
                  Text("Você clicou no ônibus"),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Icon(Icons.directions_bike),
                  Text("Você clicou na bicicleta"),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Icon(Icons.directions_boat),
                  Text("Você clicou no barco"),
                ],
              ),
            ),
            Clientes()
          ],
        ),
      ),
    );
  }
}

class Clientes extends StatefulWidget {
  @override
  _ClientesState createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.blueGrey,
            height: 500,
            child: Column(
              children: <Widget>[
                Text("Nome CLiente :"),
                Text("Endereço cliente :"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
