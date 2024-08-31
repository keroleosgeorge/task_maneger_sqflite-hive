import 'package:flutter/material.dart';
import 'AddButton.dart';
import 'CustomTextfield.dart';

class ShowModalBottomSheet extends StatelessWidget {
  ShowModalBottomSheet({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              'Add New Task',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextfield(
              maxlines: 1,
              controller: titleController,
              hint: 'Enter Task Name',
            ),
            const SizedBox(height: 10),
            CustomTextfield(
              controller: contentController,
              hint: 'Content',
              maxlines: 3,
            ),
            const SizedBox(height: 20),
            AddButton(
              titleController: titleController,
              contentController: contentController,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}



//
//
// import 'package:flutter/material.dart';
// import 'Customtextfield.dart';
//
// class ShowModalBottomSheet extends StatelessWidget {
//   final Function(String, String) onSave;
//
//   const ShowModalBottomSheet({super.key, required this.onSave});
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController titlecontroller = TextEditingController();
//     TextEditingController contentcontroller = TextEditingController();
//
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           CustomTextfield(
//             hint: "Enter The Tiltle",
//             controller: titlecontroller,
//           ),
//           const SizedBox(height: 10),
//           CustomTextfield(
//             maxlines: 3,
//             hint: "Content",
//             controller: contentcontroller,
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () {
//               onSave(titlecontroller.text, contentcontroller.text);
//               Navigator.pop(context);
//             },
//             child: const Text('Save'),
//           ),
//         ],
//       ),
//     );
//   }
// }
