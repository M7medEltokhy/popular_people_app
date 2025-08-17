import 'package:bloc/bloc.dart';
import '../../models/popular_people_model.dart';
import '../../remote_data_source/popular_people_controller.dart';
import 'package:meta/meta.dart';

part 'popular_people_state.dart';

class PopularPeopleCubit extends Cubit<PopularPeopleState> {
  PopularPeopleCubit() : super(PopularPeopleInitial());

  PopularPeopleModel? popularPeopleModel;

  getData() async {
    emit(PopularPeopleLoading());
    popularPeopleModel = await PopularPeopleController.getPopularPeople();
    if (popularPeopleModel != null) {
      emit(PopularPeopleSuccess());
    } else {
      emit(PopularPeopleError());
    }
  }
}
