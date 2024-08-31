import 'package:flutter/material.dart';
import '../../sqlDb.dart';
import '../Notes_view.dart';

class AddButton extends StatelessWidget {
  AddButton({super.key, required this.titleController, required this.contentController});

  final TextEditingController titleController;
  final TextEditingController contentController;

  final sqldb Sqldb = sqldb();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 50),
        ),
      ),
      onPressed: () async {
        String title = titleController.text.trim();
        String content = contentController.text.trim();

        // Ensure that the fields are not empty
        if (title.isNotEmpty && content.isNotEmpty) {
          int result = await Sqldb.insertData(
            "INSERT INTO tasks (title, content) VALUES (?, ?)",
            [title, content],
          );

          print("+++++++++++++++++++++++++ $result +++++++++++++++++++++++++++");

          if (result > 0) {
            // If the data is inserted successfully, navigate to NotesView
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => NotesView()),
            );
          } else {
            // If there's an error, show a SnackBar with the error message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error inserting data'),
              ),
            );
          }
        } else {
          // Show an error message if fields are empty
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please fill in all fields'),
            ),
          );
        }
      },
      child: const Text(
        'Add Task',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

