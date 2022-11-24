import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_method.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser(
      {required String email,
      required String password,
      required String userName,
      required String bio,
      required Uint8List file}) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          bio.isNotEmpty) {
        //to create user
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(user.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        //add user to firebase
        await _firestore.collection('users').doc(user.user!.uid).set({
          'username': userName,
          'uid': user.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl
        });
        res = 'success';
        // await _firestore.collection("users").add({
        //   'username':userName,
        //   'uid':user.user!.uid,
        //   'email':email,
        //   'bio':bio,
        //   'followers':[],
        //   'following':[]
        // });

      }
    }
    // on FirebaseAuthException catch(e){
    //   if(e.code=='invalid-email'){
    //     res='The email is badly formatted';
    //   }else if (e.code=='weak-password'){
    //   res= 'Password should be at least 6 characters';
    //   }
    // }
    catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = 'Please enter all details';
      }
    }
    // on FirebaseAuthException catch(e){
    //   if(e.code=='user-not-found'){
    //     res='The email is badly formatted';
    //   }else if (e.code=='wrong-password'){
    //   res= 'Password should be at least 6 characters';
    //   }
    // }
    catch (e) {
      res = e.toString();
    }
    return res;
  }
}
