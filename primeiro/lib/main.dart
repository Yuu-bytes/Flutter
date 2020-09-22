import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  /// Variáveis formulário
  TextEditingController campoNome = TextEditingController();
  TextEditingController campoValorA = TextEditingController();
  TextEditingController campoValorB = TextEditingController();
  String fraseNome = "Aguardando o Nome...";
  String fraseResultado = "Aguardando o Resultado...";
  double valorA = 0;
  double valorB = 0;
  double resultado = 0;
  Color corApp = Colors.teal;

  ///

  String frase = "Hoje tá chovendo muito";
  Color corPrimeiroContainer = Colors.redAccent;
  Color corSegundoContainer = Colors.greenAccent;
  int status = 0;

  Color corContainer = Colors.red;
  double alturaContainer = 100;
  double larguraContainer = 300;

  void Calcula(){
    valorA = double.parse(campoValorA.text.replaceAll(",", "."));
    valorB = double.parse(campoValorB.text.replaceAll(",", "."));
    resultado = valorA + valorB;
    if (resultado <= 100){
      corApp = Colors.green;
    } else if (resultado <= 200){
      corApp = Color.fromRGBO(255, 200, 00, 0.3);
    } else {
      corApp = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Primerio APP"),
        backgroundColor: corApp,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (status == 0) {
                  corPrimeiroContainer = Colors.blue;
                  status = 1;
                } else {
                  corPrimeiroContainer = Colors.red;
                  status = 0;
                }
              });
            },
            icon: Icon(Icons.phone),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                corSegundoContainer = Colors.purple;
                larguraContainer = 300;
                alturaContainer = 100;
                corContainer = Colors.red;
              });
            },
            icon: Icon(Icons.camera),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: campoNome,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nome",
                hintText: "Informe o Nome",
                icon: Icon(Icons.accessibility),
              ),
            ),
            SizedBox(height: 5,),
            TextField(
              controller: campoValorA,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Valor A",
                hintText: "Informe o Valor A",
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
            SizedBox(height: 5,),
            TextField(
              controller: campoValorB,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Valor B",
                hintText: "Informe o Valor B",
                prefixIcon: Icon(Icons.monetization_on),
              ),
            ),
            SizedBox(height: 10,),
            Text(fraseNome),
            Text(fraseResultado),
            SizedBox(height: 10,),
            RaisedButton(
              child: Text("Calcula mano"),
              color: Colors.green,
              onPressed: (){
                setState(() {
                  Calcula();
                  fraseNome = "O Nome digitado foi: " + campoNome.text;
                  fraseResultado = "A soma dos dois número é: " + resultado.toString();
                });
              },
            ),
            Container(
              padding: EdgeInsets.all(5),
              height: 50,
              width: 100,
              alignment: Alignment.topLeft,
              color: corPrimeiroContainer,
              child: Column(
                children: [Text("Texto 1"), Text("Texto 2")],
              ),
            ),
            Text(frase),
            Container(
              color: corSegundoContainer,
              height: 50,
              width: 200,
              child: Column(
                children: [
                  Text("Setrem"),
                  Text("SETREM"),
                ],
              ),
            ),
            Text("Depois do ultimo container"),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                RaisedButton(
                  padding: EdgeInsets.all(20),
                  color: Colors.amber,
                  onPressed: () {
                    setState(() {
                      frase = "Hoje é quarte e vai esfriar muito";
                    });
                  },
                  child: Text(
                    "Clique aqui!",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        backgroundColor: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                FlatButton(
                  padding: EdgeInsets.all(20),
                  color: Colors.blue,
                  onPressed: () {
                    setState(() {
                      frase = "Quinta-feira vai nevar(mentira)";
                    });
                  },
                  child: Text(
                    "Clique aqui também",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Center(
              child: AnimatedContainer(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                duration: Duration(seconds: 3),
                width: larguraContainer,
                height: alturaContainer,
                color: corContainer,
                child: Text("Alguma palavra"),
              ),
            ),
            Center(
              child: FlutterLogo(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            larguraContainer = 200;
            alturaContainer = 50;
            corContainer = Colors.blue;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
