import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// A screen that allows users to take a picture using a given camera.
class ar_dulio_core extends StatefulWidget {
  const ar_dulio_core({
    super.key,
    required this.camera,
    required this.imagePath,
  });

  final CameraDescription camera;
  final String imagePath;

  @override
  ar_dulio_coreState createState() => ar_dulio_coreState();
}

class ar_dulio_coreState extends State<ar_dulio_core> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  double _opacity = 0.5;
  double _scale = 1.0;
  double _rotation = 0.0;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.max,
      // No audio recording necessary.
      enableAudio: false,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  void _rotateImage() {
    setState(() {
      _rotation += 90.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a Stack to show the image on top of the camera preview.
      body: Stack(
        children: [
          // Show the camera preview.
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the preview.
                return Center(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      child: CameraPreview(_controller),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                  ),
                );
              } else {
                // Otherwise, display a loading indicator.
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          // Show the image on top of the camera preview.
          Positioned(
            top: null,
            bottom: null,
            left: null,
            right: null,
            height: null,
            width: null,
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Opacity(
                    opacity: _opacity, // Change the opacity value here
                    child: GestureDetector(
                      onScaleUpdate: (details) {
                        setState(() {
                          _scale = details.scale;
                          _rotation = details.rotation;
                        });
                      },
                      child: InteractiveViewer(
                        constrained: false,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: RotationTransition(
                                turns: AlwaysStoppedAnimation(_rotation / 360),
                                child: Transform.scale(
                                  scale: _scale,
                                  child: Image.file(
                                    File(widget.imagePath),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Slider(
                  value: _opacity,
                  min: 0,
                  max: 1,
                  onChanged: (value) {
                    setState(() {
                      _opacity = value;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: _rotateImage,
                  child: Icon(Icons.rotate_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
