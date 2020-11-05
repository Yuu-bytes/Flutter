import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Esqueci extends StatefulWidget {
  @override
  _EsqueciState createState() => _EsqueciState();
}

class _EsqueciState extends State<Esqueci> {

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController usuarioLogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Resgatar Senha"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
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
                      hintText: "Informe o E-Mail para recuperar a Senha!",
                    ),
                    validator: (valor) {
                      if (valor.isEmpty) {
                        return "Informe o E-Mail";
                      } else {
                        return null;
                      }
                    },
                  ),
                  RaisedButton(
                    child: Text("Resgatar a Senha"),
                    onPressed: (){
                      resgatar();
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
  
  Future<void> resgatar() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: usuarioLogin.text);
      Navigator.pop(context);
    } catch (erro) {
      SnackBar snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text("ERRO ao tentar resgatar a senha!"),
      );
      scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }
  
}
