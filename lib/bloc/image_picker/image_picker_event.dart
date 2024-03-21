import 'package:equatable/equatable.dart';

class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();
  @override
  List<Object?> get props => throw [];
}

class CameraCapture extends ImagePickerEvent {}

class PickFromGallery extends ImagePickerEvent {}
