import 'package:flutter/material.dart';
import 'package:checkpoint2/components/Contato.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListaPage(),
    );
  }
}

class ListaPage extends StatelessWidget {

  ListaPage({super.key});
  

  List<Contato> contatos = [
    Contato(nomeCompleto: 'Thomas', email: 'gmail'),
    Contato(nomeCompleto: 'Samoht', email: 'gmail'),
    Contato(nomeCompleto: 'Mastho', email: 'gmail'),
    Contato(nomeCompleto: 'Diego', email: 'gmail'),
    Contato(nomeCompleto: 'Bruna', email: 'gmail'),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos Favoritos'),
        backgroundColor:  Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(

              foregroundColor: Colors.white,
              child: Text(contatos[index].nomeCompleto[0]),
              backgroundColor: Colors.blue,

              ),
            title: Text(contatos[index].nomeCompleto),
            subtitle: Text(contatos[index].email),
            trailing: IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: (){
                
              },
              ),
          );
        },
      ),
    );
  }
}