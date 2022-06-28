import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class RemoveStudentController extends GetxController {
  var listOfStudents = [].obs;
  void onInit() {
    super.onInit();
    listOfStudents();
  }

  listOfStudent() async {
    print("user /////////////////////////");
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    String nam;
    await _firestore.collection('users').get().then((value) {
      value.docs.forEach((element) => {
            nam = element['full name'].toString(),
            listOfStudents.add(nam),
            print(element['full name'])
          });

      print("user matched");
    });
  }
}
