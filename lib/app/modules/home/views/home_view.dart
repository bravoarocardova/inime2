import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inime2/app/modules/home/views/widgets/item_grid_widget.dart';
import 'package:inime2/app/routes/app_pages.dart';
import 'package:inime2/widgets/loading.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("INime",
            style: TextStyle(fontSize: 24, fontFamily: 'Imposible Fill')),
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.SEARCH),
              icon: const Icon(CupertinoIcons.search))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
                child: controller.obx(
              (data) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Trending",
                      style: TextStyle(
                          fontSize: 24, fontFamily: 'Imposible Fill')),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 3,
                              childAspectRatio: 1 / 2),
                      itemCount: data!.data.length,
                      itemBuilder: (context, i) {
                        return ItemGridWidget(animeModel: data.data[i]);
                      }),
                ],
              ),
              onLoading: const Loading(),
              onError: (error) => Text(
                "ERROR : $error",
              ),
            )),
          ),
        ),
      ),
    );
  }
}
