import 'package:flutter/material.dart';
import 'package:flutter_http_rest_api/models/newsInfo.dart';
import 'package:flutter_http_rest_api/services/api_manager.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<NewsModel> _newsModel;

  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Container(
        child: FutureBuilder<NewsModel>(
          future: _newsModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.articles.length,
                itemBuilder: (context, index) {
                  var article = snapshot.data.articles[index];

                  return Container(
                    height: 100,
                    margin: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(
                              article.urlToImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                article.description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(color: Colors.grey[400]),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
