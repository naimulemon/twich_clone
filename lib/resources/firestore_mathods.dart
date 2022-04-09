import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:twich_clone/models/livestream.dart';
import 'package:twich_clone/provider/user_provider.dart';
import 'package:twich_clone/resources/storage_methoods.dart';
import 'package:twich_clone/utils/utils.dart';

class FirestoreMethods {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final StrageMathoods _strageMathoods = StrageMathoods();
  Future<String> startLiveStream(
      BuildContext context, String title, Uint8List? image) async {
    final user = Provider.of<UserProvider>(context, listen: false);
    String channelId = "";
    try {
      if (title.isNotEmpty && image != null) {
        if (!(await _firebaseFirestore
                .collection("Livestream")
                .doc(user.user.uid)
                .get())
            .exists) {
          String thumbnailUrl = await _strageMathoods.uploadImageToStorage(
              "Livestream-thubnails", image, user.user.uid);
          channelId = "${user.user.uid}${user.user.username}";
          LiveStream liveStream = LiveStream(
            title: title,
            image: thumbnailUrl,
            uid: user.user.uid,
            username: user.user.username,
            viewers: 0,
            channelID: channelId,
            startAt: DateTime.now(),
          );
          _firebaseFirestore
              .collection("LiveStream")
              .doc(channelId)
              .set(liveStream.toMap());
        
      } 
      else {
        showSnackBar(context, "Please enter all the fields");
      }} 
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
    return channelId;
  }
}
