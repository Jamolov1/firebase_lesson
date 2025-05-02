import 'package:firebase_lesson/model/tips_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme.provider.dart';

class AdviceDetailsPage extends StatefulWidget {
  String tipsAbouts;
  String name;
  AdviceDetailsPage({super.key,required this.name,required this.tipsAbouts});

  @override
  State<AdviceDetailsPage> createState() => _AdviceDetailsPageState();
}

class _AdviceDetailsPageState extends State<AdviceDetailsPage> {
  int aboutCount = 0;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,
        title: Text(widget.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

      ),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.all(12),
          child: Text(widget.tipsAbouts,style: TextStyle(fontSize: 18),),
        )
      ],),
    );
  }
}
