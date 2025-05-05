import 'package:cached_network_image/cached_network_image.dart';
import 'package:extracurricular_activities/models/club_models.dart';
import 'package:flutter/material.dart';

class OneClubPage extends StatefulWidget {
  final Club club;
  const OneClubPage({super.key, required this.club});

  @override
  State<OneClubPage> createState() => _OneClubPageState();
}

class _OneClubPageState extends State<OneClubPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.club.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'club-${widget.club.id}',
              child: CachedNetworkImage(
                imageUrl: widget.club.imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Описание:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(widget.club.description),
                  const SizedBox(height: 20),
                  Text(
                    'Необходимые материалы:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  ...widget.club.requiredItems.map((item) => 
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          const Icon(Icons.check, size: 16),
                          const SizedBox(width: 8),
                          Text(item),
                        ],
                      ),
                    ),
                  ).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}