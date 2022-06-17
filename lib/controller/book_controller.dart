import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

class BookController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // collection
  CollectionReference books = FirebaseFirestore.instance.collection('books');

  Future<void> saveBookInfo(
    String title,
    String desc,
    double price,
    File img,
  ) async {
    //uploading the image
    UploadTask? task = uploadFile(img);

    final snapshot = await task!.whenComplete(() {});
    //get the download url
    //await keyword eka dala nati nisai aula 
    //sir scaffold eke ?
    //methana await keyword eka dala 
    final downloadUrl = await snapshot.ref.getDownloadURL();
    //get an online doc id
    String docId = books.doc().id;
    //saving book details to cloud store
    await books.doc(docId).set({
      'id': docId,
      'title': title,
      'description': desc,
      'price': price,
      'imageUrl': downloadUrl
    });

    //hold
  }

  //upload picked iamge file to firebase storage
  UploadTask? uploadFile(File img) {
    try {
      //getting the file name
      final fileName = basename(img.path);
      //define the file destination
      final destination = 'bookImages/$fileName';
      //create firebsse storage instance
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(img);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
