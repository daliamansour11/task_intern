

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_task/apiService/ApiService.dart';
import 'package:inter_task/apiService/DioClient.dart';
import 'package:inter_task/model/User.dart';


class UserRepo {
    final ApiService apiService;
 final DioClient dioClient;
UserRepo( this.apiService,
    this.dioClient);
  Future<List<User>?> getUsers() async {
    var response = await apiService.getUsers();
    return response;
  }

  /////////createNewUser////////////////////////
  createNewUser(String name,  String email,
      String gender, String status,) async{
      var responseData = await dioClient.createNewUser(name,email,gender,status);
      return responseData;
    }

    ///////updateUserData////////
   Future< User?> upDateUserData(int id,String name,  String email,
         String status,)async{

      var upDateresponse = await dioClient.upDateUserData(id,name,email,status);
       var response = User.fromJson(upDateresponse!.toJson());
            print(response.status);
      return upDateresponse;
    }


    //////////////////////////deleteUser//////////////////
    Future<dynamic>deleteUser(int id,)async{
      var respons = await dioClient.deleteUser(id: id);
      return respons;
    }
}
final userRepoApi = Provider<UserRepo>((ref) =>
    UserRepo(ApiService(Dio()),DioClient()));

