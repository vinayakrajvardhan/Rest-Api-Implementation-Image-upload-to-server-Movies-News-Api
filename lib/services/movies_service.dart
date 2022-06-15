



import 'package:http/http.dart' as http;

import '../models/movies_model.dart';

class MovieService {
  static final String url =
      "http://api.themoviedb.org/3/trending/all/day?api_key=456d4bd9d258f58bdca29a1dde2052ba";

  static Future<List<Result>?> getMovies() async {
    http.Response response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        final data = moviesFromJson(response.body);
        return data.results;
      }
    } catch (e) {
      // log(e.toString());
      print(e.toString());
    }
    return [];
  }
}
