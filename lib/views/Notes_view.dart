import 'package:flutter/material.dart';
import 'widgets/Custom_notes_body.dart';
import 'widgets/Show_modal_Bottom_Sheet.dart';

class NotesView extends StatelessWidget {
   NotesView({super.key});

  List<String> titles = [];
  List<String> contents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: Colors.purpleAccent.withOpacity(0.8),
        splashColor: Colors.white,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return  ShowModalBottomSheet();
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body:  CustomNotesBody(),
    );
  }
}
//
// import 'package:flutter/material.dart';
// import 'widgets/Custom_notes_body.dart';
// import 'widgets/Show_modal_Bottom_Sheet.dart';
//
// class NotesView extends StatefulWidget {
//   const NotesView({super.key});
//
//   @override
//   _NotesViewState createState() => _NotesViewState();
// }
//
// class _NotesViewState extends State<NotesView> {
//   List<String> titles = [];
//   List<String> contents = [];
//
//   void addNote(String title, String content) {
//     setState(() {
//       titles.add(title);
//       contents.add(content);
//     });
//   }
//
//   void updateNote(int index, String updatedNote) {
//     setState(() {
//       contents[index] = updatedNote;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(50),
//         ),
//         backgroundColor: Colors.transparent.withOpacity(0.2),
//         splashColor: Colors.red,
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             builder: (context) {
//               return ShowModalBottomSheet(
//                 onSave: addNote,
//               );
//             },
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//       body: CustomNotesBody(
//         titles: titles,
//        contents: contents,
//         onEdit: updateNote,
//       ),
//     );
//   }
// }
