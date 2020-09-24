import 'package:flutter/material.dart';

void main(){
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tabelas"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Table(
              columnWidths: {0:FractionColumnWidth(0.2), 1:FractionColumnWidth(0.4)},
              //border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    Padding(padding: EdgeInsets.all(5), child: Text("Nome")),
                    Padding(padding: EdgeInsets.all(5),child: Text("Alexandre Knob")),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(padding: EdgeInsets.all(5), child: Text("Endereço")),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Rua Alfredo Henn"),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Cidade"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Três de Maio"),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Estado"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Rio Grande do Sul"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
