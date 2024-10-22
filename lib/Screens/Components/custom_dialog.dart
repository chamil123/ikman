import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

class DialogBox {
  Future<dynamic> dialogBox(
    BuildContext context,
    DialogType dialogType,
    String title,
    String desc,
    bool isCancelBtn,
    final Function() cancelPres,
    final Function() okPres,
    
  ) async {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.bottomSlide  ,
      title: title,
      desc: desc,
      descTextStyle:const TextStyle(
        fontSize: 15,
      ),

      btnCancelOnPress: isCancelBtn ? cancelPres : null,
      btnOkOnPress: okPres,
    ).show();
  }
}
