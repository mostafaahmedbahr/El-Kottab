
import 'package:el_kottab/features/teachers/presentation/view_model/teachers_states.dart';

import '../../../../main_imports.dart';
import '../../data/repos/teachers_repo.dart';

class TeachersCubit extends Cubit<TeachersStates> {
  TeachersCubit(this.teachersRepo) : super(TeachersInitState());

  TeachersRepo? teachersRepo;

  static TeachersCubit get(context) => BlocProvider.of(context);


  int buttonValue = 0;

  final PageController pageController = PageController();

  void updateButtonValue(int value) {
    buttonValue = value;
    pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    emit(TeachersButtonChangedState());
  }

  void onPageChanged(int index) {
    buttonValue = index;
    emit(TeachersButtonChangedState());
  }

}