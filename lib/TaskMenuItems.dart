import 'package:flutter/material.dart';
import 'package:inter_task/PopMenuItems.dart';




class TaskMenuItems {
  static  const  List<PopMenuItems> taskFirst = [
    editUserData,
    deleteUserData,
    // taskRunning,
    // taskToDo
  ];

 static  const  editUserData =     PopMenuItems(
      text:  "edit",
      icon: Icons.edit,
      color: Colors.green
    );

 static const  deleteUserData =   PopMenuItems(
      text: "delete",

      icon: Icons.delete,
      color: Colors.blue);

}


