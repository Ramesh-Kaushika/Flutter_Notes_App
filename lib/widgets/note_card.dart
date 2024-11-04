import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/text_styles.dart';

class NoteCard extends StatefulWidget {
  final String noteTitle;
  final String noteContent;

  final Future Function() removeNote;
  final Future Function() editNote;

  final VoidCallback? onTap; // Add onTap callback

  const NoteCard(
      {super.key,
      required this.noteTitle,
      required this.noteContent,
      required this.removeNote,
      required this.editNote, this.onTap});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap, // Trigger onTap when card is tapped
      child: Card(
        color: AppColors.kCardColor,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                IconButton(
                onPressed: widget.editNote,
                  icon:  Icon(
                    Icons.edit_outlined,
                    color: AppColors.kWhiteCardColor.withOpacity(0.5),
                    ),
                ),
                const SizedBox(
                  width: 10,
                ),
                 IconButton(
                 onPressed: widget.removeNote,
                  icon: Icon(
                    Icons.delete_outlined,
                    color: AppColors.kWhiteCardColor.withOpacity(0.5),
                    ),
                ),
              ]),
              Text(
                widget.noteTitle,
                style: AppTextStyles.subTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
                Text(
                widget.noteContent,
                style: AppTextStyles.descriptionSmallStyle.copyWith(
                  color: AppColors.kWhiteCardColor.withOpacity(0.5)
                ),
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
