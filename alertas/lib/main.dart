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
  String fraseRetorno = "Aguradando dados...";
  TextEditingController campoNome = TextEditingController();
  TextEditingController campoSobrenome = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialogs"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Text(fraseRetorno),
            Center(
              child: RaisedButton(
                child: Text("Confirmar"),
                onPressed: (){
                    confirma();
                },
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text("Busca Dados"),
                onPressed: (){
                  campoNome.text = "";
                  campoSobrenome.text = "";
                  buscaDados();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void confirma(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Atenção"),
          content: Text("Confirma os dados?"),
          actions: [
            FlatButton(
              child: Text("Cancelar"),
              onPressed: (){
                setState(() {
                  fraseRetorno = "Dados Cancelados!";
                });
                  Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Confirmar"),
              onPressed: (){
                setState(() {
                  fraseRetorno = "Nome: ${campoNome.text} \nSobrenome: ${campoSobrenome.text}";
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
    );
  }

  void buscaDados(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Atenção"),
            content: Wrap(
              children: [
                TextField(
                  controller: campoNome,
                  decoration: InputDecoration(
                    labelText: "Nome",
                  ),
                ),
                TextField(
                  controller: campoSobrenome,
                  decoration: InputDecoration(
                    labelText: "Sobrenome",
                  ),
                ),
              ],
            ),
            actions: [
              FlatButton(
                child: Text("Cancelar"),
                onPressed: (){
                  setState(() {
                    fraseRetorno = "Dados Cancelados!";
                  });
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Confirmar"),
                onPressed: (){
                  setState(() {
                    fraseRetorno = "Dados Confirmados!";
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
    );
  }

}
