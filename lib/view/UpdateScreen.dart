

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_task/Provider/Provider.dart';
import 'package:inter_task/model/User.dart';
import 'package:inter_task/view/HomeScreen.dart';




class UpdateUserScreen extends ConsumerStatefulWidget {
  int id;
  UpdateUserScreen({required this. id});

  @override
  ConsumerState<UpdateUserScreen> createState() => _UpdateUserScreenState();}
class _UpdateUserScreenState extends ConsumerState<UpdateUserScreen> {
  bool isLoading = false;

  showSpinnerr(context) {
    Center(child: CircularProgressIndicator());
  }

  var SelectedGender;
  var SelectedStatus;


  var status;

  bool showSpinner = false;
  var _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  TextEditingController nameCOntroller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController statusController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Color(0xFF8E30C9),
          title: Text(
            "UpDateUserData",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body:

        Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: size.width * 0.04,
                      ),

                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          controller: nameCOntroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter userName";
                            } else if (value.length < 6) {
                              return "Too short userName,choosea username with 6 character or more characters";
                            }
                            return null;
                          },

                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  20)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  20)),
                            ),
                            labelText: "UserName",
                            //babel text
                            hintText: " UserName ",
                            //hint text
                            prefixIcon: Icon(Icons.person),
                            //prefix iocn
                            hintStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w200), //hint text style
                            //  labelStyle: TextStyle(fontSize: 13, color: Colors.white), //label style
                          ),
                        ),
                      ),
                      SizedBox(height: 18,),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              return "please enter  your email";
                            }
                            if (!value.contains("@") || !value.contains(".")) {
                              return " please enter valide email address";
                            }
                            return null;
                          },
                          onChanged: (value) {

                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  20)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  20)),
                            ),
                            labelText: "Email",
                            //babel text
                            hintText: " Enter your email ",
                            //hint text
                            prefixIcon: Icon(Icons.person),
                            //prefix iocn
                            hintStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w200), //hint text style
                          ),

                        ),
                      ),

                           SizedBox(height: 15,),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 12, top: 3, bottom: 1),
                        child: Text(
                          "status",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          // ),
                        ),
                      ),
                      Container(

                        child:
                        Column(
                          children: [
                            Divider(),

                            RadioListTile(
                              title: Text("Active"),
                              value: "active",
                              groupValue: status,
                              onChanged: (value){
                                setState(() {
                                  status = value.toString();
                                  status = status;
                                });
                              },
                            ),

                            RadioListTile(
                              title: Text("Inactive"),
                              value: "inactive",
                              groupValue: status,
                              onChanged: (value){
                                setState(() {
                                  status = value.toString();
                                  status = status;
                                });
                              },
                            ),
                          ],
                        ),
                      ),


                      SizedBox(width: size.height * 0.03,),
                      Container(
                        margin: EdgeInsets.only(
                            top: 28, left: 20, right: 20, bottom: 10),
                        height: 60,
                        width: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(160),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                blurRadius: 2,
                                spreadRadius: 1,
                                offset: Offset(0, 0.50))
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF8E30C9),
                            padding: EdgeInsets.all(20.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: () async {
                            if (nameCOntroller.text.isEmpty ||
                                emailController.text.isEmpty ||
                                statusController.text == null) {
                              _submit();
                            }
                            else {
                                        print(widget.id);
                              User?  response = await ref.read(
                                  upDateUserProvider).upDateUserData(widget.id,
                                  nameCOntroller.text,
                                  emailController.text, status);
                              if(response?.id == widget.id){
                                nameCOntroller.clear();
                                emailController.clear();
                                status =null;
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>HomeScreen()));
                                final getUserData =ref.watch(UsersProvider).getUser();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("${response?.id==widget.id?"UpDated Suceesfully":"faild"}"),
                                    duration: const Duration(seconds: 4),
                                    backgroundColor: (response?.id == widget.id)
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                );

    }
                              }
                              },


//clearTextField()
                          child: Text(
                              "    UpDate  ",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18)
                          ),
                        ),
                      ),

                    ])))));
  }

}
