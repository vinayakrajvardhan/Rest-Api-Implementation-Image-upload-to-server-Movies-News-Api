import 'package:flutter/material.dart';


import '../models/movies_model.dart';
import '../services/movies_service.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies')),
      body: FutureBuilder<List<Result>?>(
          future: MovieService.getMovies(),
          builder: ((context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data?[index].originalName ?? ""),
                      subtitle: Text(
                        snapshot.data?[index].overview ?? "",
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 3,
                      ),
                    ),
                  );
                }));
          })),
    );
  }
}
