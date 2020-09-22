import 'package:flutter/material.dart';
import 'Clientes.dart';
import 'Contatos.dart';

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
  int indiceCorrente = 0;
  String tituloApp = "Home";

  final List<Widget> minhaPaginas = [
    Inicial(),
    Produtos(),
    Servicos(),
    Clientes(),
    Contatos()
  ];

  void quandoSelecionado(int index) {
    setState(() {
      indiceCorrente = index;
      if (indiceCorrente == 0) {
        tituloApp = "Home";
      } else if (indiceCorrente == 1) {
        tituloApp = "Produtos";
      } else if (indiceCorrente == 2) {
        tituloApp = "Serviços";
      } else if (indiceCorrente == 3) {
        tituloApp = "Clientes";
      } else if (indiceCorrente == 4) {
        tituloApp = "Contatos";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tituloApp),
      ),
      body: minhaPaginas[indiceCorrente],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blueGrey,
        onTap: quandoSelecionado,
        currentIndex: indiceCorrente,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text("Produtos"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            title: Text("Serviços"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text("Clientes"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text("Contatos"),
          ),
        ],
      ),
    );
  }
}
class Inicial extends StatefulWidget {
  @override
  _InicialState createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text("Você está na página Inicial"),
        ],
      ),
    );
  }
}

class Produtos extends StatefulWidget {
  @override
  _ProdutosState createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text("Você está na página de PRODUTOS"),
        ],
      ),
    );
  }
}

class Servicos extends StatefulWidget {
  @override
  _ServicosState createState() => _ServicosState();
}

class _ServicosState extends State<Servicos> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text("Você está na página SERVIÇOS"),
        ],
      ),
    );
  }
}

