import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_task/repository/UserRepo.dart';
import 'package:riverpod/riverpod.dart';
import '../model/User.dart';

final userDataProvider = FutureProvider.autoDispose<List<User>?>((ref) {
  return ref.read(userRepoApi).getUsers();
});

class UserNotifier  extends ChangeNotifier {
  UserNotifier(this.ref) :super();
  final Ref ref;
  getUser() async {
    var repoRes =  await ref.read(userRepoApi).getUsers();
    return repoRes;
  }
}
final UsersProvider = ChangeNotifierProvider.autoDispose<UserNotifier>((
    ref) =>
    UserNotifier(ref)
);
// final userDataByIdProvider = FutureProvider.autoDispose<User>((ref) {
//   return ref.read(userRepoApi).getUserById("1430517");
// });

// final newUserProvier = FutureProvider.autoDispose<User>((ref) =>
// ref.read(userRepoApi).createNewUser(newUser));

   //////newUserProvider/////////////////
class newUserNotifier  extends ChangeNotifier {
  newUserNotifier(this.ref) :super();
  final Ref ref;
  createNewUser(String name,  String email,
      String gender, String status,) async {
    var repoRes =  await ref.read(userRepoApi).createNewUser(name,email,gender,status);
    return repoRes;
  }
}
final newUserProvider = ChangeNotifierProvider.autoDispose<newUserNotifier>((
    ref) =>
    newUserNotifier(ref)
);


///////////upDateUserProvider//////////
class  UpDateUserNotifier  extends ChangeNotifier
{
  UpDateUserNotifier(this.ref) :super();
  final Ref ref;
  Future< User?>upDateUserData(int id,String name,  String email,
  String status, ) async {
    var repoRes =  await ref.read(userRepoApi).upDateUserData(id,name,email,status);
    return repoRes;
  }
}
final upDateUserProvider = ChangeNotifierProvider.autoDispose<UpDateUserNotifier>((
    ref) =>
    UpDateUserNotifier(ref)
);


class  DeleteUserNotifier  extends ChangeNotifier
{
  DeleteUserNotifier(this.ref) :super();
  final Ref ref;
  Future<dynamic>deleteUser(int id) async {
    var repoResnose =  await ref.read(userRepoApi).deleteUser(id);
    return repoResnose;
  }
}
final DeleteUserProvider = ChangeNotifierProvider.autoDispose<DeleteUserNotifier>((
    ref) =>
    DeleteUserNotifier(ref)
);

