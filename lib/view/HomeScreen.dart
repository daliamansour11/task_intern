import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_task/PopMenuItems.dart';
import 'package:inter_task/Provider/Provider.dart';
import 'package:inter_task/TaskMenuItems.dart';
import 'package:inter_task/view/CreateNewUser.dart';
import 'package:inter_task/view/UpdateScreen.dart';
import 'package:inter_task/view/UserDetailsScreen.dart';


class HomeScreen extends ConsumerWidget {
  int? id;
  String? name;
  String? email;
  String? status;
  String ?gender;
  bool isDeleted= false;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final usersDataProvider= ref.watch(userDataProvider);
    final userdProvider= ref.read(UsersProvider);
    return  Scaffold(
        //  backgroundColor: Colors.indigo.shade800,

      floatingActionButton: FloatingActionButton(onPressed: () {

           Navigator.push(context,
               MaterialPageRoute(builder: (context)=>CreateNewUser()));
      },
        child: Icon(Icons.add,size: 48,),
        backgroundColor: Color(0xFF8E30C9),
      ),
         backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text("Users",style: TextStyle(fontSize: 25),),
          centerTitle: true,
          backgroundColor: Color(0xFF8E30C9)
          ,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft:Radius.circular(70),
                topRight: Radius.circular(70))),
            margin: EdgeInsets.all(2),

            child: usersDataProvider.when(data: (data) =>
                ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: data?.length,
                      itemBuilder: (_, index) {
                        final   userData= data?[index];
                        return Card(
                          child: ListTile(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                    UserDetailsScreen(id:  data![index].id??0,
                                        name: data![index].name??"",email:data[index].email??'',
                                      status: data[index].status??'',
                                      gender: data[index].gender??"",
                                    ),
                                    ));
                              },
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${userData?.name}",
                                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
                                  ),
                              PopupMenuButton<PopMenuItems>(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  itemBuilder:(context)=> [
                                    ...TaskMenuItems.taskFirst.map((buildItem)
                                    ).toList(),
                                  ],
                                  onSelected: (   PopMenuItems item) async {
                                    final updateUserData = ref.read(
                                        upDateUserProvider);
                                    final deleteUserData = ref.read(DeleteUserProvider);

                                    switch (item) {
                                      case TaskMenuItems
                                          .editUserData:
                                        print(item.text);

                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context)=>UpdateUserScreen(id: data![index].id??0)));

                                        break;

                                      case TaskMenuItems
                                          .deleteUserData:
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Row(
                                              children:[
                                                AlertDialog(
                                                title: Text('Alert'),
                                                content: Text('would you like to delete this user'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('CANCEL'),
                                                  ),
                                                  TextButton(
                                                    onPressed: ()async {
                                                      final response= await deleteUserData.deleteUser(data![index].id ??0);

                                                       userdProvider.getUser();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("${ response?.done ==isDeleted ?"Deleted Sucessfuly":"AlreadyDeleted"}"),
                        duration: const Duration(seconds: 4),
                        backgroundColor: (  isDeleted !=isDeleted ? Colors.green:Colors.red ),));
                                                      Navigator.pop(context);
                        },
                                                    child: Text('delete'),
                                                  ),
                                                ],
                                              ),
                                            ]);
                                          },
                                        );

                                        break;}}
                              ),




                                        ],
                              ),

                              subtitle:    Padding(
                                padding: const EdgeInsets.all(1),
                                child:Text("${userData?.email}")

                              )),
                        );
                      },
                      ),

                error: (err, _) => Text("$err"),
                loading: () =>
                    Center(child: CircularProgressIndicator(),))

        ));

  }

  PopupMenuItem<PopMenuItems> buildItem(PopMenuItems item)=>PopupMenuItem<PopMenuItems>(
      value: item,
      child: Row
        (
        children: [
          Icon(item.icon,color: item.color,),
          Text(item.text),
        ],
      ));

  }


