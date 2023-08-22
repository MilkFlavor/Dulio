import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  runApp(Dulio_ar());
}

//Dulio_ar() is the main class for the AR feature
class Dulio_ar extends StatefulWidget {
  const Dulio_ar({Key? key}) : super(key: key);

  @override
  _Dulio_arState createState() => _Dulio_arState();
}

class _Dulio_arState extends State<Dulio_ar> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    availableCameras().then((cameras) {
      _cameras = cameras;
      controller = CameraController(_cameras[0], ResolutionPreset.max);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              // Handle access errors here.
              break;
            default:
              // Handle other errors here.
              break;
          }
        }
      });
    });
  }

  late List<CameraDescription> _cameras;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }
}
