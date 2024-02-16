import 'package:chat_app/chat-app/data/models/UserModel.dart';
import 'package:chat_app/core/error/exceptions.dart';
import 'package:chat_app/core/network/error_messae_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseRemoteDataSource {
  Future<UserModel> registerNewUser(
    String firstName,
    String lastName,
    String phone,
    String password,
    String email,
  );
  Future<UserModel> login(String email, String password);
  Future<void> logout();
  Future<UserModel> updateUser(
      String firstName, String lastName, String phone, String email);
  Future<void> updatePassword(
      String email, String password, String newpassword);
  Future<void> deleteAccount(String email, String password);
  Future<void> verifyEmail();
  Future<void> sendForgotEmail(String email);
  Future<bool> isUserVerified();
  Future<List<UserModel>> getAllUsers();
  Future<UserModel> getUserById(String userId);
}

class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<UserModel> registerNewUser(
    String firstName,
    String lastName,
    String phone,
    String password,
    String email,
  ) async {
    try {
      final authResult =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = authResult.user;

      if (user != null) {
        await FirebaseFirestore.instance.collection("Users").doc(user.uid).set({
          "owner": user.uid,
          "firstName": firstName,
          "lastName": lastName,
          "phone": phone,
          "email": email,
        });

        return UserModel(
          id: user.uid,
          firstName: firstName,
          lastName: lastName,
          phone: phone,
          email: email,
        );
      } else {
        throw const ServerException(
            errorMessageModel:
                ErrorMessageModel(statusMessage: "User registration failed"));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw const ServerException(
            errorMessageModel: ErrorMessageModel(
                statusMessage: "The password provided is too weak"));
      } else if (e.code == 'email-already-in-use') {
        throw const ServerException(
            errorMessageModel: ErrorMessageModel(
                statusMessage: "The account already exists for that email"));
      } else {
        throw const ServerException(
            errorMessageModel:
                ErrorMessageModel(statusMessage: "Something went wrong :("));
      }
    }
  }

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final currentUser = authResult.user;
      final userDoc = await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUser?.uid)
          .get();

      return UserModel.fromJson(userDoc.data()!);
    } catch (e) {
      throw const ServerException(
          errorMessageModel:
              ErrorMessageModel(statusMessage: "wrong credentials"));
    }
  }

  @override
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw const ServerException(
          errorMessageModel:
              ErrorMessageModel(statusMessage: "Something went wrong :("));
    }
  }

  @override
  Future<UserModel> updateUser(
      String firstName, String lastName, String phone, String email) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "owner": FirebaseAuth.instance.currentUser!.uid,
      });
      return UserModel(
        id: FirebaseAuth.instance.currentUser!.uid,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        email: email,
      );
    } catch (e) {
      throw const ServerException(
          errorMessageModel:
              ErrorMessageModel(statusMessage: "Something went wrong :("));
    }
  }

  @override
  Future<void> updatePassword(
      String email, String password, String newpassword) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      AuthCredential cred = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      await user!.reauthenticateWithCredential(cred).then((value) {
        user.updatePassword(newpassword);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw const ServerException(
            errorMessageModel:
                ErrorMessageModel(statusMessage: "User not found"));
      } else if (e.code == 'wrong-password') {
        throw const ServerException(
            errorMessageModel:
                ErrorMessageModel(statusMessage: "Wrong password provided"));
      } else {
        throw const ServerException(
            errorMessageModel:
                ErrorMessageModel(statusMessage: "Something went wrong :("));
      }
    }
  }

  @override
  Future<void> deleteAccount(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .delete();
    } catch (e) {
      throw const ServerException(
          errorMessageModel:
              ErrorMessageModel(statusMessage: "Something went wrong :("));
    }
  }

  @override
  Future<void> verifyEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
    } catch (e) {
      throw const ServerException(
          errorMessageModel:
              ErrorMessageModel(statusMessage: "Something went wrong :("));
    }
  }

  @override
  Future<bool> isUserVerified() async {
    try {
      await FirebaseAuth.instance.currentUser!.reload();
      return FirebaseAuth.instance.currentUser!.emailVerified;
    } catch (e) {
      throw const ServerException(
          errorMessageModel:
              ErrorMessageModel(statusMessage: "Something went wrong :("));
    }
  }

  @override
  Future<void> sendForgotEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code.toString() == 'missing-email') {
        throw const ServerException(
            errorMessageModel:
                ErrorMessageModel(statusMessage: "Something went wrong :("));
      }
      if (e.code.toString() == 'user-not-found') {
        throw const ServerException(
            errorMessageModel:
                ErrorMessageModel(statusMessage: "Something went wrong :("));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel:
              ErrorMessageModel(statusMessage: "Something went wrong :("));
    }
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection("Users").get();
      final List<UserModel> users = [];
      for (var doc in querySnapshot.docs) {
        final user = UserModel.fromJson(doc.data());
        users.add(user);
      }
      return users;
    } catch (e) {
      throw const ServerException(
          errorMessageModel:
              ErrorMessageModel(statusMessage: "Something went wrong :("));
    }
  }

  @override
  Future<UserModel> getUserById(String userId) async {
    try {
      final documentSnapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .get();
      if (documentSnapshot.exists) {
        final user = UserModel.fromJson(documentSnapshot.data()!);
        return user;
      } else {
        throw const ServerException(
            errorMessageModel:
                ErrorMessageModel(statusMessage: "User not found"));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel:
              ErrorMessageModel(statusMessage: "Something went wrong :("));
    }
  }
}
