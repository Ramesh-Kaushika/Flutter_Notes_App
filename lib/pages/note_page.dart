import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/utils/text_styles.dart';


class NotePage extends StatelessWidget {
  final String title;
  final String description;
  const NotePage({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              title: const Text("Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "KOHOMADA YALUWANEeeeeeee",
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
              "Hello",
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
