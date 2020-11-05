import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registrar extends StatefulWidget {
  @override
  _RegistrarState createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController usuarioLogin = TextEditingController();
  TextEditingController usuarioSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Registro de Usuário"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                    child: Text("Registrar"),
                    onPressed: (){
                      registrar();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> registrar() async {
    try {
      UserCredential usuario = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: usuarioLogin.text,
          password: usuarioSenha.text
      );
      usuario.credential;
      Navigator.pop(context);
    } catch (erro) {
      SnackBar snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text("ERRO ao registrar usuário"),
      );
      scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

}
