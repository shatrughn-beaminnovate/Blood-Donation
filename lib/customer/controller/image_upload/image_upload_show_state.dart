part of 'image_upload_show_bloc.dart';

abstract class ImageUploadShowState extends Equatable {
  const ImageUploadShowState();

  @override
  List<Object> get props => [];
}

class ImageUploadShowInitial extends ImageUploadShowState {}

class ImageUploadShowLoading extends ImageUploadShowState {}

class ImageUploadShowLoaded extends ImageUploadShowState {
  final String imageName;
  final String imagePath;

  const ImageUploadShowLoaded(this.imageName, this.imagePath);
}

class ImageUploadShowRemoved extends ImageUploadShowState {

  const ImageUploadShowRemoved();
}

class ImageUploadShowFailure extends ImageUploadShowState {
 

  const ImageUploadShowFailure();
}
