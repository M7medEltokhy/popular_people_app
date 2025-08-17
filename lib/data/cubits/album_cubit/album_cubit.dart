import 'package:bloc/bloc.dart';
import 'package:itproject/data/models/Album_model.dart';
import 'package:itproject/data/remote_data_source/album_controller.dart';
import 'package:meta/meta.dart';

part 'album_state.dart';

class AlbumCubit extends Cubit<AlbumState> {
  AlbumCubit() : super(AlbumInitial());
  AlbumModel? albumModel;

  getAlbum({required String id}) async {
    emit(AlbumLoading());
    albumModel = await AlbumController.getAlbum(id: id);
    if (albumModel != null) {
      emit(AlbumSuccess());
    } else {
      emit(AlbumError());
    }
  }
}
