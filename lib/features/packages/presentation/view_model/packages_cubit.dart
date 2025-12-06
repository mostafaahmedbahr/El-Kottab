import 'package:el_kottab/features/packages/presentation/view_model/packages_states.dart';

import '../../../../main_imports.dart';

class PackagesCubit extends Cubit<PackagesStates> {
  PackagesCubit() : super(PackagesInitState());

  static PackagesCubit get(context) => BlocProvider.of(context);



}