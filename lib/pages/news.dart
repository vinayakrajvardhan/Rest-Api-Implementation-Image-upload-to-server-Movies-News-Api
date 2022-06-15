
import 'package:flutter/material.dart';

import '../models/news_model.dart';
import '../services/news_service.dart';


class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WallStreet Journal News')),
      body: FutureBuilder<List<Article>>(
          future: NewsService.getArticle(),
          builder: ((context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            snapshot.data?[index].urlToImage ?? "",
                            fit: BoxFit.cover,
                            errorBuilder: (context, _, child) {
                              return CircularProgressIndicator(
                                color: Colors.amber,
                              );
                            },
                          )),
                      title: Text(snapshot.data?[index].author ?? ""),
                      subtitle: Text(
                        snapshot.data?[index].content ?? "",
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                  );
                }));
          })),
    );
  }
}
