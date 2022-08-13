import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inime2/app/data/models/anime_model.dart';
import 'package:inime2/app/routes/app_pages.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({Key? key, required this.animeData}) : super(key: key);
  final List<AnimeModel> animeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Theme.of(context).secondaryHeaderColor,
        ),
        itemCount: animeData.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: (() => Get.toNamed(Routes.DETAIL, arguments: animeData[i])),
            child: ListTile(
              leading: Image.network(
                  animeData[i].attributes?.posterImage?.medium as String),
              title: Text(
                animeData[i].attributes?.canonicalTitle as String,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Row(
                children: [
                  const Icon(Icons.star_border),
                  Text(animeData[i].attributes?.averageRating ?? "No Rating")
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
