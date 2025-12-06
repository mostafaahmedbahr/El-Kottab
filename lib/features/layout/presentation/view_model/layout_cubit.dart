  import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/features/home/presentation/views/home_view.dart';
import 'package:el_kottab/features/teachers/presentation/views/teachers_view.dart';

import '../../../../main_imports.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../../../sessions/presentation/views/sessions_view.dart';
import 'layout_states.dart';


class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  static int pageIndex = 0;



  List screens = [
    HomeView(),
    TeachersView(),
    SessionsView(),
    ProfileView(),

  ];


  changeBottomNav(index ,context) {
    pageIndex = index;
    emit(ChangeBottomNavState());
  }

  DateTime? _lastPressed;
  void onPopInvoked(bool didPop,BuildContext context) {
    if (didPop) {
      return;
    }
    DateTime now = DateTime.now();
    if (_lastPressed == null || now.difference(_lastPressed!) > const Duration(seconds: 2)) {
      _lastPressed = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(LangKeys.exit.tr()),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      SystemNavigator.pop();
    }
  }
}