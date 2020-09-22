import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController campoNome = TextEditingController();
  TextEditingController campoPeso = TextEditingController();
  TextEditingController campoAltura = TextEditingController();
  String frase = "Aguardando as informações...";
  double valorPeso;
  double valorAltura;
  double valorIMC;
  Color corContainer = Colors.white;
  String classificacao = "";

  void Calcula(){
    valorPeso = double.parse(campoPeso.text.replaceAll(",", "."));
    valorAltura = double.parse(campoAltura.text.replaceAll(",", "."));
    valorIMC = valorPeso / (valorAltura * valorAltura);
    if (valorIMC < 18.5) {
      corContainer = Colors.yellow;
      classificacao = "Peso Baixo";
    } else if (valorIMC <= 24.9) {
      corContainer = Colors.green;
      classificacao = "Peso Normal";
    } else if (valorIMC <= 29.9){
      corContainer = Color.fromRGBO(250, 107, 107, 1);
      classificacao = "Sobrepeso";
    } else if (valorIMC <= 34.9) {
      corContainer = Colors.orange;
      classificacao = "Obesidade (Grau I)";
    } else if (valorIMC <= 39.9) {
      corContainer = Colors.redAccent;
      classificacao = "Obesidade Severa (Grau II)";
    } else {
      corContainer = Colors.red;
      classificacao = "Obesidade Mórbida (Grau III)";
    }
    }



    @override
  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text("Calculo de IMC"),
      backgroundColor: Colors.blue,
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
              labelText: "Nome",
              hintText: "Digite seu nome",
            ),
          ),
          SizedBox(height: 5,),
          TextField(
            controller: campoAltura,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Altura",
              hintText: "Digite sua altura",
            ),
          ),
          SizedBox(height: 5,),
          TextField(
            controller: campoPeso,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Peso",
              hintText: "Digite seu peso",
            ),
          ),
          SizedBox(height: 10,),
          Text(frase),
          RaisedButton(
            child: Text("Calcular IMC"),
            color: Colors.blueAccent,
            onPressed: (){
              setState(() {
                Calcula();
                frase = "O IMC de " + campoNome.text + " é: " + valorIMC.toString();
              });
            },
          ),
          Container(
            height: 200,
            padding: EdgeInsets.fromLTRB(5, 50, 5, 5),
            alignment: Alignment.center,
            color: corContainer,
            child: Column(
              children: [
                Text(classificacao,
                style: TextStyle(
                  fontSize: 30,
                ),)
              ],
            ),
          ),
        ],
      ),
    ),
  );
    }
}