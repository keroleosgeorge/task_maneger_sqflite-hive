// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:notes_app/models/Task_Model.dart';
//
// class AddButton extends StatelessWidget {
//   final TextEditingController titleController;
//   final TextEditingController contentController;
//
//   AddButton({required this.titleController, required this.contentController});
//
//   @override
//   Widget build(BuildContext context) {
//     return FilledButton(
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
//         minimumSize: MaterialStateProperty.all(
//           const Size(double.infinity, 50),
//         ),
//       ),
//       onPressed: () async {
//         String title = titleController.text;
//         String content = contentController.text;
//
//         final value = TaskModel(title: title, content: content);
//
//         if (title.isNotEmpty && content.isNotEmpty) {
//           Hive.box('tasks').add(value);
//           Navigator.pop(context);
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Please fill in all fields'),
//             ),
//           );
//         }
//       },
//       child: const Text(
//         'Add Task',
//         style: TextStyle(color: Colors.black),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/models/Task_Model.dart';

class AddButton extends StatelessWidget {
  AddButton({super.key, required this.titleController, required this.contentController});

  final TextEditingController titleController;
  final TextEditingController contentController;

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
          final value = TaskModel(title: title, content: content);
          Hive.box<TaskModel>('tasks').add(value);

          // Clear the TextEditingControllers after adding the task
          titleController.clear();
          contentController.clear();

          // Close the modal after submission
          Navigator.pop(context);
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
