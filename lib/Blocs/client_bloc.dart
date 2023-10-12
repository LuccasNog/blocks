import 'package:bloc/bloc.dart';
import 'package:fluttebloc/Blocs/client_Events.dart';
import 'package:fluttebloc/Blocs/client_States.dart';
import 'package:fluttebloc/Repository/clientRepository.dart';

//EXTENDENDO O BLOC E MOSTRANDO O TIPO QUE ELE VAI RECEBER E TIPO DE STATE
class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final _clientRepo = ClientsRepository();

  ClientBloc() : super(ClientInitialState()) {
    //Mapeando os eventos
    on<LoadClientEvent>(((event, emit) =>
        emit(ClientSuccessState(clients: _clientRepo.loadClientes()))));

    on<AddClientEvent>((event, emit) =>
        emit(ClientSuccessState(clients: _clientRepo.addClient(event.client))));

    on<RemoveClientEvent>((event, emit) => emit(
        ClientSuccessState(clients: _clientRepo.removeClient(event.client))));
  }
}
