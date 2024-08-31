import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    super.key,
    required this.hint,
    this.maxlines = 1,
    required this.controller,
  });

  final TextEditingController controller;
  final String hint;
  final int maxlines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxlines,
      cursorColor: Colors.purpleAccent,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: Colors.purpleAccent),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: Colors.purpleAccent),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.purpleAccent,
        ),
        filled: true,
        fillColor: Colors.purpleAccent.withOpacity(0.1),
      ),
    );
  }
}



//
// import 'package:flutter/material.dart';
//
// class CustomTextfield extends StatelessWidget {
//   final String hint;
//   final int maxlines;
//   final TextEditingController controller;
//
//   const CustomTextfield({
//     super.key,
//     required this.hint,
//     this.maxlines = 1,
//     required this.controller,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       maxLines: maxlines,
//       cursorColor: Colors.purpleAccent,
//       decoration: InputDecoration(
//         enabledBorder: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(16)),
//           borderSide: BorderSide(color: Colors.white),
//         ),
//         focusedBorder: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(16)),
//           borderSide: BorderSide(color: Colors.purpleAccent),
//         ),
//         hintText: hint,
//         hintStyle: const TextStyle(
//           color: Colors.purpleAccent,
//         ),
//       ),
//     );
//   }
// }
