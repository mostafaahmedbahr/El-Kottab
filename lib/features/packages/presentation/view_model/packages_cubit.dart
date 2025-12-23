import 'package:el_kottab/features/packages/data/models/packages_model.dart';
import 'package:el_kottab/features/packages/data/repos/packages_repo.dart';
import 'package:el_kottab/features/packages/presentation/view_model/packages_states.dart';

import '../../../../core/utils/enums.dart';
import '../../../../main_imports.dart';

class PackagesCubit extends Cubit<PackagesStates> {
  PackagesCubit(this.packagesRepo) : super(PackagesInitState());
  PackagesRepo? packagesRepo;
  static PackagesCubit get(context) => BlocProvider.of(context);



  PackagesModel? packagesModel;
  Future<void> getAllPackages()
  async {
    emit(GetAllPackagesLoadingState());
    var result = await packagesRepo!.getAllPackages();
    return result.fold((failure) {
      emit(GetAllPackagesErrorState(failure.errMessage));
    }, (data) async {
      packagesModel = data;
      emit(GetAllPackagesSuccessState(data));
    });
  }


  Currency selectedCurrency = Currency.egp; // ✅ default

  void changeCurrency(Currency currency) {
    selectedCurrency = currency;
    emit(CurrencyChangedState(currency));
  }
}