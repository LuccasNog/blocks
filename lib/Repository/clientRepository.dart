import '../Model/client_Model.dart';

//classe com dados static os
//Aqui ele poderia puxar por api
class ClientsRepository {
  final List<Client> _clients = [];

//Carregadar
  List<Client> loadClientes() {
    _clients.addAll([
      Client(nome: 'Jose Arnaldo'),
      Client(nome: 'Garcia'),
      Client(nome: 'Everaldo'),
      Client(nome: 'Kennedy')
    ]);
    return _clients;
  }

//Adicionar
  List<Client> addClient(Client client) {
    _clients.add(client);
    return _clients;
  }

  List<Client> removeClient(Client client) {
    _clients.remove(client);
    return _clients;
  }
}
