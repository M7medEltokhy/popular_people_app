import 'package:bloc/bloc.dart';
import 'package:itproject/data/models/details_model.dart';
import 'package:itproject/data/remote_data_source/detials_controller.dart';
import 'package:meta/meta.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());
  DetailsModel? detailsModel;
  getDetails({required String id})async{
    emit(DetailsLoading());
    detailsModel = await DetialsController.getDetails(id: id);
    if(detailsModel!=null){
      emit(DetailsSuccess());
    }else{
      emit(DetailsError());
    }
  }
}
