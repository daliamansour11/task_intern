// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inter_task/apiService/ApiService.dart';
import 'package:inter_task/apiService/DioClient.dart';

import 'package:inter_task/main.dart';
import 'package:inter_task/model/User.dart';

void main() {
test('fetch user from api and show them in listview', () async {
    // Build our app and trigger a frame.
  final newUser= User();
    bool done =false;
    var fetch = await ApiService(Dio()).getUsers();
     if(fetch!= null){
       done=true;
  }
     const name= "Ghada";
     const email= "Ghada22@gmail.com";
     const status= "active";
     const gender= "female";
      const expectedResult="posted" ;
    // Verify that our counter starts at 0.
    final result= newUser.id;

    // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // Verify that our counter has incremented.
    expect(result, expectedResult);
    // expect(find.text('1'), findsOneWidget);
  });
}

