import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inter_task/Provider/Provider.dart';
import 'package:inter_task/model/User.dart';
import 'package:inter_task/view/HomeScreen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CreateNewUser extends ConsumerStatefulWidget {


  @override

  ConsumerState<CreateNewUser> createState() => _CreateNewUserState();}
  class _CreateNewUserState extends ConsumerState<CreateNewUser> {
    bool isLoading = true;
     showSpinnerr(context){
       Center(child:  CircularProgressIndicator());}
var SelectedGender;
var SelectedStatus;
     var gender ;
     var status ;
    bool showSpinner = false;
    var _formKey = GlobalKey<FormState>();
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;}
    _formKey.currentState!.save();}
  TextEditingController nameCOntroller = TextEditingController();
  TextEditingController emailController   =  TextEditingController();
  TextEditingController genderController =  TextEditingController();
  TextEditingController statusController =  TextEditingController();
    clearTextField(){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("${isLoading == true? "Done":"failed"}"),
          duration: const Duration(seconds: 4),
          backgroundColor: (isLoading == true) ? Colors.green : Colors.red,),);
      nameCOntroller.clear();
      emailController.clear();
      statusController.clear();
      gender="";
      status="";


    }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Color(0xFF8E30C9),
          title: Text(
            "AddNewUser",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body:
          ModalProgressHUD(
    inAsyncCall: showSpinner,
        child:
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
                            } else if (value.length < 3) {
                              return "Too short userName,choosea username with 4 character or more characters";
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
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
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

                          child:  TextFormField(

                        controller: emailController,
                        obscureText: false,
                            validator: (value) {
                                    if(value!.isEmpty || value==null){
                                      return 'Enter Your email';
                                    }

          else  if (value != null) {
              if (value.length > 5 && value.contains('@') && value.endsWith('.com')) {
    Fluttertoast.showToast(
    msg: "A reset email has been sent to you", // message
    toastLength: Toast.LENGTH_LONG, // length
    gravity: ToastGravity.CENTER, // location

    timeInSecForIosWeb: 2,
    );
    }}},
                        decoration: InputDecoration(

                          border: OutlineInputBorder(borderRadius:
                          BorderRadius.all(Radius.circular(20)
                          ),),
                          enabledBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orangeAccent,
                              width: 1,

                            ),

                            borderRadius: BorderRadius.all(Radius.circular(20)
                            ),

                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,

                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)

                            ),
                          ),
                          hintText: "Enter email",
                          contentPadding:EdgeInsets.symmetric(vertical: 1,horizontal: 5),
                          //hint text
                          prefixIcon: Icon(Icons.email),
                          //prefix iocn
                          hintStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold,
                              color:Colors.black45),
                          //hint text style
                          labelStyle: TextStyle(
                              fontSize: 13, color: Colors.redAccent), //label style

                        ),

                      )
                      ),
                      SizedBox(height: 16,),


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
                      SizedBox(height: 6,),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 12,right: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[200]
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            itemHeight: 50,
                            // icon: Icon(Icons.add,color: Colors.white,),
                            dropdownColor: Colors.white,
                            underline: Divider(thickness: 0,),
                            isExpanded: true,
                            hint: Container(
                              width:130 ,
                              child: Text("choose status",textAlign: TextAlign.center,style:
                              TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                            ),
                            onChanged: (value) {
                              setState
                                ((){
                                SelectedStatus= value;
                                status = SelectedStatus;

                              });
                            },
                            value: SelectedStatus,
                            items: ["active","inActtive"].map((e) =>
                                DropdownMenuItem(
                                  child: Container(
                                      width: 100,
                                      // color: Colors.blue,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(" $e",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                                      )),
                                  value: e,
                                )).toList(),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 12, top: 3, bottom: 1),
                        child: Text(
                          "gender",
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
                          title: Text("Male"),
                          value: "male",
                          groupValue: gender,
                          onChanged: (value){
                            setState(() {
                              gender = value.toString();
                              gender = gender;
                            });
                          },
                        ),

                        RadioListTile(
                          title: Text("Female"),
                          value: "female",
                          groupValue: gender,
                          onChanged: (value){
                            setState(() {
                              gender = value.toString();
                              gender = gender;
                            });
                          },
                        ),
                      ],
                    ),
                  ),



                      SizedBox(width: size.height * 0.03,),
                      Container(
                        margin: EdgeInsets.only(top: 28, left: 20, right: 20, bottom: 10),
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

                                User?  response = await ref.read(newUserProvider).
                                createNewUser(
                                    nameCOntroller.text,
                                    emailController.text, status,gender);
                                if(isLoading == isLoading ){
                                  nameCOntroller.clear();
                                  emailController.clear();
                                  status =null;
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>HomeScreen()));
                                  final getUserData =ref.watch(UsersProvider).getUser();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("${isLoading == isLoading?"created Suceesfully":"faild"}"),
                                      duration: const Duration(seconds: 4),
                                      backgroundColor: (isLoading == isLoading)
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  );

                                }
                              }
                            },


//clearTextField()
                          child: Text(
                              "    Add User  ",
                              style: TextStyle(color: Colors.white, fontSize: 18)
                          ),
                        ),
                      ),

                    ]))))));
  }



  }
