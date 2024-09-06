import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/sqlDb.dart';
import '../../models/Task_Model.dart';
import '../Notes_view.dart';
import 'Custom_appbar.dart';
import 'Customtextfield.dart';

class CustomEditBody extends StatefulWidget {
  final int taskId; // Pass task ID to identify the task to be edited
  final String currentTitle; // Pass current title
  final String currentContent; // Pass current content
  const CustomEditBody({
    super.key,
    required this.taskId,
    required this.currentTitle,
    required this.currentContent,
  });

  @override
  _CustomEditBodyState createState() => _CustomEditBodyState();
}

class _CustomEditBodyState extends State<CustomEditBody> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  DateTime? selectedDate;

  sqldb db = sqldb();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current values
    titleController = TextEditingController(text: widget.currentTitle);
    contentController = TextEditingController(text: widget.currentContent);
  }

  // Future<void> _updateTask() async {
  //   // Build SQL query for updating the task
  //   int response = await db.updateData(
  //     "UPDATE tasks SET title = ?, content = ? WHERE id = ?",
  //     [titleController.text, contentController.text, widget.taskId],
  //   );
  //
  //   if (response > 0) {
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NotesView())); // Go back to the previous screen after updating
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Error updating task')),
  //     );
  //   }
  // }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const CustomAppbar(
              title: 'Edit Task',
                icon: Icons.edit,
            ),
            const SizedBox(height: 50),
            CustomTextfield(
              controller: titleController,
              hint: "Title",
            ),
            const SizedBox(height: 20),
            CustomTextfield(
              controller: contentController,
              hint: "Content",
              maxlines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final value = TaskModel(
                  title: titleController.text.trim(),
                  content: contentController.text.trim(),
                );

                Hive.box<TaskModel>('tasks').putAt(widget.taskId, value);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  NotesView()),
                );
              },
              child: const Text('Update Task'),
            ),
          ],
        ),
      ),
    );
  }
}


//
// import 'package:flutter/material.dart';
// import 'Custom_appbar.dart';
// import 'Customtextfield.dart';
//
// class CustomEditBody extends StatelessWidget {
//   final String initialText;
//   final Function(String) onSave;
//
//   const CustomEditBody({super.key, required this.initialText, required this.onSave});
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController controller = TextEditingController(text: initialText);
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//       ),
//       body: Column(
//         children: [
//           CustomAppbar(
//             title: 'Edit Task',
//             icon: Icons.check,
//             onPressed: () {
//               onSave(controller.text);
//               Navigator.pop(context);
//             },
//           ),
//           const SizedBox(height: 50),
//           CustomTextfield(
//             maxlines: 3,
//             hint: "Content",
//             controller: controller,
//           ),
//         ],
//       ),
//     );
//   }
// }
