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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nomeController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informe os dados"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nomeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nome",
                  hintText: "Informe o Nome",
                ),
                validator: (valor){
                  if (valor.isEmpty)
                    return "O Nome precisa ser informado";
                  else
                    return null;
                },
              ),
              TextFormField(
                controller: pesoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso",
                  hintText: "Informe o Peso",
                ),
                validator: (valor){
                  if (valor.isEmpty)
                    return "O Peso precisa ser informado";
                  else
                    return null;
                },
              ),
              TextFormField(
                controller: alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura",
                  hintText: "Informe a Altura",
                ),
                validator: (valor){
                  if (valor.isEmpty)
                    return "A Altura precisa ser informada";
                  else
                    return null;
                },
              ),
              RaisedButton(
                child: Text("Calcular"),
                color: Colors.lightBlueAccent,
                onPressed: (){
                  if (formKey.currentState.validate()){
                    double valorPeso = double.parse(pesoController.text.replaceAll(",", "."));
                    double valorAltura = double.parse(alturaController.text.replaceAll(",", "."));
                    double valorIMC = valorPeso / (valorAltura * valorAltura);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => IMC(nomeController.text, valorAltura, valorPeso, valorIMC)));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IMC extends StatefulWidget {
  String nome;
  double altura;
  double peso;
  double imc;

  IMC(this.nome, this.altura, this.peso, this.imc);

  @override
  _IMCState createState() => _IMCState();
}

class _IMCState extends State<IMC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMC"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text("Nome: " + widget.nome +
            "\nAltura: " + widget.altura.toString() +
            "\nPeso: " + widget.peso.toString() +
            "\nIMC: " + widget.imc.toStringAsPrecision(4)
            ),
            RaisedButton(
              child: Text("Fechar"),
              color: Colors.red,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

