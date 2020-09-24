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
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  TextEditingController campoNome = TextEditingController();
  TextEditingController campoEndereco = TextEditingController();
  TextEditingController campoEmail = TextEditingController();
  TextEditingController campoSalario = TextEditingController();
  TextEditingController campoINSS = TextEditingController();
  TextEditingController campoIR = TextEditingController();
  int selecionado = 0;
  String nome = "";
  String endereco = "";
  String email = "";
  double salario = 0;
  double inss = 0;
  double ir = 0;
  double salarioLiquido = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Atividade 23/09"),
          bottom: TabBar(
            onTap: (int qualSelecionado){
              setState(() {
                selecionado = qualSelecionado;
                if (selecionado == 1){
                    nome = campoNome.text;
                    endereco = campoEndereco.text;
                    email = campoEmail.text;
                } else if (selecionado == 2){
                    salario = double.parse(campoSalario.text);
                    inss = double.parse(campoINSS.text);
                    ir = double.parse(campoIR.text);
                    salarioLiquido = salario - inss - ir;
                }
              });
            },
            tabs: [
              Tab(
                icon: Icon(Icons.people),
                text: "Dados",
              ),
              Tab(
                icon: Icon(Icons.attach_money),
                text: "Valores",
              ),
              Tab(
                icon: Icon(Icons.monetization_on),
                text: "Resultado",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
           Form(
             key: formKey1,
             child: Column(
                  children: [
                    TextFormField(
                      controller: campoNome,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Nome",
                        hintText: "Digite seu nome",
                      ),
                      validator: (valor){
                        if (valor.isEmpty)
                          return "O Nome precisa ser informado";
                        else
                          return null;
                      },
                    ),
                    SizedBox(height: 5,),
                    TextFormField(
                      controller: campoEndereco,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Endereço",
                        hintText: "Digite seu Endereço",
                      ),
                      validator: (valor){
                        if (valor.isEmpty)
                          return "O Endereço precisa ser informado";
                        else
                          return null;
                      },
                    ),
                    SizedBox(height: 5,),
                    TextFormField(
                      controller: campoEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        hintText: "Digite seu E-Mail",
                      ),
                      validator: (valor){
                        if (valor.isEmpty)
                          return "O E-Mail precisa ser informado";
                        else
                          return null;
                      },
                    ),
                  ],
                ),
           ),
            Form(
              key: formKey2,
              child: Column(
                children: [
                  TextFormField(
                    controller: campoSalario,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Salário Bruto",
                      hintText: "Digite seu salário",
                    ),
                    validator: (valor){
                      if (valor.isEmpty)
                        return "O Salário precisa ser informado";
                      else
                        return null;
                    },
                  ),
                  SizedBox(height: 5,),
                  TextFormField(
                    controller: campoINSS,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Valor INSS",
                      hintText: "Digite o valor do seu INSS",
                    ),
                    validator: (valor){
                      if (valor.isEmpty)
                        return "O valor precisa ser informado";
                      else
                        return null;
                    },
                  ),
                  SizedBox(height: 5,),
                  TextFormField(
                    controller: campoIR,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Valor IR",
                      hintText: "Digite o valor do seu IR",
                    ),
                    validator: (valor){
                      if (valor.isEmpty)
                        return "O valor precisa ser informado";
                      else
                        return null;
                    },
                  ),
                ],
              ),
            ),
            Table(
              children: [
                TableRow(
                  children: [
                    Padding(padding: EdgeInsets.all(5), child: Text("Nome")),
                    Padding(padding: EdgeInsets.all(5), child: Text(nome)),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(padding: EdgeInsets.all(5), child: Text("Endereço")),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(endereco),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("E-Mail"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(email.toString()),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Salário Bruto"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(salario.toString()),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Valor INSS"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(inss.toString()),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Valor IR"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(ir.toString()),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Salário Líquido"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(salarioLiquido.toString()),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
