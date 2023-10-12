import '../Model/client_Model.dart';

//Estado de eventos
abstract class ClientEvent {}

class LoadClientEvent extends ClientEvent {}

class AddClientEvent extends ClientEvent {
  Client client;
  AddClientEvent({
    required this.client,
  });
}

class RemoveClientEvent extends ClientEvent {
  Client client;

  RemoveClientEvent({
    required this.client,
  });
}
