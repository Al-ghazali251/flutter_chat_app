// ignore_for_file: avoid_print

import 'package:chat_app/helper/helper_function.dart';
import 'package:chat_app/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService{

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//login
Future loginWithUSerNameandPassword(String email, String password) async{
try{
User user = (await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user!;

if(user != null){
return true; 

}


} on FirebaseAuthException catch (e){
  // ignore: avoid_print
  print(e);
  return e.message;
}
 


}


//register

Future registerUserWithEmailandPassword (String fullName, String email, String password) async{
try{
User user = (await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user!;

if(user != null){

//call our database service to update the user data.
await DatabaseService(uid: user.uid).savingUserData(fullName, email);

 return true; 
}


} on FirebaseAuthException catch (e){
  print(e);
  return e.message;
}
 


}



//signout
Future signOut() async{

  try{
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserNameSF("");
      await HelperFunctions.saveUserEmailSF("");
      await firebaseAuth.signOut();

  } 
  catch(e){
    return null;
  }


}

}