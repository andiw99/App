// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

import 'package:chatapp_frontend/main.dart';
import 'package:chatapp_frontend/src/constants.dart';
import 'package:chatapp_frontend/src/functions.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;


typedef checkboxCallback = void Function(bool? value);
typedef clickCallback = void Function(BuildContext context, String imageName);


class galleryImageWidget extends StatefulWidget {
  const galleryImageWidget({
    Key? key,
    required this.image,
    required this.onPress,
    required this.onClick,
    this.checked = false,
  }) : super(key: key);

  final File image;
  final checkboxCallback onPress;   // Function that gets called when the checkbox is clicked (tbf this should probably not be part of this component)
  final clickCallback onClick; // Function that gets called when the picture is clicked
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
          widget.onClick(context, imageName);
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
