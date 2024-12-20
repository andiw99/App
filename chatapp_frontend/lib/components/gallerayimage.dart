import 'dart:io';
import 'dart:typed_data';

import 'package:chatapp_frontend/main.dart';
import 'package:chatapp_frontend/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

typedef MyCallback = void Function(bool? value);

class galleryImageWidget extends StatefulWidget {
  const galleryImageWidget({
    Key? key,
    required this.image,
    required this.onPress,
    this.checked = false,
  }) : super(key: key);

  final File image;
  final MyCallback onPress;
  final bool checked;

  @override
  State<galleryImageWidget> createState() => _galleryImageWidgetState();
}

class _galleryImageWidgetState extends State<galleryImageWidget> {
  Uint8List _fullImageBytes = Uint8List(0);

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.loose, children: [
      AspectRatio(
        aspectRatio: 1,
        child: Image(fit: BoxFit.cover, image: FileImage(widget.image)),
      ),
      GestureDetector(
        onTap: () async {
          String imageName = path.basename(widget.image.path);
          bool done = false;
          bool canceled = false;
          // final imageWidet =
          showDialog(
            context: context,
            builder: (context) => Dialog(
              shape: const RoundedRectangleBorder(),
              backgroundColor:
                  Colors.transparent, // Make the background transparent
              child: Center(
                child: Container(
                  width: 150, // Explicitly set the width of the dialog
                  height: 150, // Explicitly set the height of the dialog
                  decoration: const BoxDecoration(
                    color: Colors.white, // Semi-transparent background
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                      strokeWidth:
                          6.0, // Customize the thickness of the progress indicator
                    ),
                  ),
                ),
              ),
            ),
          ).then((value) {
            // If the state is not done
            print("done? = $done");
            if(!done) {
              canceled = true;
            }
          });
          final imageResponse = await restClient.downloadPicture(
              userMemoryClient.getToken(), imageName, downloadUrl: downloadFullImageUrl);
          setState(() {
            _fullImageBytes = imageResponse['FileBytes'];
            done = true;
            print("loaded..");
          });
          if(!canceled) {
            Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (context) => Dialog(
                      shape: const RoundedRectangleBorder(),
                      insetPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 0,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                              child: Image.memory(_fullImageBytes,
                                  width: double.infinity,
                                  fit: BoxFit.cover)),
                          Positioned(
                            top: 0.0,
                            right: 0.0,
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Icon(
                                size: 40,
                                Icons.close,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                // TextButton(
                //   onPressed: () => Navigator.of(context).pop(),
                //   child: const Text('Close'),
                // ),
                );
          }
        },
        child: AnimatedOpacity(
          opacity: widget.checked ? 0.25 : 0.0, // Opacity transitions.
          duration: const Duration(milliseconds: 250), // Duration of the fade.
          child: Container(
            color: Colors.grey, // Full grey color.
          ),
        ),
      ),
      Positioned(
        top: -8,
        right: -8,
        child: Checkbox(
          value: widget.checked,
          onChanged: widget.onPress,
        ),
      ),
    ]);
  }
}
