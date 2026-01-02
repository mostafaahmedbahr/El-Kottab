import 'package:el_kottab/features/packages/data/models/packages_model.dart';
import 'package:el_kottab/features/packages/data/repos/packages_repo.dart';
import 'package:el_kottab/features/packages/presentation/view_model/packages_states.dart';

import '../../../../main_imports.dart';
import '../../data/models/subscribe_to_package_model.dart';

class PackagesCubit extends Cubit<PackagesStates> {
  PackagesCubit(this.packagesRepo) : super(PackagesInitState());
  PackagesRepo? packagesRepo;
  static PackagesCubit get(context) => BlocProvider.of(context);



  PackagesModel? packagesModel;
  Future<void> getAllPackages({required bool loading})
  async {
    if(loading==true){
      emit(GetAllPackagesLoadingState());
    }
    var result = await packagesRepo!.getAllPackages();
    return result.fold((failure) {
      emit(GetAllPackagesErrorState(failure.errMessage));
    }, (data) async {
      packagesModel = data;
      emit(GetAllPackagesSuccessState(data));
    });
  }

  String selectedCurrency = "EGP"; // القيمة الافتراضية
  void changeCurrency(String currency) {
    selectedCurrency = currency;
    emit(ChangeCurrencyState());
  }

  int? loadingPackageId;
  SubscribeToPackageModel? subscribeToPackageModel;
  Future<void> subscribeToPackage({required int packageId})
  async {
    loadingPackageId = packageId;
    emit(SubscribePackageLoadingState());
    var result = await packagesRepo!.subscribeToPackage(packageId: packageId);
    return result.fold((failure) {
      loadingPackageId = null;
      emit(SubscribePackageErrorState(failure.errMessage));
    }, (data) async {
      subscribeToPackageModel = data;
      loadingPackageId = null;
      emit(SubscribePackageSuccessState(data));
    });
  }
}