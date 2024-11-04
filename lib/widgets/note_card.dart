import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';

class NoteCard extends StatefulWidget {
  final String noteTitle;
  final String noteContent;

  final Future Function() removeNote;
  final Future Function() editNote;

  const NoteCard(
      {super.key,
      required this.noteTitle,
      required this.noteContent,
      required this.removeNote,
      required this.editNote});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kCardColor,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(children: [
              IconButton(
                onPressed: () {},
                icon:  Icon(
                  Icons.edit_outlined,
                  color: AppColors.kWhiteCardColor.withOpacity(0.5),
                  ),
              ),
               IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete_outlined,
                  color: AppColors.kWhiteCardColor.withOpacity(0.5)),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
