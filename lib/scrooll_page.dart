import 'package:flutter/material.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';

class ScroollPage extends StatefulWidget {
  const ScroollPage({super.key});

  @override
  State<ScroollPage> createState() => _ScroollPageState();
}

class _ScroollPageState extends State<ScroollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Menu App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

    );
  }
}
