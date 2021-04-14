part of 'noticias_ext_bloc_bloc.dart';

abstract class NoticiasExtBlocState extends Equatable {
  const NoticiasExtBlocState();

  @override
  List<Object> get props => [];
}

class NoticiasExtBlocInitial extends NoticiasExtBlocState {}

class CargandoNoticiasExternasState extends NoticiasExtBlocState {}

class LoadedNoticiasExternasState extends NoticiasExtBlocState {
  final List<New> noticiasExternasList;
  LoadedNoticiasExternasState({@required this.noticiasExternasList});
  @override
  List<Object> get props => [noticiasExternasList];
}

class FailedExternalNewsState extends NoticiasExtBlocState {
  final String fail;
  FailedExternalNewsState({@required this.fail});
  @override
  List<Object> get props => [fail];
}
