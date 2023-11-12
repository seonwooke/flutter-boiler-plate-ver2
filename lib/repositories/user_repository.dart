import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../controllers/controllers.dart';
import '../models/models.dart';

class UserRepository {
  UserRepository._privateConstructor();
  static final UserRepository _instance = UserRepository._privateConstructor();

  static UserRepository get instance => _instance;

  final _userCollection = FirebaseFirestore.instance.collection("user");

  /// 유저 정보 저장
  Future<void> addUserToFirebase(UserModel userModel) async {
    try {
      await _userCollection.doc(userModel.uid).set(userModel.toMap());
      if (kDebugMode) {
        print('[SUCCESS] ${userModel.email} 유저 생성');
      }
    } catch (error) {
      if (kDebugMode) {
        print("[user_repository.dart - addUserToFirebase] $error");
      }
    }
  }

  /// 유저 정보 가져오기
  Future<UserModel> getUser(String uid) async {
    UserModel userModel = UserModel.empty();
    try {
      await _userCollection.doc(uid).get().then((DocumentSnapshot ds) {
        if (ds.exists) {
          userModel = UserModel.fromMap(ds.data() as Map<String, dynamic>);
          if (kDebugMode) {
            print('[SUCCESS] 유저 정보 가져오기');
          }
        }
      });
    } catch (error) {
      if (kDebugMode) {
        print("[user_repository.dart - getUser] $error");
      }
    }
    return userModel;
  }
}
