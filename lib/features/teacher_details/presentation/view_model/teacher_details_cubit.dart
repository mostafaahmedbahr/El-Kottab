
import 'package:el_kottab/features/teacher_details/data/repos/teacher_details_repo.dart';
import 'package:el_kottab/features/teacher_details/presentation/view_model/teacher_details_states.dart';

import '../../../../main_imports.dart';

class TeacherDetailsCubit extends Cubit<TeacherDetailsStates> {
  TeacherDetailsCubit(this.teacherDetailsRepo) : super(TeacherDetailsInitState());

  TeacherDetailsRepo? teacherDetailsRepo;
  static TeacherDetailsCubit get(context) => BlocProvider.of(context);




}