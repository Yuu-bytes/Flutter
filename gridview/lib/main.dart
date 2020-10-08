import 'dart:ffi';

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Opcao{
  String titulo;
  IconData icone;

  Opcao(this.titulo, this.icone);

}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Opcao> opcoes = <Opcao>[
    Opcao("Carro", Icons.directions_car),
    Opcao("Barco", Icons.directions_boat),
    Opcao("Bicicleta", Icons.directions_bike),
    Opcao("Ônibus", Icons.directions_bus),
    Opcao("Corrida", Icons.directions_run),
    Opcao("Pessoas", Icons.people),
    Opcao("Trem", Icons.directions_railway),
    Opcao("Telefone", Icons.phone),
    Opcao("E-Mail", Icons.email),
    Opcao("Ferramenta", Icons.build),
    Opcao("Avião", Icons.airplanemode_active),
    Opcao("Hora", Icons.restore),
    Opcao("Dinheiro", Icons.attach_money),
    Opcao("Euro", Icons.euro_symbol),
    Opcao("Donut", Icons.donut_large),
    Opcao("Android", Icons.android),
    Opcao("Soneca", Icons.airline_seat_individual_suite),
    Opcao("Infinito", Icons.all_inclusive),
    Opcao("Backup", Icons.backup),
  ];

  int qualOrdem = 0;
  IconData qualIcone = Icons.arrow_downward;
  int coluna = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(qualIcone),
            onPressed: (){
              setState(() {
                if (qualOrdem == 0) {
                opcoes.sort((a,b){
                  return a.titulo
                      .toLowerCase()
                      .compareTo(b.titulo.toLowerCase());
                });
                qualOrdem = 1;
                qualIcone = Icons.arrow_upward;
                } else {
                  opcoes.sort((a,b){
                    return b.titulo
                        .toLowerCase()
                        .compareTo(a.titulo.toLowerCase());
                  });
                  qualOrdem = 0;
                  qualIcone = Icons.arrow_downward;
                }
              });
            },
          ),
        ],
        title: Text("GridView"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: (){
            escolheColuna();
        },
      ),
      body: GridView.count(
          crossAxisCount: coluna,
        children: List.generate(opcoes.length, (index) {
          return Center(
            child: Column(
              children: [
                FlatButton(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Icon(opcoes[index].icone),
                      SizedBox(height: 20,),
                      Text(opcoes[index].titulo),
                    ],
                  ),
                  onPressed: (){
                      confirma(opcoes[index].icone, opcoes[index].titulo);
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  void confirma(IconData oIcone, String oTexto){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Atenção"),
            content: Wrap(
              children: [
                Center(
                  child: Column(
                    children: [
                      Icon(oIcone),
                      SizedBox(height: 20,),
                      Text(oTexto),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              FlatButton(
                child: Text("Confirmar"),
                onPressed: (){
                  setState(() {

                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
    );
  }

  void escolheColuna() {
    TextEditingController colunaController = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Quantas Colunas"),
            content: Wrap(
              children: <Widget>[
                Column(
                  children: <Widget>[
                      TextField(
                        controller: colunaController,
                        decoration: InputDecoration(
                          hintText: "Coluna"
                        ),
                      )
                  ],
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Confirmar"),
                onPressed: () {
                  setState(() {
                    coluna = int.parse(colunaController.text);
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

}

