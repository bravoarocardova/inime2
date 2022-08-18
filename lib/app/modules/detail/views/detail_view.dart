import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inime2/app/modules/detail/views/widgets/back_button_widget.dart';
import 'package:inime2/widgets/loading.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          controller.obx(
              (data) => SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: (data?.attributes?.coverImage != null)
                              ? data?.attributes?.coverImage?.small as String
                              : data?.attributes?.posterImage?.medium as String,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Container(
                            decoration: const BoxDecoration(color: Colors.grey),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'WHOOPSS....',
                                  textAlign: TextAlign.center,
                                ),
                                Icon(Icons.error)
                              ],
                            ),
                          ),
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          margin: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data?.attributes?.canonicalTitle as String,
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "${data?.attributes?.ageRatingGuide ?? ''} (${data?.attributes?.ageRating ?? 'No Age Rating'})"),
                                  Text(data?.attributes?.subtype as String),
                                  Row(
                                    children: [
                                      const Icon(Icons.star_border),
                                      Text(data?.attributes?.averageRating ??
                                          "No Rating")
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(data?.attributes?.synopsis as String)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
              onError: ((error) => Text('$error')),
              onLoading: const Center(child: Loading())),
          const BackButtonWidget()
        ],
      )),
    );
  }
}
