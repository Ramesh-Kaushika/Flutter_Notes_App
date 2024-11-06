import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/data/item_model.dart';
import 'package:notes_app/services/database_helper.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/utils/router.dart';
import 'package:notes_app/utils/text_styles.dart';
import 'package:notes_app/widgets/note_card.dart';

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

  void _showItemDialog([Item? item]) {
    if (item != null) {
      titleController.text = item.title;
      descriptionController.text = item.description;
    } else {
      titleController.clear();
      descriptionController.clear();
    }
    //got to notes page
    AppRouter.router.push("/create_note");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text("Notes App", style: AppTextStyles.appTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              items.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: const Center(
                        child: Text(
                          "No notes available, click on the + button to add a new notee",
                          style: AppTextStyles.descriptionLargeStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: AppConstants.kDefaultPadding,
                        mainAxisSpacing: AppConstants.kDefaultPadding,
                        childAspectRatio: 7 / 11,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return NoteCard(
                          onTap: () {
                            // Navigate to DetailScreen with item data
                            context.push('/detail', extra: item);
                          },
                          noteTitle: item.title,
                          noteContent: item.description,
                          removeNote: () => _deleteItem(item.id!),
                          editNote: () => _updateItem(item),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showItemDialog(),
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
