import 'package:flutter/material.dart';
import 'main.dart';

class Segunda extends StatefulWidget {
  String frase;
  int valor;

  Segunda(this.frase, this.valor);

  @override
  _SegundaState createState() => _SegundaState();
}

class _SegundaState extends State<Segunda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Segunda Página"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Frase: " + widget.frase),
            Text("Valor: " + widget.valor.toString()),
            RaisedButton(
              child: Text("Fechar e ir para a Terceira Página"),
              color: Colors.red,
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Terceira()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Quarta extends StatefulWidget {
  @override
  _QuartaState createState() => _QuartaState();
}

class _QuartaState extends State<Quarta> {
  TextEditingController campoNome = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Quarta Página"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Quarta Página"),
              ),
            ),
            TextFormField(
              controller: campoNome,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome",
                hintText: "Digite seu nome",
              ),
            ),
            SizedBox(height: 5,),
            RaisedButton(
              child: Text("Voltar"),
              color: Colors.red,
              onPressed: () {
                Navigator.pop(context, campoNome);
              },
            ),
          ],
        ),
      ),
    );
  }
}