import 'dart:convert';

import 'package:inter_task/model/User.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'ApiService.g.dart';

 @RestApi(baseUrl: "https://gorest.co.in/public/v2/")
 abstract class ApiService {

  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;


  @GET("users")
  Future<List<User>> getUsers();
//   @POST('users')
// Future<User>createNewUser(@Body()User newUser,@Header("Authorization") String token) ;

}




