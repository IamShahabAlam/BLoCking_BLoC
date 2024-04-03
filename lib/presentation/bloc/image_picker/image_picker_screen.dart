import 'dart:io';

import 'package:bloc_app/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_app/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_app/bloc/image_picker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreen();
}

class _ImagePickerScreen extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<ImagePickerBloc, ImagePickerState>(builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            state.file == null ? const SizedBox.shrink() : Image.file(File(state.file!.path.toString())),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<ImagePickerBloc>().add(CameraCapture());
                  },
                  icon: const Icon(Icons.camera_outlined),
                  iconSize: 50.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 25),
                IconButton(
                  onPressed: () {
                    context.read<ImagePickerBloc>().add(PickFromGallery());
                  },
                  icon: const Icon(Icons.photo_library_outlined),
                  iconSize: 50.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            const SizedBox(height: 40.0),
          ],
        );
      }),
    );
  }
}
