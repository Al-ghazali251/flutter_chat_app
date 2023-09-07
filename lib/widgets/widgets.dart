

import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
   focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFee7b64),width: 2), 
),
   enabledBorder:OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFee7b64),width: 2),
    
),
errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFee7b64),width: 2),
));


void nextScreen(cntext, page){
  Navigator.push(cntext, MaterialPageRoute(builder: (context) => page));
}


void nextScreenReplace(cntext, page){
  Navigator.pushReplacement(cntext as BuildContext, MaterialPageRoute(builder: (context) => page));
}


void showSnackBar(context, color, message){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message, style: const TextStyle(fontSize: 14),),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
    action: SnackBarAction(label: "ok", onPressed: (){}, textColor: Colors.white),
  ));

}