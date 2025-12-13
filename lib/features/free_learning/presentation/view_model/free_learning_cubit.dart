import 'package:el_kottab/features/free_learning/presentation/view_model/free_learning_states.dart';

import '../../../../main_imports.dart';
import '../../data/repos/free_learning_repo.dart';

class FreeLearningCubit extends Cubit<FreeLearningStates> {
  FreeLearningCubit(this.freeLearningRepo) : super(FreeLearningInitState());

  FreeLearningRepo? freeLearningRepo;

  static FreeLearningCubit get(context) => BlocProvider.of(context);


}