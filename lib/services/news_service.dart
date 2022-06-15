
import 'package:http/http.dart' as http;

import '../models/news_model.dart';
import '../utils/api_key.dart';


class NewsService {
  static final String url =
      "http://newsapi.org/v2/everything?domains=wsj.com&apiKey=d14f4656cef943fb88821658badd6700";

  static final String urlNews = ApiKey.base_url + ApiKey.api_key;
  static Future<List<Article>> getArticle() async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final dataNews = wallStreetJournalFromJson(response.body);
        return dataNews.articles;
      }
    } catch (e) {}
    return [];
  }
}
