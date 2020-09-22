import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  String textoFormulario = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário com Validação"),
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
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  hintText: "Informe o E-mail",
                ),
                validator: (valor){
                  if (valor.isEmpty)
                    return "O E-mail precisa ser informado";
                  else
                    return null;
                },
              ),
              TextFormField(
                controller: idadeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Idade",
                  hintText: "Informe a Idade",
                ),
                validator: (valor){
                  if (valor.isEmpty)
                    return "A idade precisa ser informada";
                  else
                    return null;
                },
              ),
              Text(textoFormulario),
              RaisedButton(
                child: Text("Confirmar"),
                color: Colors.lightBlueAccent,
                onPressed: (){
                  if (formKey.currentState.validate()){
                    setState(() {
                      textoFormulario = "Nome: ${nomeController.text}"
                          "\nEmail: ${emailController.text}"
                          "\nIdade: ${idadeController.text}";
                    });
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
