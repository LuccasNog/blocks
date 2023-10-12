// ignore_for_file: public_member_api_docs, sort_constructors_first
//Isso que vai mostrar na tela
//Isso que queremos carregar na tela

import '../Model/client_Model.dart';

abstract class ClientState {
  List<Client> clients;
  ClientState({
    required this.clients,
  });
}
//Criando etapas do state

class ClientInitialState extends ClientState {
  // Lista começa vázia
  ClientInitialState() : super(clients: []);
}

//Quando carregar a lista de client
class ClientSuccessState extends ClientState {
  ClientSuccessState({required List<Client> clients}) : super(clients: clients);
}
