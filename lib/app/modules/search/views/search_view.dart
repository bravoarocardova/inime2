import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inime2/app/modules/search/views/widgets/list_item_widget.dart';
import 'package:inime2/app/modules/search/views/widgets/search_widget.dart';
import 'package:inime2/widgets/loading.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(CupertinoIcons.left_chevron)),
        title: SearchWidget(controller: controller),
      ),
      body: Center(
        child: controller.obx((data) => ListItemWidget(animeData: data!.data),
            onLoading: const Loading(),
            onError: (e) => Text(e.toString()),
            onEmpty: Obx(() => Text(
                '${controller.searchTextController.value.text} tidak ditemukan'))),
      ),
    );
  }
}
