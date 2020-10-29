import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'clientes_editar.dart';

class Clientes extends StatefulWidget {
  @override
  _ClientesState createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Clientes"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ClientesEditar(null)));
        },
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("clientes").orderBy("nomeCliente", descending:false).snapshots(),
                builder: (context, snapshot) {
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                    case ConnectionState.done:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      if (snapshot.data.documents.length==0){ //
                        return Center(
                          child: Text("Não há dados!",style: TextStyle(color: Colors.redAccent,fontSize: 20),),
                        );
                      }
                      return ListView.builder(

                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            return Card( // Lista os produtos
                                child: ListTile(
                                  //snapshot.data.documents[index].documentID.toString() - pega o ID
                                  title: Text(snapshot.data.documents[index].data()["nomeCliente"].toString(),style: TextStyle(fontSize: 20)),
                                  subtitle: Text(snapshot.data.documents[index].data()["emailCliente"].toString(),style: TextStyle(fontSize: 16)),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        color: Colors.blueAccent,
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => ClientesEditar(snapshot.data.documents[index])));
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        color: Colors.redAccent,
                                        onPressed: () {
                                          confirmaExclusao(index, snapshot);
                                        },
                                      ),
                                    ],
                                  ),
                                ));
                          }
                      );
                  }
                }
            ),
          ),
        ],
      ),
    );
  }

  confirmaExclusao( index, snapshot) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Atenção !"),
          content: Text("Confirma a exclusão de : \n" + snapshot.data.documents[index].data()["nomeCliente"].toString().toUpperCase()),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Confirmar'),
              onPressed: () {
                FirebaseFirestore.instance.collection('clientes')
                    .doc(snapshot.data.documents[index].id.toString())
                    .delete();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


}