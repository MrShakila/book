import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

Future<dynamic> showDialogBox(BuildContext context, DialogType dialogType,
    String title, String desc) async {
  return AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.BOTTOMSLIDE,
    title: title,
    desc: desc,
    btnOkOnPress: () {
      Navigator.pop(context);
    },
  )..show();
}
