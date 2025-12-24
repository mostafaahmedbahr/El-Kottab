import 'package:el_kottab/features/free_learning/presentation/view_model/free_learning_states.dart';

import '../../../../main_imports.dart';
import '../../data/models/random_teacher_model.dart';
import '../../data/repos/free_learning_repo.dart';

class FreeLearningCubit extends Cubit<FreeLearningStates> {
  FreeLearningCubit(this.freeLearningRepo) : super(FreeLearningInitState());

  FreeLearningRepo? freeLearningRepo;

  static FreeLearningCubit get(context) => BlocProvider.of(context);


  RandomTeacherModel? randomTeacherModel;
  Future<void> getRandomTeacher()
  async {
    emit(GetRandomTeacherLoadingState());
    var result = await freeLearningRepo!.getRandomTeacher();
    return result.fold((failure) {
      emit(GetRandomTeacherErrorState(failure.errMessage));
    }, (data) async {
      randomTeacherModel = data;
      emit(GetRandomTeacherSuccessState(data));
    });
  }
}