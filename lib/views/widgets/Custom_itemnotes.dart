import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:notes_app/sqlDb.dart';
import 'package:notes_app/views/Notes_view.dart';
import '../../models/Task_Model.dart';
import 'Custom_Edit_Body.dart';

class Itemsnote extends StatefulWidget {
  final int index;

  // final Map task;

  final String title;
  final String content;

  Itemsnote(
      {super.key,
      required this.index,
      required this.title,
      required this.content});

  @override
  _ItemsnoteState createState() => _ItemsnoteState();
}

class _ItemsnoteState extends State<Itemsnote> {
  final sqldb db = sqldb();

  // Initialize with the current date
  DateTime? selectedDate;

  final List<Color> color = const [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.yellowAccent,
    Colors.purpleAccent,
    Colors.orangeAccent,
  ];

  // Method to pick a date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(), // Default date
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomEditBody(
              currentContent: widget.content,
              currentTitle: widget.title,
              taskId: widget.index,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.2),
        color: color[widget.index % color.length],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  widget.content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black38,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () async {
                  showDialog(context: context,
                      builder:  (context) => AlertDialog(
                        title: const Text('Delete Task'),
                        content: const Text('Are you sure you want to delete this task?'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                          ElevatedButton(onPressed: () async {
                            await Hive.box<TaskModel>('tasks').deleteAt(widget.index);
                            Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => NotesView(),));
                          }, child: const Text('Delete',style:  TextStyle(color: Colors.white),),
                            style:  ElevatedButton.styleFrom(backgroundColor: Colors.red),
                          ),
                        ],
                      ),
                  );
                  // int response = await db.deleteData(
                  //     "DELETE FROM tasks WHERE id = '${widget.index}'");
                  //
                  // if (response > 0) {
                  //   Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => NotesView(),));
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //       content: Text('Task Deleted'),
                  //     ),
                  //   );
                  // }
                },
                icon: const Icon(
                  Icons.delete_rounded,
                  color: Colors.black,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _selectDate(context), // Open date picker
              child: Padding(
                padding: const EdgeInsets.only(right: 30, bottom: 20),
                child: Text(
                  selectedDate == null
                      ? 'Select Date'
                      : DateFormat('MMM dd, yyyy').format(selectedDate!),
                  // Format the selected date
                  style: const TextStyle(color: Colors.black38),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'Custom_Edit_Body.dart';
//
// class Itemsnote extends StatelessWidget {
//   final int index;
//   final String content;
//   final String title;
//   final Function(int, String) onEdit;
//   final VoidCallback onDelete;
//
//   const Itemsnote({
//     super.key,
//     required this.index,
//     required this.content,
//     required this.onEdit,
//     required this.onDelete,
//     required this.title,
//   });
//
//   final List<Color> color = const [
//     Colors.redAccent,
//     Colors.blueAccent,
//     Colors.greenAccent,
//     Colors.yellow,
//     Colors.purpleAccent,
//     Colors.orangeAccent,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => CustomEditBody(
//               initialText: content,
//               onSave: (updatedNote) {
//                 onEdit(index, updatedNote);
//               },
//             ),
//           ),
//         );
//       },
//       child: Card(
//         color: color[index % color.length],
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             ListTile(
//               title: Padding(
//                 padding: const EdgeInsets.only(top: 10, bottom: 10),
//                 child: Text(
//                   maxLines: 1,
//                   title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               subtitle: Padding(
//                 padding: const EdgeInsets.only(bottom: 10),
//                 child: Text(
//                   content,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     color: Colors.black38,
//                   ),
//                 ),
//               ),
//               trailing: IconButton(
//                 onPressed: onDelete, // استدعاء دالة المسح عند الضغط
//                 icon: const Icon(
//                   Icons.delete_rounded,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(right: 30, bottom: 20),
//               child: Text(
//                 'Aug 19, 2024',
//                 style: TextStyle(color: Colors.black45),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
