import 'package:el_kottab/features/settings/data/models/terms_and_conditions_model.dart';
import 'package:el_kottab/features/settings/presentation/view_model/settings_states.dart';

import '../../../../main_imports.dart';
import '../../data/repos/settings_repo.dart';


class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit(this.settingsRepo) : super(SettingsInitState());

  SettingsRepo? settingsRepo;
  static SettingsCubit get(context) => BlocProvider.of(context);



  TermsAndConditionsModel? termsAndConditionsModel;
  Future<void> getTermsAndConditions()
  async {
    emit(GetTermsAndConditionsDataLoadingState());
    var result = await settingsRepo!.getTermsAndConditions();
    return result.fold((failure) {
      emit(GetTermsAndConditionsDataErrorState(failure.errMessage));
    }, (data) async {
      termsAndConditionsModel = data;
      emit(GetTermsAndConditionsDataSuccessState(data));
    });
  }


}