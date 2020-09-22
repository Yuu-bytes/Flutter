import 'package:flutter/material.dart';
import 'segunda.dart';

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
  TextEditingController campoNome = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primera página"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Primeira Página"),
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
                child: Text("Segunda Página"),
                color: Colors.red,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Segunda("SETREM", 2020)));
                },
              ),
              RaisedButton(
                  child: Text("Terceira Página"),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Terceira()));
                  }),
              RaisedButton(
                  child: Text("Retorna Valor"),
                  color: Colors.lightBlueAccent,
                  onPressed: () async {
                    final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Quarta(),
                        ));
                    setState(() {
                      campoNome = result;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class Terceira extends StatefulWidget {
  @override
  _TerceiraState createState() => _TerceiraState();
}

class _TerceiraState extends State<Terceira> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Terceira Página"),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text("Terceira Página"),
            ),
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
    );
  }
}
