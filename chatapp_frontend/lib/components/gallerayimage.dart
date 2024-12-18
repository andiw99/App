import 'dart:io';

import 'package:chatapp_frontend/src/constants.dart';
import 'package:flutter/material.dart';


typedef MyCallback = void Function(bool? value);

class galleryImageWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.loose, children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: Image(
                              fit: BoxFit.cover,
                              image: FileImage(image)),
                        ),
                        AnimatedOpacity(
                          opacity: checked
                              ? 0.25
                              : 0.0, // Opacity transitions.
                          duration: const Duration(
                              milliseconds: 250), // Duration of the fade.
                          child: Container(
                            color: Colors.grey, // Full grey color.
                          ),
                        ),
                        Positioned(
                          top: -8,
                          right: -8,
                          child: Checkbox(
                            value: checked,
                            onChanged: onPress,
                          ),
                        ),
                      ]);
  }
}