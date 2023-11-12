import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class UserModel {
  LoginTypeEnum? loginType;
  String? uid;
  String? email;
  String? photoUrl;
  String? displayName;
  String? token;
  DateTime? createdTime;

  UserModel({
    required this.loginType,
    required this.uid,
    required this.email,
    required this.photoUrl,
    required this.displayName,
    required this.token,
    required this.createdTime,
  });

  UserModel copyWith({
    LoginTypeEnum? loginType,
    String? uid,
    String? email,
    String? photoUrl,
    String? displayName,
    String? token,
    DateTime? createdTime,
  }) {
    return UserModel(
      loginType: loginType ?? this.loginType,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      displayName: displayName ?? this.displayName,
      token: token ?? this.token,
      createdTime: createdTime ?? this.createdTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loginType': loginType!.name,
      'uid': uid,
      'email': email,
      'photoUrl': photoUrl,
      'displayName': displayName,
      'token': token,
      'createdTime': createdTime,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      loginType: map['loginType'] != null
          ? LoginTypeEnum.values.byName(map['loginType'])
          : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      createdTime: map['createdTime'] != null
          ? DateTime.parse(map['createdTime'].toDate().toString())
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserModel.empty() {
    return UserModel(
      loginType: LoginTypeEnum.email,
      uid: '',
      email: '',
      photoUrl: '',
      displayName: '',
      token: '',
      createdTime: DateTime.now(),
    );
  }

  factory UserModel.googleSignUp(User user) {
    return UserModel(
      loginType: LoginTypeEnum.google,
      uid: user.uid,
      email: user.email,
      photoUrl: user.photoURL,
      displayName: user.displayName,
      token: '',
      createdTime: DateTime.now(),
    );
  }
}
