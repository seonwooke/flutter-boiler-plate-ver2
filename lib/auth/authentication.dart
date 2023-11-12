import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constants/constants.dart';
import '../controllers/controllers.dart';
import '../models/models.dart';
import '../repositories/repositories.dart';

class Authentication {
  Authentication._privateConstructor();
  static final Authentication _instance = Authentication._privateConstructor();

  static Authentication get instance => _instance;

  /// Auth 로그아웃
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut().then(
            (value) => Get.offAllNamed(
              AppRoutes.instance.initRoute,
            ),
          );
    } catch (error) {
      if (kDebugMode) {
        print('[authentication.dart - signOut] $error');
      }
    }
  }

  /// Google 로그인&회원가입
  Future<User?> signInWithGoogle() async {
    User? user;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    try {
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        try {
          final UserCredential userCredential =
              await FirebaseAuth.instance.signInWithCredential(credential);

          user = userCredential.user;

          if (user != null && userCredential.additionalUserInfo!.isNewUser) {
            SignController.instance.start();

            final UserCredential userCredential =
                await FirebaseAuth.instance.signInWithCredential(credential);

            user = userCredential.user;

            await UserRepository.instance.addUserToFirebase(
              UserModel.googleSignUp(user!),
            );

            Get.offAllNamed(AppRoutes.instance.homeRoute);
            SignController.instance.done();
          } else if (user != null) {
            Get.offAllNamed(AppRoutes.instance.homeRoute);
          }

          if (kDebugMode) {
            print('[SUCCESS] 구글 로그인');
          }
        } on FirebaseAuthException catch (error) {
          if (kDebugMode) {
            print(
                '[authentication.dart - signInWithGoogle] FirebaseAuthException : $error');
          }
        } catch (error) {
          if (kDebugMode) {
            print('[authentication.dart - signInWithGoogle] $error');
          }
        }
      }
      return user;
    } on PlatformException catch (error) {
      if (kDebugMode) {
        print(
            '[authentication.dart - signInWithGoogle] PlatformException : $error');
      }
    } catch (error) {
      if (kDebugMode) {
        print('[authentication.dart - signInWithGoogle] 구글 로그인 실패 : $error');
      }
    }
    return null;
  }

  /// Google 로그아웃
  Future<void> signOutWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      await signOut();
      await googleSignIn.signOut();
      if (kDebugMode) {
        print('[SUCCESS] 구글 로그아웃');
      }
    } catch (error) {
      if (kDebugMode) {
        print('[authentication.dart - signInWithGoogle] $error');
      }
    }
  }

  /// Error SnackBar
  void errorSnackBar(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        Get.snackbar(
          'snackbar_invalid_email_title'.tr,
          'snackbar_invalid_email'.tr,
        );
        break;
      case 'user-not-found':
        Get.snackbar(
          'snackbar_login_failed_title'.tr,
          'snackbar_user_not_found'.tr,
        );
        break;
      case 'wrong-password':
        Get.snackbar(
          'snackbar_login_failed_title'.tr,
          'snackbar_wrong_password'.tr,
        );
        break;
      case 'operation-not-allowed':
        Get.snackbar(
          'snackbar_login_failed_title'.tr,
          'snackbar_operation_not_allowed'.tr,
        );
        break;
      case 'network-request-failed':
        Get.snackbar(
          'snackbar_network_request_failed_title'.tr,
          'snackbar_network_request_failed'.tr,
        );
        break;
      case 'email-already-in-use':
        Get.snackbar(
          'snackbar_member_registration_failure_title'.tr,
          'snackbar_email_already_in_use'.tr,
        );
        break;
      case 'weak-password':
        Get.snackbar(
          'snackbar_member_registration_failure_title'.tr,
          'snackbar_weak_password'.tr,
        );
        break;
      default:
        Get.snackbar(
          error.code,
          '${error.message}',
          duration: const Duration(seconds: 5),
        );
    }
  }
}
