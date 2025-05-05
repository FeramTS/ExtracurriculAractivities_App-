import 'package:extracurricular_activities/models/article_models.dart';
import 'package:extracurricular_activities/pages/article_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final List<Article> articles = [
    Article(
      id: '1',
      title: 'Что такое внеурочная деятельность?',
      imageUrl: 'https://sun9-19.userapi.com/impg/8M-K1vjupo3iihgxKoIs7Y8TeydYe4Eis0c1XQ/10qWqgYWDmk.jpg?size=590x207&quality=95&sign=e49ae8d91488b00a54070e7c9636755b&c_uniq_tag=ZXo7TY9JYgIA7XwUm1Q5_QTn9KkkNpwBYbVxrsuHfkQ&type=album',
      subtitle: 'Информация для родителей',
      content: 'Полный текст статьи...'),
    Article(
      id: '2',
      title: 'Как записаться в кружок?',
      imageUrl: 'https://sun9-19.userapi.com/impg/8M-K1vjupo3iihgxKoIs7Y8TeydYe4Eis0c1XQ/10qWqgYWDmk.jpg?size=590x207&quality=95&sign=e49ae8d91488b00a54070e7c9636755b&c_uniq_tag=ZXo7TY9JYgIA7XwUm1Q5_QTn9KkkNpwBYbVxrsuHfkQ&type=album',
      subtitle: 'Пошаговая инструкция для родителей',
      content: 'Полный текст статьи...'),
    Article(
      id: '3',
      title: 'Расписание занятий',
      imageUrl: 'https://sun9-19.userapi.com/impg/8M-K1vjupo3iihgxKoIs7Y8TeydYe4Eis0c1XQ/10qWqgYWDmk.jpg?size=590x207&quality=95&sign=e49ae8d91488b00a54070e7c9636755b&c_uniq_tag=ZXo7TY9JYgIA7XwUm1Q5_QTn9KkkNpwBYbVxrsuHfkQ&type=album',
      subtitle: 'Актуальное расписание на месяц',
      content: 'Подробное расписание...'),
  ];

  void _navigateToArticle(BuildContext context, Article article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticlePage(article: article),
      ),
    );
  }

  Widget _buildArticlesList() {
  return ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: articles.length,
    itemBuilder: (context, index) {
      final article = articles[index];
      return Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
          onTap: () => _navigateToArticle(context, article),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                article.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      article.subtitle,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Главная'),
      ),
      body: _buildArticlesList(),
    );
  }
}

