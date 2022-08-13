import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hajirr_xu/logic/Models/login_controller.dart';

class PresentStudentController extends GetxController{
  var studentPresentToday = [].obs;

  void onInit(){
    super.onInit();
    studentPresentToday();

  }

  presentToday() async{

    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    await _firestore
    .collection('users')
    // .orderBy('full name', descending: false)
    // .where("user", isEqualTo:  loggedInUserName,)
    // .where("value", isEqualTo: false)
    .get()
    .then((value){
      value.docs.forEach((element) => {
        studentPresentToday.add(element),
        print(element.id)

      });
    print("Present Today");

  });


  }


  alreadyStarted() async {

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  await _firestore
  .collection('users')
  .where("email address", isEqualTo: email)
  .get()
  .then((value) {
    value.docs.forEach((element) =>{
      // loggedInEmail = element['email address'],
      presentStudents = element['status'],
      print(element['status']),
      print(element.id),
      presentStudents = element.id
    }   
    );
  });
}
}