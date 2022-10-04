import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'image_upload_show_event.dart';
part 'image_upload_show_state.dart';

class ImageUploadShowBloc
    extends Bloc<ImageUploadShowEvent, ImageUploadShowState> {
  ImageUploadShowBloc() : super(ImageUploadShowInitial()) {
    on<DisplayImageUpload>((event, emit) {
      emit(ImageUploadShowLoading());
      final imageName = event.imageName;
      final imagePath = event.imagePath;

      if (imageName.isNotEmpty) {
        
        emit(ImageUploadShowLoaded(imageName, imagePath));
      } else {
        emit(const ImageUploadShowFailure());
      }
    });

    on<RemoveImageUpload>((event, emit) {
      emit(ImageUploadShowLoading());

      emit(const ImageUploadShowRemoved());
    });
  }
}
