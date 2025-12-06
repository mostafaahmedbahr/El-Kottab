import 'package:el_kottab/features/sessions/presentation/view_model/sessions_states.dart';

import '../../../../main_imports.dart';
import '../../data/repos/sessions_repo.dart';

class   SessionsCubit extends Cubit<SessionsStates> {
  SessionsCubit(this.sessionsRepo) : super(SessionsInitState());
  SessionsRepo? sessionsRepo;



}