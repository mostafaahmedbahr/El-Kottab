

import 'package:el_kottab/features/profile/presentation/view_model/profile_states.dart';

import '../../../../main_imports.dart';
import '../../data/repos/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this.profileRepo) : super(ProfileInitState());

  ProfileRepo? profileRepo;
  static ProfileCubit get(context) => BlocProvider.of(context);






}