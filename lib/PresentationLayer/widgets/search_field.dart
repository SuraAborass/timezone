import 'package:flutter/material.dart';

import '../../Constants/colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: TextFormField(
        onTap: () {},
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintTextDirection: TextDirection.rtl,
            fillColor: AppColors.lightblack,
            prefixIcon: const Icon(Icons.search, color: AppColors.grey2),
            hintText: "Search For a Product , Category ,Brand",
            hintStyle: const TextStyle(
              fontSize: 13,
              color: AppColors.grey2,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: AppColors.grey2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: AppColors.grey2))),
      ),
    );
  }
}
