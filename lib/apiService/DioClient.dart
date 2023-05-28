import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:inter_task/model/User.dart';
import 'package:inter_task/utils/Constants.dart';
import 'package:json_annotation/json_annotation.dart';
part'DioClient.g.dart';
@JsonSerializable()
class DioClient {
  final Dio _dio = Dio();
  final _baseUrl = 'https://gorest.co.in/public/v2/';



 Future<User?> createNewUser(String name,  String email,
      String gender, String status,) async {
   User user;
    final data = FormData.fromMap({
      "name": name,
      'email': email,
      "gender": gender,
      'status': status,
    });
    try {
      var response = await _dio.post(
          _baseUrl + 'users',
          data: data,
          options: Options(
            headers: {
              'Authorization': 'Bearer $TOKEN'},));
      user = User.fromJson(response.data);
      print('user Info: ${response.statusCode}');
      print('user Info: ${response.data.toString()}');
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }
// ////////////////////////update task Status/////////////////////\
//
Future<User?>upDateUserData(int? id,String name,  String email,

    String status, )async {
  User? responseModel;
   final data = FormData.fromMap({
     "id":id,
     "name": name,
     'email': email,
     'status': status,
   });
  try {
    Response userData = await _dio.put(
     _baseUrl+"users/${id}" ,
        data: data,
        options: Options(
      headers: {
        "Content-Type": ACCEPT,
        'Authorization': 'Bearer $TOKEN'
      },
    ));
         responseModel =User.fromJson(userData.data);
    print('User Info: ${userData.statusCode}');
    print('User Info: ${userData.data}');
  } on DioError catch (e) {
    if (e.response != null) {
      print('Dio error!');
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');
    } else {
      // Error due to setting up or sending the request
      print('Error sending request!');
      print(e.message);
    }
  }
  return   responseModel;

}
//

 /////////deleteUserDATA/////////////////////////////////

  Future<dynamic> deleteUser({required int id}) async {

    try {
      Response  deleteduser= await _dio.delete(_baseUrl +"users/${id}",
        options: Options(
        headers: {
        'Authorization': 'Bearer $TOKEN'},));
           // response = User.fromJson(deleteduser.data);
      print('User deleted!${deleteduser.statusMessage}');
      print('User deleted!${deleteduser.statusCode}');
    } catch (e) {
      print('Error deleting user: $e');

  }

 }





///////post Task///////////////////////////////////

  }

