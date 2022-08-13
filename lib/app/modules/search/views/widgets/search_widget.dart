import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inime2/app/modules/search/controllers/search_controller.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key, required this.controller}) : super(key: key);
  final SearchController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => controller.searchTextController.value.text = value,
      textInputAction: TextInputAction.go,
      onFieldSubmitted: (e) => controller.getAnimeByName(e),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        suffixIcon: const Icon(
          CupertinoIcons.search,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white)),
        contentPadding:
            const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        hintText: "Search",
      ),
    );
  }
}
