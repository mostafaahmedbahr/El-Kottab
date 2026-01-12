import 'package:el_kottab/features/teachers/data/models/add_to_fav_model.dart';
import 'package:el_kottab/features/teachers/data/models/all_teachers_model.dart';
import 'package:el_kottab/features/teachers/data/models/fav_teachers_model.dart';
import 'package:el_kottab/features/teachers/data/models/remove_teacher_from_fav_model.dart';
import 'package:el_kottab/features/teachers/presentation/view_model/teachers_states.dart';

import '../../../../main_imports.dart';
import '../../data/repos/teachers_repo.dart';

class TeachersCubit extends Cubit<TeachersStates> {
  TeachersCubit(this.teachersRepo) : super(TeachersInitState());

  final TeachersRepo? teachersRepo;

  static TeachersCubit get(context) => BlocProvider.of(context);

  // ---------------- Tabs ----------------
  int buttonValue = 0;
  final PageController pageController = PageController();

  void updateButtonValue(int value) {
    buttonValue = value;
    pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    emit(TeachersButtonChangedState());
  }

  void onPageChanged(int index) {
    buttonValue = index;
    emit(TeachersButtonChangedState());
  }

  // ---------------- Data ----------------
  AllTeachersModel? allTeachersModel;
  FavTeachersModel? favTeachersModel;

  List<AllTeachersData> allTeachers = [];
  List<FavData> favTeachers = [];

  /// القوائم المعروضة بعد البحث والفلترة
  List<AllTeachersData> displayedAllTeachers = [];
  List<FavData> displayedFavTeachers = [];

  // ---------------- Get Data ----------------
  Future<void> getAllTeachers({bool loading = true}) async {
    if (loading) emit(GetAllTeachersLoadingState());

    var result = await teachersRepo!.getAllTeachers();
    result.fold(
      (failure) => emit(GetAllTeachersErrorState(failure.errMessage)),
      (data) {
        allTeachersModel = data;
        allTeachers = data.data ?? [];

        displayedAllTeachers = List.from(allTeachers);
        emit(GetAllTeachersSuccessState(data));
      },
    );
  }

  Future<void> getFavTeachers({bool loading = true}) async {
    if (loading) emit(GetAllFavTeachersLoadingState());

    var result = await teachersRepo!.getFavTeachers();
    result.fold(
      (failure) => emit(GetAllFavTeachersErrorState(failure.errMessage)),
      (data) {
        favTeachersModel = data;
        favTeachers = data.data ?? [];

        displayedFavTeachers = List.from(favTeachers);
        emit(GetAllFavTeachersSuccessState(data));
      },
    );
  }

  // ---------------- Favorites ----------------
  AddToFavModel? addToFavModel;
  RemoveTeacherFromFavModel? removeTeacherFromFavModel;

  Future<void> addToFav({required int teacherId}) async {
    emit(AddTeachersFavLoadingState());
    var result = await teachersRepo!.addToFav(teacherId: teacherId);
    result.fold(
      (failure) => emit(AddTeachersFavErrorState(failure.errMessage)),
      (data) {
        addToFavModel = data;
        getFavTeachers(loading: false);
        emit(AddTeachersFavSuccessState(data));
      },
    );
  }

  Future<void> removeTeacherFromFav({required int teacherId}) async {
    emit(AddTeachersFavLoadingState());
    var result = await teachersRepo!.removeTeacherFromFav(teacherId: teacherId);
    result.fold(
      (failure) => emit(AddTeachersFavErrorState(failure.errMessage)),
      (data) {
        removeTeacherFromFavModel = data;
        getFavTeachers(loading: false);
        emit(AddTeachersFavSuccessState(data));
      },
    );
  }

  // ---------------- Search & Filters ----------------
  final TextEditingController searchController = TextEditingController();
  String currentSearchQuery = '';

  String? selectedCategory;




  void searchByName(String query) {
    currentSearchQuery = query.trim();
    _applySearchAndFilter();
    emit(TeachersSearchAppliedState());
  }

  void _applySearchAndFilter() {
    final queryLower = currentSearchQuery.toLowerCase();
    // ------------------ All Teachers ------------------
    displayedAllTeachers = allTeachers.where((teacher) {
      final matchesSearch = currentSearchQuery.isEmpty ||
          (teacher.name?.toLowerCase().contains(queryLower) ?? false);

      final matchesRate = selectedRate == null ||
          (teacher.rate ?? 0) == selectedRate!;

      final matchesCategory = selectedCategory == null ||
          (teacher.category != null && teacher.category == selectedCategory.toString());

      return matchesSearch && matchesRate && matchesCategory;
    }).toList();

    // ------------------ Favorite Teachers ------------------
    displayedFavTeachers = favTeachers.where((teacher) {
      final matchesSearch = currentSearchQuery.isEmpty ||
          (teacher.name?.toLowerCase().contains(queryLower) ?? false);

      final matchesRate = selectedRate == null ||
          (teacher.rate ?? 0) == selectedRate!;

      final matchesCategory = selectedCategory == null ||
          (teacher.category != null && teacher.category == selectedCategory.toString());

      return matchesSearch && matchesRate && matchesCategory;
    }).toList();

    emit(TeachersFilterAppliedState());
  }



  int? selectedRate;

  void selectRating(double? value) {
    if (value != null) {
      selectedRate = value.round(); // Store as int
    } else {
      selectedRate = null;
    }
    _applySearchAndFilter();
  }

  void selectCategory(String? value) {
    selectedCategory = value;
    _applySearchAndFilter();
  }

  void resetSearchAndFilters() {
    searchController.clear();
    currentSearchQuery = '';
    selectedRate = null;
    selectedCategory = null;

    displayedAllTeachers = List.from(allTeachers);
    displayedFavTeachers = List.from(favTeachers);

    emit(TeachersFilterResetState());
  }

  // داخل TeachersCubit
  void applySearchAndFilter() {
    _applySearchAndFilter();
  }

}
