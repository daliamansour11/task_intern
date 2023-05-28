
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class UserDetailsScreen extends StatefulWidget{

  int id;
  String name;
  String email;
  String status;
  String gender;

  UserDetailsScreen({required this.id,required this.name,required this.status,required this.gender,required this.email});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Color(0xFF8E30C9),
          title: Text(
            "Details",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body:Container(
           child: Column(
               children:[
                 SizedBox(height: 10,),
                 Text(" userName: ${widget.name}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                 SizedBox(height: 10,),
                 Text(" userEmail:${widget.email}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                 SizedBox(height: 10,),
                 Text(" userStatus: ${widget.status}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                 SizedBox(height: 10,),
                 Text(" userGender: ${widget.gender}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                 )]),
        ),
    );
  }
}