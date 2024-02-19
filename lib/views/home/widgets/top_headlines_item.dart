import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';

class TopHeadlinesItem extends StatelessWidget {
  final Article article;
  const TopHeadlinesItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              article.urlToImage,
              loadingBuilder: (context,child,loadingProgress)=> loadingProgress==null ?child:const CircularProgressIndicator.adaptive(),
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
              height: 150,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                
                 const SizedBox(height: 8,),
                Text(
                  article.publishedAt,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}