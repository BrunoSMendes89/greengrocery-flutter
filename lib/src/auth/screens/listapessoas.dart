import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:greengrocer/src/services/api.dart';
import '../models/pessoas.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cadastro de usuários',
      home: BuilderListView(
      ),
      color: Colors.green,
    );
  }
}

class BuilderListView extends StatefulWidget {
  const BuilderListView({super.key});

  @override
  State<BuilderListView> createState() => _BuilderListViewState();
}

class _BuilderListViewState extends State<BuilderListView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  var users = <Pessoas>[];

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        users = lista.map((model) => Pessoas.fromJson(model)).toList();
      });
    });
  }

  _BuilderListViewState() {
    _getUsers();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de usuários'),
      ),
      body: listausuarios(),
    );
  }

  listausuarios() {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index].nome.toString()),
          );
        });
  }
}
