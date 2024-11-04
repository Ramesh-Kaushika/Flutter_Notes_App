import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/data/item_model.dart';
import 'package:notes_app/services/database_helper.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/utils/router.dart';
import 'package:notes_app/utils/text_styles.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({super.key});

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Item> items = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  
  

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    final List<Map<String, dynamic>> data = await dbHelper.fetchItems();
    setState(() {
      items = data.map((item) => Item.fromMap(item)).toList();
    });
  }

  Future<void> _addItem() async {
      // Clear the form
  if (kDebugMode) {
    print("Adding item");
  }

  final newItem = Item(
    title: titleController.text,
    description: descriptionController.text,
  );

  await dbHelper.insertItem(newItem.toMap());

  // Clear the controllers after adding the item
  titleController.clear();
  descriptionController.clear();

  // Fetch updated items and refresh the UI
  await _fetchItems();  // Assuming this fetches the latest data

  // Use setState to ensure the UI updates
  

  // Navigate back to the home page
  AppRouter.router.pop("/");
  }

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
                horizontal: AppConstants.kDefaultPadding / 2,
              ),
              child: Form(
                // key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Note Title
                    TextFormField(
                      controller: titleController,
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
                      controller: descriptionController,
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
                            _addItem();
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
