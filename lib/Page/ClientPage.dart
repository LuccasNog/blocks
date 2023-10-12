import 'dart:math';

import 'package:fluttebloc/Blocs/client_Events.dart';
import 'package:fluttebloc/Blocs/client_States.dart';
import 'package:fluttebloc/Blocs/client_bloc.dart';
import 'package:fluttebloc/Model/client_Model.dart';
import 'package:flutter/material.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  late final ClientBloc bloc;
  @override
  void initState() {
    //Fazendo a iniciação do bloc
    bloc = ClientBloc();
    //Carregando a lista
    bloc.inputClient.add(LoadClientEvent());

    super.initState();
  }

  @override
  void dispose() {
    //fechando a stream
    bloc.inputClient.close();
    super.dispose();
  }

  //Criando função randName que vai gerar um número aleatório
  String randomName() {
    final rand = Random();
    return ['Maria Almeida', 'Vinicius Silva', 'Luiz Williams', 'Bianca Nevis']
        .elementAt(rand.nextInt(4));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clients"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                //Aqui dentro vamos adicionar o bloc para habilitar
                bloc.inputClient
                    .add(AddClientEvent(client: Client(nome: randomName())));
              },
              icon: const Icon(Icons.person_add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: StreamBuilder<ClientState>(
            stream: bloc.stream,
            builder: (context, AsyncSnapshot<ClientState> snapshot) {
              // aqui ele vai retornr o snapshot ou  lista vázia
              final clientsList = snapshot.data?.clients ?? [];
              print(clientsList);
              return ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(
                          child: ClipRRect(
                            child:
                                Text(clientsList[index].nome.substring(0, 1)),
                          ),
                        ),
                        title: Text(clientsList[index].nome),
                        trailing: IconButton(
                            onPressed: () {
                              bloc.inputClient.add(RemoveClientEvent(
                                  client: clientsList[index]));
                            },
                            icon: const Icon(Icons.remove)),
                      ),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: clientsList.length);
            }),
      ),
    );
  }
}


//https://www.youtube.com/watch?v=UukgrBIf3Cc árei 22 min