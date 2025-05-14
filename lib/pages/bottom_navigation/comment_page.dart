import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/theme.provider.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<String> _comments = [];

  final TextEditingController _controller = TextEditingController();

  Future<void> _loadComments() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _comments = prefs.getStringList('comments') ?? [];
    });
  }

  Future<void> _saveComments() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('comments', _comments);
  }

  void _addComment(String comment) {
    if (comment.trim().isEmpty) return;

    setState(() {
      _comments.add(comment);
    });

    _saveComments();
    _controller.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Siz yozgan sharh qabul qilindi")),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadComments();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sharh Yozish"),
      ),
      body: Expanded(
        child: Column(
          children: [
            Expanded(
              child: _comments.isEmpty
                  ? Center(child: Text("Sharhlar yo'q", style: TextStyle(fontSize: 16)))
                  : ListView.builder(
                itemCount: _comments.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
                      child: ListTile(
                        leading: Icon(Icons.comment, color: Colors.orange),
                        title: Text(
                          _comments[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          DateTime.now().toString().substring(0, 16),
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Sharh yozing...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _addComment(_controller.text),
                    child: Text('Yuborish'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
