import 'package:flutter/material.dart';
import 'package:checkpoint2/components/Contato.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class ListaPage extends StatefulWidget {
  ListaPage({super.key});

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<Contato> contatos = [
    Contato(nomeCompleto: 'Thomas', email: 'thomas@gmail.com'),
    Contato(nomeCompleto: 'Samoht', email: 'samoht@gmail.com'),
    Contato(nomeCompleto: 'Mastho', email: 'mastho@gmail.com'),
    Contato(nomeCompleto: 'Diego', email: 'diego@gmail.com'),
    Contato(nomeCompleto: 'Bruna', email: 'bruna@gmail.com'),
  ];

  int countFavorites() {
    return contatos.where((contato) => contato.isFavorite).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos Favoritos (${countFavorites()})'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: 
                NetworkImage('https://i.pravatar.cc/150'),
            ),
            title: Text(contatos[index].nomeCompleto),
            subtitle: Text(contatos[index].email),
            trailing: IconButton(
              icon: Icon(contatos[index].isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                setState(() {
                  contatos[index].isFavorite = !contatos[index].isFavorite;
                });
              },
            ),
          );
        },
      ),
    );
  }
}