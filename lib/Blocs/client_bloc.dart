import 'dart:async';

import 'package:fluttebloc/Blocs/client_Events.dart';
import 'package:fluttebloc/Blocs/client_States.dart';
import 'package:fluttebloc/Repository/clientRepository.dart';

import '../Model/client_Model.dart';

class ClientBloc {
  final _clientRepo = ClientsRepository();
  //Precisamos do controlador para nossa stream
  final StreamController<ClientEvent> _inputClientController =
      StreamController<ClientEvent>();

//Vai mostrar a lista dos clientes
  final StreamController<ClientState> _outputClientController =
      StreamController<ClientState>();

  //Criar os gets para acessar na view esses streams
  //Nossa saida para nossos eventos
  Sink<ClientEvent> get inputClient => _inputClientController.sink;

  Stream<ClientState> get stream => _outputClientController.stream;

  //Definindo metodo construtor
  ClientBloc() {
    // cada vez que o input receber um evento, vai chamar esse listen
    _inputClientController.stream.listen(_mapEventToState);
  }
  _mapEventToState(ClientEvent event) {
    List<Client> clients = [];

    //O evento tem que ser algo
    if (event is LoadClientEvent) {
      clients = _clientRepo.loadClientes();
    } else if (event is AddClientEvent) {
      clients = _clientRepo.addClient(event.client);
    } else if (event is RemoveClientEvent) {
      clients = _clientRepo.removeClient(event.client);
    }

    _outputClientController.add(ClientSuccessState(clients: clients));
  }
}
