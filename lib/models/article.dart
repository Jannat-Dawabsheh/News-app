import 'package:news_app/models/source.dart';

class Article{
  final Source source;
  final String author;
  final String title;
  final String descreption;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article({
    required this.source, 
    required this.author, 
    required this.title, 
    required this.descreption, 
    required this.url, 
    required this.urlToImage, 
    required this.publishedAt, 
    required this.content
    });

    factory Article.fromJson(Map<String,dynamic>json){
      return Article(
        source: Source.fromMap(json['source']),
        author:json['author']??'',
        title:json['title']??'',
        descreption:json['descreption']??'',
        url:json['url']??'',
        urlToImage:json['urlToImage']??'',
        publishedAt:json['publishedAt']??'',
        content:json['content']??'',

      );
        }
}