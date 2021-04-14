part of 'noticias_ext_bloc_bloc.dart';

abstract class NoticiasExtBlocEvent extends Equatable {
  const NoticiasExtBlocEvent();

  @override
  List<Object> get props => [];
}

class RequestInitialExteriorNewsEvent extends NoticiasExtBlocEvent {
  @override
  List<Object> get props => [];
}

class RequestNewExteriorNewsEvent extends NoticiasExtBlocEvent {
  final String query;

  RequestNewExteriorNewsEvent({@required this.query});

  @override
  List<Object> get props => [query];
}
