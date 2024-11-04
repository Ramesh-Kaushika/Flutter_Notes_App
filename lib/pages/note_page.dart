import 'package:flutter/material.dart';
import 'package:notes_app/data/item_model.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/utils/text_styles.dart';


class NotePage extends StatelessWidget {
  final Item item;
  const NotePage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              title:  Text(item.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
             Text(
              item.title,
              style: AppTextStyles.appTitle,
            ),
            const SizedBox(height: 5),
            // Text(
            //   formattedDate,
            //   style: AppTextStyles.appDescriptionSmall.copyWith(
            //     color: AppColors.kFabColor,
            //   ),
            // ),
            const SizedBox(height: 20),
            Text(
              item.description,
              style: AppTextStyles.descriptionLargeStyle.copyWith(
                color: AppColors.kWhiteCardColor.withOpacity(0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
