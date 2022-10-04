part of 'image_upload_show_bloc.dart';

abstract class ImageUploadShowEvent extends Equatable {
  const ImageUploadShowEvent();

  @override
  List<Object> get props => [];
}

class DisplayImageUpload extends ImageUploadShowEvent
{
  final String imageName;
  final String imagePath;

  const DisplayImageUpload(this.imageName,this.imagePath);
}

class RemoveImageUpload extends ImageUploadShowEvent
{

  const RemoveImageUpload();
}