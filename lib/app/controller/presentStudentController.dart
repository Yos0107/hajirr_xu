import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PresentStudentController extends GetxController{
  var studentPresentToday = [].obs;

  void onInit(){
    super.onInit();
    studentPresentToday();

  }

  presentToday() async{

    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    await _firestore.collection('users').get().then((value){
      value.docs.forEach((element) => {
        studentPresentToday.add(element),
        print(element.id)

      });
    print("Present Today");

  });


  }
}