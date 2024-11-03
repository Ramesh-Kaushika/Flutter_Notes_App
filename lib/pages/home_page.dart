import 'package:flutter/material.dart';
import 'package:notes_app/data/item_model.dart';
import 'package:notes_app/services/database_helper.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    final newItem = Item(
      title: titleController.text,
      description: descriptionController.text,
    );
    await dbHelper.insertItem(newItem.toMap());
    titleController.clear();
    descriptionController.clear();
    _fetchItems();
  }

  Future<void> _updateItem(Item item) async {
    final updatedItem = Item(
      id: item.id,
      title: titleController.text,
      description: descriptionController.text,
    );
    await dbHelper.updateItem(updatedItem.toMap());
    titleController.clear();
    descriptionController.clear();
    _fetchItems();
  }

  Future<void> _deleteItem(int id) async {
    await dbHelper.deleteItem(id);
    _fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Notes App", style: AppTextStyles.appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: items.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Center(
                  child: Text(
                    "No notes available, click on the + button to add a new note",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 6 / 4,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      elevation: 3,
                      color: Colors.blueAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item.description,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            side: BorderSide(
              color: AppColors.kWhiteCardColor,
              width: 2,
            )),
        child: const Icon(
          Icons.add,
          color: AppColors.kWhiteCardColor,
          size: 30,
        ),
      ),
    );
  }
}
