import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/data/item_model.dart';
import 'package:notes_app/services/database_helper.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/utils/router.dart';
import 'package:notes_app/utils/text_styles.dart';

class CreateNotePage extends StatefulWidget {
  final Item? item; // Optional item parameter for editing

  const CreateNotePage({super.key, this.item});

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // If an item is provided, prefill the text controllers for editing
    if (widget.item != null) {
      titleController.text = widget.item!.title;
      descriptionController.text = widget.item!.description;
    }
  }

  Future<void> _saveNote() async {
    if (widget.item == null) {
      // Add new item
      final newItem = Item(
        title: titleController.text,
        description: descriptionController.text,
      );
      await dbHelper.insertItem(newItem.toMap());
    } else {
      // Update existing item
      final updatedItem = Item(
        id: widget.item!.id,
        title: titleController.text,
        description: descriptionController.text,
      );
      await dbHelper.updateItem(updatedItem.toMap());
    }

    titleController.clear();
    descriptionController.clear();
    AppRouter.router.push("/"); // Navigate to home or refresh
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item == null ? "Create Note" : "Edit Note"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: AppConstants.kDefaultPadding / 2,
              ),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: titleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a titlee23456';
                        }
                        return null;
                      },
                      maxLines: 2,
                      style: const TextStyle(
                        color: AppColors.kWhiteCardColor,
                        fontSize: 30,
                      ),
                      decoration: InputDecoration(
                        hintText: "Note Title",
                        hintStyle: TextStyle(
                          color: AppColors.kWhiteCardColor.withOpacity(0.5),
                          fontSize: 35,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: descriptionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter content';
                        }
                        return null;
                      },
                      maxLines: 12,
                      style: const TextStyle(
                        color: AppColors.kWhiteCardColor,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        hintText: "Note Content",
                        hintStyle: TextStyle(
                          color: AppColors.kWhiteCardColor.withOpacity(0.5),
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: AppColors.kWhiteCardColor.withOpacity(0.2),
                      thickness: 1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              AppColors.kFabColor,
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          onPressed: () {
                            _saveNote();
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Save Note',
                              style: AppTextStyles.appButton,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
