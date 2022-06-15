import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImageToScreen extends StatefulWidget {
  const UploadImageToScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageToScreen> createState() => _UploadImageToScreenState();
}

class _UploadImageToScreenState extends State<UploadImageToScreen> {
  File? _image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future<void> getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      setState(() {});
    } else {
      print('no image selected');
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });
    var stream = await http.ByteStream(_image!.openRead());
    stream.cast();

    var length = await _image!.length();

    var uri = Uri.parse('https://fakestoreapi.com/products');

    var request = await http.MultipartRequest('Post', uri);

    request.fields['title'] = "Static fields";

    var multipart = http.MultipartFile('image', stream, length);

    request.files.add(multipart);

    var response = await request.send();
    // print(response.stream.toString());
    if (response.statusCode == 200) {
      setState(() {
        showSpinner = false;
      });
      print('image uploaded');
      print(response.stream.toString());
    } else {
      print('failed');
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  getImage();
                },
                child: Container(
                  child: _image == null
                      ? Center(
                          child: Text('Pick Image'),
                        )
                      : Container(
                          child: Image.file(
                            File(_image!.path).absolute,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              GestureDetector(
                onTap: () {
                  uploadImage();
                },
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.green,
                  child: Center(child: Text('Upload')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
