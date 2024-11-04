import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/utils/text_styles.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({super.key});

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
              title: const Text("Create Note"),
      ),
       body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 
                AppConstants.kDefaultPadding / 2,
              ),
              child: Form(
                // key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Note Title
                    TextFormField(
                      // controller: _noteTitileController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                      maxLines: 2,
                      style: const TextStyle(
                        color: AppColors.kWhiteCardColor,
                        fontSize: 30,
                      ), // Set text color to white
                      decoration: InputDecoration(
                        hintText: "Note Title",
                        hintStyle: TextStyle(
                          color: AppColors.kWhiteCardColor.withOpacity(0.5),
                          fontSize: 35,
                        ), // Set hint text color to white
                        border: InputBorder.none, // Remove all borders
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Note Content
                    TextFormField(
                      // controller: _noteContentController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a content';
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
                        ), // Set hint text color to white
                        border: InputBorder.none, // Remove all borders
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
                            backgroundColor: WidgetStateProperty.all(
                              AppColors.kFabColor,
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          onPressed: () {
                            //save the note
                            // if (_formKey.currentState!.validate()) {
                            //   try {
                            //     final NoteService noteService = NoteService();
                            //     noteService.addNote(
                            //       Note(
                            //         id: const Uuid().v4(),
                            //         title: _noteTitileController.text,
                            //         category: widget.isNewCategory
                            //             ? _categoryController.text
                            //             : category,
                            //         content: _noteContentController.text,
                            //         date: DateTime.now(),
                            //       ),
                            //     );
                            //     //show a snackbar
                            //     AppHelpers.showSnackBar(
                            //       context,
                            //       'Note saved successfully',
                            //     );

                            //     //clear the form
                            //     _noteTitileController.clear();
                            //     _noteContentController.clear();
                            //     AppRouter.router.push("/notes");
                            //   } catch (e) {
                            //     //show a snackbar
                            //     AppHelpers.showSnackBar(
                            //       context,
                            //       'Failed to save note',
                            //     );
                            //   }
                            // }
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