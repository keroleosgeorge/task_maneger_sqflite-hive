import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/models/Task_Model.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key, required this.icon,  this.fun,});

  final IconData icon;
  final void Function()?  fun;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child:  IconButton(
        onPressed: fun ??() => null ,icon: Icon(
        icon,
        size: 28,
      ),)
    );
  }
}
