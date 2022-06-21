import 'package:flutter/material.dart';

class removeStudents extends StatelessWidget {
  const removeStudents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text('Add teachers'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Add'))
        ],
      ),
    );
  }
}
