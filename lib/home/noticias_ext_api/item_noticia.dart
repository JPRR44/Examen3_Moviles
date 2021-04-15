import 'package:flutter/material.dart';
import 'package:google_login/models/new.dart';

class ItemNoticia extends StatelessWidget {
  final New noticia;
  ItemNoticia({Key key, @required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// TODO: Cambiar image.network por Extended Image con place holder en caso de error o mientras descarga la imagen
    return Container(
      height: 150,
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                child: Image.network(
                  "${noticia.urlToImage}",
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(11.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${noticia.title}",
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "${noticia.publishedAt}",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "${noticia.description ?? "Descripcion no disponible"}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "${noticia.author ?? "Autor no disponible"}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
