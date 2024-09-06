import 'package:flutter/material.dart';
import 'Custom_search.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title,  this.icon,  this.fun2});

  final String title;
  final IconData? icon;
final void Function()? fun2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.purpleAccent.withOpacity(0.5),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      height: 60,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          CustomSearch(icon: icon!, fun: fun2),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}



//
// import 'package:flutter/material.dart';
// import 'Custom_search.dart';
//
// class CustomAppbar extends StatelessWidget {
//   const CustomAppbar({
//     super.key,
//     required this.title,
//     required this.icon,
//     required this.onPressed,
//   });
//
//   final String title;
//   final IconData icon;
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.purpleAccent.withOpacity(0.5),
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(20),
//           bottomRight: Radius.circular(20),
//         ),
//       ),
//       height: 60,
//       child: Row(
//         children: [
//           const SizedBox(width: 10),
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           const Spacer(),
//           IconButton(
//             onPressed: onPressed,
//             icon: Icon(icon, color: Colors.white),
//           ),
//           const SizedBox(width: 10),
//         ],
//       ),
//     );
//   }
// }
