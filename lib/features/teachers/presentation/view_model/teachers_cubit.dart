
import 'package:el_kottab/features/teachers/data/models/add_to_fav_model.dart';
import 'package:el_kottab/features/teachers/data/models/all_teachers_model.dart';
import 'package:el_kottab/features/teachers/data/models/fav_teachers_model.dart';
import 'package:el_kottab/features/teachers/data/models/remove_teacher_from_fav_model.dart';
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


  AllTeachersModel? allTeachersModel;
  Future<void> getAllTeachers({bool loading = true}) async {
    if (loading) emit(GetAllTeachersLoadingState());

    var result = await teachersRepo!.getAllTeachers();
    result.fold(
          (failure) => emit(GetAllTeachersErrorState(failure.errMessage)),
          (data) {
        allTeachersModel = data;
        filteredAllTeachers = data.data ?? [];
        emit(GetAllTeachersSuccessState(data));
      },
    );
  }

  AddToFavModel? addToFavModel;
  Future<void> addToFav({required int teacherId})
  async {
    emit(AddTeachersFavLoadingState());
    var result = await teachersRepo!.addToFav(teacherId: teacherId);
    return result.fold((failure) {
      emit(AddTeachersFavErrorState(failure.errMessage));
    }, (data) async {
      addToFavModel = data;
      emit(AddTeachersFavSuccessState(data));
    });
  }

  RemoveTeacherFromFavModel? removeTeacherFromFavModel;
  Future<void> removeTeacherFromFav({required int teacherId})
  async {
    emit(AddTeachersFavLoadingState());
    var result = await teachersRepo!.removeTeacherFromFav(teacherId: teacherId);
    return result.fold((failure) {
      emit(AddTeachersFavErrorState(failure.errMessage));
    }, (data) async {
      removeTeacherFromFavModel = data;
      emit(AddTeachersFavSuccessState(data));
    });
  }


  FavTeachersModel? favTeachersModel;
  Future<void> getFavTeachers({bool loading = true}) async {
    if (loading) emit(GetAllFavTeachersLoadingState());

    var result = await teachersRepo!.getFavTeachers();
    result.fold(
          (failure) => emit(GetAllFavTeachersErrorState(failure.errMessage)),
          (data) {
        favTeachersModel = data;
        filteredFavTeachers = data.data ?? [];
        emit(GetAllFavTeachersSuccessState(data));
      },
    );
  }




  final TextEditingController searchController = TextEditingController();

  List<AllTeachersData> filteredAllTeachers = [];
  List<FavData> filteredFavTeachers = [];



  void searchByName(String query) {
    final all = allTeachersModel?.data ?? [];
    final fav = favTeachersModel?.data ?? [];

    List<AllTeachersData> searchAll = all.where((teacher) {
      return teacher.name!
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();

    filteredAllTeachers = searchAll;
    filteredFavTeachers = fav.where((teacher) {
      return teacher.name!
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();

    applyFilters();
  }




  double? selectedRate;
  dynamic selectedCategoryId;

  void selectRatingFun(value)
  {
    selectedRate = value;
    emit(TeachersFilterAppliedState());
  }
  void applyFilters() {
    List<AllTeachersData> all = allTeachersModel?.data ?? [];
    List<FavData> fav = favTeachersModel?.data ?? [];

    filteredAllTeachers = all.where((teacher) {
      final matchesRate = selectedRate == null ||
          (teacher.rate ?? 0) >= selectedRate!;

      final matchesCategory = selectedCategoryId == null ||
          teacher.category == selectedCategoryId;

      return matchesRate && matchesCategory;
    }).toList();

    filteredFavTeachers = fav.where((teacher) {
      final matchesRate = selectedRate == null ||
          (teacher.rate ?? 0) >= selectedRate!;

      final matchesCategory = selectedCategoryId == null ||
          teacher.category == selectedCategoryId;

      return matchesRate && matchesCategory;
    }).toList();

    emit(TeachersFilterAppliedState());
  }

  void resetFilters() {
    selectedRate = null;
    selectedCategoryId = null;

    filteredAllTeachers = allTeachersModel?.data ?? [];
    filteredFavTeachers = favTeachersModel?.data ?? [];

    emit(TeachersFilterResetState());
  }


}