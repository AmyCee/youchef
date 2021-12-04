import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:you_chef/mixin/category_mixin.dart';
import 'package:image_picker/image_picker.dart';
import 'package:you_chef/models/category/category_data.dart';
import 'package:you_chef/screens/dashboard.dart';
import 'package:flutter/foundation.dart';
import 'package:you_chef/utils/hex_color.dart';
import 'package:you_chef/widget/customformfield.dart';

class AddCat extends StatefulWidget {
  const AddCat({Key? key}) : super(key: key);

  @override
  _AddCatState createState() => _AddCatState();
}

class _AddCatState extends State<AddCat> with CategoryMixin{
  XFile? _image;

  dynamic _pickImageError;
  String? _retrieveDataError;

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_image != null) {
      return Container(
        height: 120,
        child: Image.file(File(_image!.path)),
      );
          //label: 'image_picker_example_picked_images');
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'Select an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  final ImagePicker _picker = ImagePicker();
  void _onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 300,
        maxHeight: 300,
        imageQuality: 100,
      );
      setState(() {
        _image = pickedFile;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }



  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var image = "image";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouChef',
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.black87,
            fontFamily: "Capriola-Regular",),
        ),
        backgroundColor: HexColor('A9E07E'),
        //elevation: 0.0,
      ),
      body: SingleChildScrollView(
         child: Container(
             height: MediaQuery.of(context).size.height,
             width: MediaQuery.of(context).size.width,
             color: Colors.black54,
           // decoration: const BoxDecoration(
           //     image: DecorationImage(
           //      image: AssetImage(""),
           //      fit: BoxFit.cover,
           //     colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
           // ),
           // ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
            Container(
            margin: EdgeInsets.only(left: 10,top: 100),
         // height: MediaQuery.of(context).size.height,
         // width: MediaQuery.of(context).size.width,
             child:Text('Add Category',
             textAlign: TextAlign.center,
             style: TextStyle(color: Colors.white70,
              fontFamily: "Capriola-Regular",
              fontSize: 30
             ),
            ),
           ),
              SizedBox(height: 80,),
               FutureBuilder<void>(
                 future: retrieveLostData(),
                 builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                   switch (snapshot.connectionState) {
                     case ConnectionState.none:
                     case ConnectionState.waiting:
                       return const Text(
                         'You have not yet picked an image.',
                         textAlign: TextAlign.center,
                       );
                     case ConnectionState.done:
                       return _previewImages();
                     default:
                       if (snapshot.hasError) {
                         return Text(
                           'Pick image/video error: ${snapshot.error}}',
                           textAlign: TextAlign.center,
                         );
                       } else {
                         return const Text(
                           'Select an image.',
                           textAlign: TextAlign.center,
                         );
                       }
                   }
                 },
               ),
              Semantics(
                label: 'image_picker_example_from_gallery',
                child: FloatingActionButton(
                  onPressed: () {
                    // isVideo = false;
                    _onImageButtonPressed(ImageSource.gallery, context: context);
                  },
                  heroTag: 'image0',
                  tooltip: 'Pick Image from gallery',
                  child: Icon(Icons.photo, color: HexColor('A9E07E'),),
                ),
              ),
              SizedBox(height: 40,),
              CustomFormField(
                formController: nameController,
               // multiline: true,
                textLabel: "Category Name*",
              ),
              SizedBox(height: 40,),
              CustomFormField(
                formController: descriptionController,
                multiline: true,
                height: 120,
                textLabel: "Description*",
              ),
             SizedBox(height: 40,),
              SizedBox(
                width: 300,
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                   // margin: EdgeInsets.only(left: 10,),
                     child: MaterialButton(
                       height: 50,
                       minWidth: 100,
                       shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                       onPressed: () {
                         CategoryData categoryData = CategoryData(description: descriptionController.text, image: _image?.path ?? "", categoryName: nameController.text);
                         addCategory(context, categoryData);
                         Navigator.pop(context,
                           MaterialPageRoute(builder: (context) => Dashboard()),
                         );
                       },
                       color: HexColor('A9E07E'),
                       highlightElevation: 40,
                       child: Text('Save',
                         style: TextStyle(
                             color: Colors.white70,
                             fontFamily: "Capriola-Regular",
                             fontSize: 20
                           ),
                       ),
                     ),
                   ),
                   Container(
                     //margin: EdgeInsets.only(right: 2.0,),
                     child: MaterialButton(
                       height: 50,
                       minWidth: 100,
                       shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                       onPressed: () {
                         Navigator.pop(context,
                           MaterialPageRoute(builder: (context) => Dashboard()),
                         );
                       },
                       color: Colors.black12,
                       highlightElevation: 40,
                       child: Text('Cancel',
                         style: TextStyle(
                             color: Colors.white70,
                             fontFamily: "Capriola-Regular",
                             fontSize: 20
                           ),
                       ),
                     ),
                   ),
                 ],
               ),
              ),
           ],
          ),
        ),
       ),
    );
   }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  }
