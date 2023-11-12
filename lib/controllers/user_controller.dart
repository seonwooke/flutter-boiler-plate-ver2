import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../auth/auth.dart';
import '../models/models.dart';
import '../repositories/repositories.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  /* 유저 정보 관련 변수 */
  final currentUserModel = UserModel.empty().obs;
  final currentUserUid = FirebaseAuth.instance.currentUser!.uid;

  Future<void> init() async {
    UserModel userModel = await UserRepository.instance.getUser(currentUserUid);
    if (userModel.uid!.isEmpty) {
      await Authentication.instance.signOut();
    } else {
      currentUserModel.value = userModel;
    }
  }

  @override
  Future<void> onInit() async {
    await init();
    super.onInit();
  }
}
