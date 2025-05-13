import 'package:dish_dash/helpers/extentions/text_extention.dart';
import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Saved'.extentext(
          fontweight: FontWeight.bold,
          fontSize: 26,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Center(child: 'Nothing Saved'.extentext()),
    );
  }
}
