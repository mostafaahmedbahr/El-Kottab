
import 'package:el_kottab/features/balance/presentation/view_model/balance_states.dart';

import '../../../../main_imports.dart';

class BalanceCubit extends Cubit<BalanceStates> {
  BalanceCubit() : super(BalanceInitState());

  static BalanceCubit get(context) => BlocProvider.of(context);


  }