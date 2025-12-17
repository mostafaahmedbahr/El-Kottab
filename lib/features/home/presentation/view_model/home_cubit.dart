

import 'package:el_kottab/features/home/data/models/best_teachers_model.dart';

import '../../../../main_imports.dart';
import '../../data/models/home_banners_model.dart';
import '../../data/repos/home_repo.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepo) : super(HomeInitState());

  HomeRepo? homeRepo;
  static HomeCubit get(context) => BlocProvider.of(context);


  int currentSliderIndex = 0;
  changeHomeSliderImages(index)
  {
    currentSliderIndex = index;
    emit(ChangeHomeSliderImageState());
  }

  // List<String> sliderImagesList = ["https://play-lh.googleusercontent.com/dwD9R3_pf-agihdKTYS95-YKV58l5L_Kor_QsMMpTmY6MrQQgi_Mc5qKAtIP1Ajycg" , "https://play-lh.googleusercontent.com/8s6h3OW1xSEghokWabjAvT4zuYjsJG5vi30SGhZLpgLfqsvIqXzPSy-5lECyfcUOi58"];



  HomeBannersModel? homeBannersModel;
  Future<void> getHomeBanners()
  async {
    emit(GetHomeSliderLoadingState());
    var result = await homeRepo!.getHomeBanners();
    return result.fold((failure) {
      emit(GetHomeSliderErrorState(failure.errMessage));
    }, (data) async {
      homeBannersModel = data;
      emit(GetHomeSliderSuccessState(data));
    });
  }



  BestTeachersModel? bestTeachersModel;
  Future<void> getBestTeachers()
  async {
    emit(GetBestTeachersLoadingState());
    var result = await homeRepo!.getBestTeachers();
    return result.fold((failure) {
      emit(GetBestTeachersErrorState(failure.errMessage));
    }, (data) async {
      bestTeachersModel = data;
      emit(GetBestTeachersSuccessState(data));
    });
  }
}