import 'package:el_kottab/features/teachers/data/models/add_to_fav_model.dart';
import 'package:el_kottab/features/teachers/data/models/all_teachers_model.dart';

import '../../data/models/fav_teachers_model.dart';

abstract class TeachersStates{}

class TeachersInitState extends TeachersStates{}

class TeachersButtonChangedState extends TeachersStates {}


class GetAllTeachersLoadingState extends TeachersStates {}
class GetAllTeachersErrorState extends TeachersStates {
  final String error;
  GetAllTeachersErrorState(this.error);

}
class GetAllTeachersSuccessState extends TeachersStates {
  final AllTeachersModel allTeachersModel;
  GetAllTeachersSuccessState(this.allTeachersModel);
}



class AddTeachersFavLoadingState extends TeachersStates {}
class AddTeachersFavErrorState extends TeachersStates {
  final String error;
  AddTeachersFavErrorState(this.error);

}
class AddTeachersFavSuccessState extends TeachersStates {
  final dynamic addToFavModel;
  AddTeachersFavSuccessState(this.addToFavModel);

}


class GetAllFavTeachersLoadingState extends TeachersStates {}
class GetAllFavTeachersErrorState extends TeachersStates {
  final String error;
  GetAllFavTeachersErrorState(this.error);

}
class GetAllFavTeachersSuccessState extends TeachersStates {
  final FavTeachersModel favTeachersModel;
  GetAllFavTeachersSuccessState(this.favTeachersModel);
}

class TeachersSearchState extends TeachersStates {}

class TeachersFilterAppliedState extends TeachersStates {}
class TeachersFilterResetState extends TeachersStates {}
