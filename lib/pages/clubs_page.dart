import 'package:extracurricular_activities/models/club_models.dart';
import 'package:extracurricular_activities/pages/club_card.dart';
import 'package:flutter/material.dart';

class ClubsPage extends StatefulWidget {
  const ClubsPage({super.key});

  @override
  State<ClubsPage> createState() => _ClubsPageState();
}

class _ClubsPageState extends State<ClubsPage> {

  final List<Club> clubs = [
    Club(
      id: '1',
      title: 'Рисование',
      imageUrl: 'https://sun9-78.userapi.com/s/v1/ig2/w7Tmu-1-Z4rZk1KnqYTkIE4mRNzRuRqsR2HMrrBrbe1ZxbyPOcqTXanU4_Cft1zr7iPDJ_8rL55NpMulUccoHKlb.jpg?quality=95&blur=50,20&as=32x29,48x43,72x65,108x97,160x144,240x217,360x325,480x433,540x487,640x578,720x650,1080x975&from=bu&u=ucQ8sVZNqjagD0xD0q2HGI8KQSdP7ZZDxAyke5UQw30&cs=807x729',
      description: 'Кружок для начинающих художников',
      requiredItems: ['Краски', 'Кисти', 'Холст'],
    ),
    Club(
      id: '2',
      title: 'Робототехника',
      imageUrl: 'https://avatars.mds.yandex.net/i?id=875780e0478aa8851367c4e5a8a129af_l-8252971-images-thumbs&n=13',
      description: 'Создаем роботов из LEGO',
      requiredItems: ['Конструктор LEGO', 'Ноутбук'], 
    ),
  ];
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Кружки')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: clubs.length,
          itemBuilder: (context, index) => ClubCard(club: clubs[index]),
        ),
      ),
    );
  }
}