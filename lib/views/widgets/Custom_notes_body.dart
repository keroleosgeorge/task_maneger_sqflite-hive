import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/models/Task_Model.dart';
import 'package:notes_app/sqlDb.dart';
import 'Custom_appbar.dart';
import 'Custom_itemnotes.dart';

class CustomNotesBody extends StatelessWidget {
  CustomNotesBody({super.key});

  // final sqldb db = sqldb();
  //
  // Future<List<Map>> readData() async {
  //   List<Map> response = await db.readData("SELECT * FROM tasks");
  //   print(response);
  //   return response;
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
          const CustomAppbar(
            title: "Tasks",
            icon: Icons.search,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder(
              future: Hive.openBox('tasks'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.done) {
                  final hivebox = Hive.box('tasks');
                  return ValueListenableBuilder(
                      valueListenable: hivebox.listenable(),
                      builder: (context, Box box, child) {
                        return  ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final helper = hivebox.getAt(index) as TaskModel;
                            return Itemsnote(
                                index: index,
                               content: helper.content,
                               title: helper.title,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 4),
                          itemCount: hivebox.length,
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

//
//
// import 'package:flutter/material.dart';
// import 'Custom_appbar.dart';
// import 'Custom_itemnotes.dart';
//
// class CustomNotesBody extends StatefulWidget {
//   final List<String> titles;
//   final List<String> contents;
//   final Function(int, String) onEdit;
//
//   const CustomNotesBody({super.key, required this.titles, required this.contents, required this.onEdit});
//
//   @override
//   _CustomNotesBodyState createState() => _CustomNotesBodyState();
// }
//
// class _CustomNotesBodyState extends State<CustomNotesBody> {
//   List<String> filteredTitles = [];
//   List<String> filteredContents = [];
//   String searchText = "";
//
//   @override
//   void initState() {
//     super.initState();
//     filteredTitles = widget.titles;
//     filteredContents = widget.contents;
//   }
//
//   void _filterNotes(String query) {
//     setState(() {
//       searchText = query;
//       if (query.isEmpty) {
//         filteredContents = widget.contents;
//         filteredTitles = widget.titles;
//       } else {
//         filteredContents = widget.contents
//             .where((note) => note.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//         filteredTitles = widget.titles
//             .where((title) => title.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       }
//     });
//   }
//
//   void _deleteNoteAt(int index) {
//     setState(() {
//       // إزالة العنصر من القائمة الأصلية باستخدام الفهرس الصحيح
//       int originalIndex = widget.contents.indexOf(filteredContents[index]);
//       widget.contents.removeAt(originalIndex);
//       widget.titles.removeAt(originalIndex);
//
//       // تحديث القوائم المصفاة
//       filteredContents = List.from(widget.contents);
//       filteredTitles = List.from(widget.titles);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             CustomAppbar(
//               title: "Tasks",
//               icon: Icons.search,
//               onPressed: () {
//                 showSearch(
//                   context: context,
//                   delegate: NotesSearchDelegate(
//                     notes: widget.contents,
//                     onSearch: _filterNotes,
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(height: 20),
//             ListView.separated(
//               shrinkWrap: true,
//               physics: const BouncingScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return Itemsnote(
//                   content: filteredContents[index],
//                   index: index,
//                   title: filteredTitles[index],
//                   onEdit: widget.onEdit,
//                   onDelete: () => _deleteNoteAt(index),
//                 );
//               },
//               separatorBuilder: (context, index) => const SizedBox(height: 4),
//               itemCount: filteredContents.length,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class NotesSearchDelegate extends SearchDelegate {
//   final List<String> notes;
//   final Function(String) onSearch;
//
//   NotesSearchDelegate({required this.notes, required this.onSearch});
//
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//           onSearch(query);
//         },
//       ),
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     onSearch(query);
//     return Container();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestions = notes.where((note) {
//       return note.toLowerCase().contains(query.toLowerCase());
//     }).toList();
//
//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(suggestions[index]),
//           onTap: () {
//             query = suggestions[index];
//             onSearch(query);
//             close(context, null);
//           },
//         );
//       },
//     );
//   }
// }
