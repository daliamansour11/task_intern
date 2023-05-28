
import 'package:json_annotation/json_annotation.dart';
part'User.g.dart';
@JsonSerializable()
class User {
   int? id;
  String? name;
  String? email;
 // String? password;
  String? gender;
  String? status;
  User({
       this.id,
      this.name,
      this.email,
      this.gender,
      this.status,
  //  this .password,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
