import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:dulio/app_theme.dart';
import 'package:image_picker/image_picker.dart';
import 'ar/ar.dart';

// Create two widgets that allow the user to open an image from the gallery

class DulioCore extends StatefulWidget {
  const DulioCore({Key? key}) : super(key: key);

  @override
  _DulioCoreState createState() => _DulioCoreState();
}

class _DulioCoreState extends State<DulioCore> {
  XFile? _imageFile;
  CameraDescription? firstCamera;

  @override
  void initState() {
    super.initState();
    main();
  }

  Future<void> main() async {
    // Ensure that plugin services are initialized so that `availableCameras()`
    // can be called before `runApp()`
    WidgetsFlutterBinding.ensureInitialized();

    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    firstCamera = cameras.first;
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = pickedFile;
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
                onPressed: () async {
                  await _getImage();
                  if (_imageFile != null && firstCamera != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ar_dulio_core(camera: firstCamera!),
                      ),
                    );
                  }
                },
                child: const Text('Select Image'),
              ),
            ),
          ),
        ));
  }
}
