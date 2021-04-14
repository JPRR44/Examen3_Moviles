import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_login/home/noticias_ext_api/bloc/noticias_ext_bloc_bloc.dart';
import 'package:google_login/utils/news_repository.dart';

import 'item_noticia.dart';

class NoticiasDeportes extends StatefulWidget {
  const NoticiasDeportes({Key key}) : super(key: key);

  @override
  _NoticiasDeportesState createState() => _NoticiasDeportesState();
}

class _NoticiasDeportesState extends State<NoticiasDeportes> {
  var query = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: FutureBuilder(
    //     future: NewsRepository().getAvailableNoticias("sports"),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    return BlocConsumer<NoticiasExtBlocBloc, NoticiasExtBlocState>(
        listener: (context, state) {
      if (state is CargandoNoticiasExternasState) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text('Cargando...'),
            ),
          );
      } else if (state is FailedExternalNewsState) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text("${state.fail}"),
            ),
          );
      }
    }, builder: (context, state) {
      if (state is LoadedNoticiasExternasState) {
        if (state.noticiasExternasList.length == 0) {
          return Center(
            child: Text("Sin resultados", style: TextStyle(fontSize: 32)),
          );
        } else if (state.noticiasExternasList.length > 0) {
          return _externalNews(state.noticiasExternasList);
        } else {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          );
        }
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget _externalNews(noticiasExternas) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: query,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            MaterialButton(
              child: Text('Search'),
              onPressed: () {
                BlocProvider.of<NoticiasExtBlocBloc>(context)
                    .add(RequestNewExteriorNewsEvent(
                  query: query.text,
                ));
              },
            ),
          ],
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: noticiasExternas.length,
              itemBuilder: (context, index) {
                return ItemNoticia(
                  noticia: noticiasExternas[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
