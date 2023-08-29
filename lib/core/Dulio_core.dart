import 'package:flutter/material.dart';
import 'package:dulio/app_theme.dart';
import 'package:image_picker/image_picker.dart';

// Create two widgets that allow the user to open an image from the gallery

class Dulio_core extends StatefulWidget {
  const Dulio_core({Key? key}) : super(key: key);

  @override
  _Dulio_coreState createState() => _Dulio_coreState();
}

class _Dulio_coreState extends State<Dulio_core> {
  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dulio Core',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.nearlyWhite,
          ),
        ),
        backgroundColor: AppTheme.nearlyBlack,
        iconTheme: const IconThemeData(
            color: AppTheme
                .nearlyWhite), // added this line to change the back arrow color
      ),
      body: Material(
        color: AppTheme.nearlyBlack,
        child: Center(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ElevatedButton(
              onPressed: _getImage,
              child: const Text('Select Image'),
            ),
          ),
        ),
      ),
    );
  }
}
