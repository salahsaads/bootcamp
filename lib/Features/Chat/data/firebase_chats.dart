

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class firebase_chats{


 // get all users from firebase

static Stream<QuerySnapshot> getallusers(){
 return FirebaseFirestore.instance.collection('UserInfo').where('email',isNotEqualTo: FirebaseAuth.instance.currentUser!.email).snapshots();

 }






}