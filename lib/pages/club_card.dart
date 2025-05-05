import 'package:cached_network_image/cached_network_image.dart';
import 'package:extracurricular_activities/models/club_models.dart';
import 'package:extracurricular_activities/pages/one_club_page.dart';
import 'package:flutter/material.dart';

class ClubCard extends StatelessWidget {
  final Club club;

  const ClubCard({super.key, required this.club});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OneClubPage(club: club),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: club.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                placeholder: (context, url) => 
                  CircularProgressIndicator(),
                errorWidget: (context, url, error) => 
                  Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              club.title,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}