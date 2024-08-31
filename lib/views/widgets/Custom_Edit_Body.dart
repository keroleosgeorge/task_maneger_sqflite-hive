import 'package:flutter/material.dart';

import 'Custom_appbar.dart';
import 'Customtextfield.dart';

class CustomEditBody extends StatelessWidget {
  const CustomEditBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            CustomAppbar(
              title: 'Edit Task',
              icon: Icons.check,
            ),
            SizedBox(height: 50,),

            // CustomTextfield(
            //
            //   hint: "Title",
            // ),
            //
            // SizedBox(height: 20,),
            //
            // CustomTextfield(
            //   hint: "Content",
            //   maxlines: 3,
            // ),

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
