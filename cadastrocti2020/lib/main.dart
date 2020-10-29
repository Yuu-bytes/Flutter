import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //FirebaseFirestore.instance.collection("clientes").doc().set({"nomeCliente":"Setrem","emailCliente":"setrem@setrem.com.br"});
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

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController usuarioLogin = TextEditingController();
  TextEditingController usuarioSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Cadastro Firebase"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: usuarioLogin,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "E-Mail",
                      hintText: "Informe o E-Mail",
                    ),
                    validator: (valor) {
                      if (valor.isEmpty) {
                        return "Informe o E-Mail";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: usuarioSenha,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      hintText: "Informe a Senha",
                    ),
                    validator: (valor) {
                      if (valor.isEmpty) {
                        return "Informe a Senha";
                      } else {
                        return null;
                      }
                    },
                  ),

                  RaisedButton(
                    child: Text("Logar"),
                    onPressed: (){
                      logar();
                    },
                  ),
                ],
              ),
            ),
            RaisedButton(
              color: Colors.lightBlueAccent,
              child: Text("Menu"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Menu()),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> logar() async {

    loading();

    try {
      UserCredential usuario = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: usuarioLogin.text.trim(),
          password: usuarioSenha.text.trim());
      Navigator.pop(context); // fecha a janela do Loading
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Menu()),
      );
    } catch (erro) {
      Navigator.pop(context); // fecha a janela do Loading
      SnackBar snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: Text("Erro ao Fazer Login"),
      );
      scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  void loading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Color(0),
          child: new Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
            padding: EdgeInsets.all(10),
            height: 70,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                SizedBox(
                  width: 30,
                ),
                new Text(" Verificando ..."),
              ],
            ),
          ),
        );
      },
    );
  }

}
