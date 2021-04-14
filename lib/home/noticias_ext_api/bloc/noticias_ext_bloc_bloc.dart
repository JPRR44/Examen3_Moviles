import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:google_login/models/new.dart';
import 'package:google_login/utils/news_repository.dart';

part 'noticias_ext_bloc_event.dart';
part 'noticias_ext_bloc_state.dart';

class NoticiasExtBlocBloc
    extends Bloc<NoticiasExtBlocEvent, NoticiasExtBlocState> {
  final newsRepository = NewsRepository();
  NoticiasExtBlocBloc() : super(NoticiasExtBlocInitial());

  @override
  Stream<NoticiasExtBlocState> mapEventToState(
    NoticiasExtBlocEvent event,
  ) async* {
    // Mostrar las noticias de deportes
    if (event is RequestInitialExteriorNewsEvent) {
      yield CargandoNoticiasExternasState();
      yield LoadedNoticiasExternasState(
          noticiasExternasList:
              await newsRepository.getAvailableNoticias('sports'));
    }
    // Noticias con query
    else if (event is RequestNewExteriorNewsEvent) {
      yield LoadedNoticiasExternasState(
          noticiasExternasList:
              await newsRepository.getAvailableNoticias(event.query));
    }
  }
}
