import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  final _user = FirebaseAuth.instance.currentUser.obs;
  String? get user => _user.value?.uid;

  @override
  Future<void> onInit() async {
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    _user.listen((p0) {
      if (kDebugMode) {
        if (p0 == null) {
          print('[AUTH] 로그아웃');
        } else {
          print('[AUTH] 로그인');
        }
      }
    });
    super.onInit();
  }
}
