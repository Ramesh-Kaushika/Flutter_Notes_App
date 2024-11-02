import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/utils/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Notes App", style: AppTextStyles.appTitle),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(AppConstants.kDefaultPadding),
        child: Column(
          children: [
            const Text("Hello",style: AppTextStyles.appTitle,),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
              )
          ],
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
