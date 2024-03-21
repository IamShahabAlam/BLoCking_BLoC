import 'package:bloc_app/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_app/bloc/image_picker/image_picker_state.dart';
import 'package:bloc_app/utils/image_picker_utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(_camerCapture);
    on<PickFromGallery>(_pickFromGallery);
  }

  _camerCapture(ImagePickerEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  _pickFromGallery(PickFromGallery event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.pickFromGallery();
    emit(state.copyWith(file: file));
  }
}
