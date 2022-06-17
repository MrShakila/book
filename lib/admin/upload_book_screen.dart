import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:book/Widgets/text_field_log.dart';
import 'package:book/provider/books.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaveBookInfo extends StatelessWidget {
  const SaveBookInfo({Key? key}) : super(key: key);
  static const routeName = '/saveBookInfo';
  @override
  Widget build(BuildContext context) {
    final _description = TextEditingController();
    final _price = TextEditingController();
    final _title = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.anchor,
              size: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Save Book Info",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldLog(
                title: "Title",
                icon: const Icon(
                  Icons.book,
                  color: Colors.black,
                ),
                controller: _title,
                textInputType: TextInputType.text),
            TextFieldLog(
                title: "Description",
                icon: const Icon(
                  Icons.description,
                  color: Colors.black,
                ),
                controller: _description,
                textInputType: TextInputType.text),
            TextFieldLog(
                title: "Price",
                icon: const Icon(
                  Icons.price_check,
                  color: Colors.black,
                ),
                controller: _price,
                textInputType: TextInputType.number),
            Consumer<Books>(
              builder: (context, value, child) {
                return value.getImage.path == ""
                    ? TextButton(
                        onPressed: () async {
                          Provider.of<Books>(context, listen: false)
                              .selectImage();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(25)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            child: Text(
                              "Uplod Iamge",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ))
                    : InkWell(
                        onTap: () {
                          value.selectImage();
                        },
                        child: Image.file(value.getImage));
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer<Books>(
              builder: (context, value, child) {
                return TextButton(
                    onPressed: () {
                      // check image is picked

                      if (value.getImage.path == '') {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Error',
                          desc: 'Please picked the image',
                          btnOkOnPress: () {},
                        ).show();
                      } else {
                        if (_title.text.isNotEmpty &&
                            _description.text.isNotEmpty &&
                            _price.text.isNotEmpty) {
                          value.startSaveBookInfo(context, _title.text.trim(),
                              _description.text.trim(), _price.text.trim());
                        } else 
                        {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Error',
                            desc: 'Please fill all the fields',
                            btnOkOnPress: () {},
                          ).show();
                        }
                      }
                      //check all the text fields
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(25)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        child: Center(
                          child: Text(
                            "Save Book Info",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ));
              },
            )
          ]),
        ),
      ),
    );
  }
}
