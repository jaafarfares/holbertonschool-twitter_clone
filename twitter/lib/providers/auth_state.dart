import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart' as user;

enum Errors {
  none,
  matchError,
  weakError,
  existsError,
  error,
  wrongError,
  noUserError,
}

class Auth extends ChangeNotifier {
  /*  final us.User _user = us.User(); */
  FirebaseAuth auth = FirebaseAuth.instance;

  final usersRef =
      FirebaseFirestore.instance.collection('users').withConverter<user.User>(
            fromFirestore: (snapshot, _) {
              return user.User.fromJson(snapshot.data() ?? {});
            },
            toFirestore: (user, _) => user.toJson(),
          );

  Future<Errors> attemptSignUp(String email, String name, String password,
      String passwordConfirmation) async {
    if (password != passwordConfirmation) {
      return Errors.matchError;
    }

    try {
      final result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await usersRef.add(
        user.User(
          key: result.user!.uid,
          userName: name,
          userID: '',
          email: email,
          displayName: name,
          imageUrl: '',
          following: 0,
          followers: 0,
          followersList: [],
          followingList: [],
        ),
      );

      return Errors.none;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Errors.weakError;
      } else if (e.code == 'email-already-in-use') {
        return Errors.existsError;
      } else {
        return Errors.error;
      }
    } catch (e) {
      return Errors.error;
    }
  }

  attemptLogin(email, password) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Errors.noUserError;
      } else if (e.code == 'wrong-password') {
        return Errors.wrongError;
      }
      return Errors.error;
    } catch (e) {
      return Errors.none;
    }
  }

  logout() {
    auth.signOut();
    notifyListeners();
  }

  Future<user.User> getCurrentUserModel() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      throw Exception("No authenticated user");
    }

    final userSnapshot = await usersRef.doc(currentUser.uid).get();

    if (userSnapshot.exists) {
      final userData = userSnapshot.data()!;

      if (userData.key == currentUser.uid) {
        return user.User.fromJson(userData as Map<String, dynamic>);
      } else {
        throw Exception("User key does not match current user's UID");
      }
    } else {
      throw Exception("User not found in Firestore");
    }
  }
}
