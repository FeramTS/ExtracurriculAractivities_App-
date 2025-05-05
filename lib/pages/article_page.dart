import 'package:extracurricular_activities/models/article_models.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  final Article article;
  const ArticlePage({super.key, required this.article});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.article.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'article-image-${widget.article.id}',
              child: Image.network(
                widget.article.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                widget.article.content,
                style: TextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}