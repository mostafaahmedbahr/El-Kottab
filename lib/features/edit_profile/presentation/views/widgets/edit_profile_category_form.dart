// import '../../../../../main_imports.dart';
// import '../../../../profile/presentation/view_model/profile_cubit.dart';
// import '../../../../register/presentation/view_model/register_cubit.dart';
// import '../../../../register/presentation/view_model/register_states.dart';
// import '../../view_model/edit_profile_info_cubit.dart';
// import '../../view_model/edit_profile_info_states.dart';
//
// class EditProfileCategoryForm extends StatefulWidget {
//   const EditProfileCategoryForm({super.key});
//
//   @override
//   State<EditProfileCategoryForm> createState() =>
//       _EditProfileCategoryFormState();
// }
//
// class _EditProfileCategoryFormState
//     extends State<EditProfileCategoryForm> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final registerCubit = context.read<RegisterCubit>();
//       final editPersonalInfoCubit = EditProfileInfoCubit.get(context);
//       final profile = context.read<ProfileCubit>().profileModel;
//
//       registerCubit.getAllCategories();
//
//       /// لو عندي بروفايل فيه دولة ومدينة → نعرضهم
//       if (profile != null) {
//         editPersonalInfoCubit.initDateControllers(profile);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<EditProfileInfoCubit, EditProfileInfoStates>(
//       buildWhen: (previous, current){
//         return current is GetAllCategoriesLoadingState || current is GetCountriesDataErrorState || current is GetCountriesDataSuccessState;
//       },
//       builder: (context, editState) {
//         final editPersonalInfoCubit = EditProfileInfoCubit.get(context);
//         final profile = context.read<ProfileCubit>().profileModel;
//
//         return BlocConsumer<RegisterCubit, RegisterStates>(
//           listener: (context, state) {},
//           builder: (context, state) {
//             final registerCubit = context.read<RegisterCubit>();
//
//             return Column(
//               children: [
//                 verticalSpace(20),
//
//                 /// Country Autocomplete
//                 state is GetCountriesDataLoadingState
//                     ? const Center(child: CustomLoading())
//                     : state is GetCountriesDataErrorState
//                     ? Center(child: Text(state.message.toString()))
//                     : Autocomplete<Data>(
//                   displayStringForOption: (Data option) =>
//                   option.nameEn ?? '',
//                   optionsBuilder:
//                       (TextEditingValue textEditingValue) {
//                     if (textEditingValue.text.isEmpty) {
//                       return registerCubit.countriesModel?.data ??
//                           const Iterable<Data>.empty();
//                     }
//                     return registerCubit.countriesModel?.data
//                         ?.where(
//                           (Data option) {
//                         return option.nameEn!
//                             .toLowerCase()
//                             .contains(textEditingValue.text
//                             .toLowerCase());
//                       },
//                     ) ??
//                         const Iterable<Data>.empty();
//                   },
//                   onSelected: (Data selection) {
//                     editPersonalInfoCubit.countryController.text =
//                         selection.nameEn ?? '';
//                     editPersonalInfoCubit.countryId = selection.id;
//
//                     // ✅ Clear city data FIRST
//                     editPersonalInfoCubit.cityController.clear();
//                     editPersonalInfoCubit.cityId = null;
//
//                     if (selection.id != null) {
//                       registerCubit.getCitiesData(
//                           countryId: selection.id.toString());
//                     }
//                     setState(() {});
//                   },
//                   fieldViewBuilder: (context,
//                       textEditingController,
//                       focusNode,
//                       onFieldSubmitted) {
//                     // ✅ Initialize with profile data
//                     if (textEditingController.text.isEmpty) {
//                       if (profile?.data?.country != null) {
//                         textEditingController.text =
//                         profile!.data!.country!;
//                       }
//                     }
//
//                     return CustomTextFormField(
//                       controller: textEditingController,
//                       focusNode: focusNode,
//                       hintText: AppStrings.country,
//                       prefixIcon: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: SvgPicture.asset(SvgImages.location),
//                       ),
//                       onChanged: (value) {
//                         editPersonalInfoCubit
//                             .countryController.text = value;
//                       },
//                     );
//                   },
//                 ),
//
//                 verticalSpace(20),
//
//                 /// City Autocomplete - ONLY ONE WIDGET
//                 BlocBuilder<RegisterCubit, RegisterStates>(
//                   builder: (context, state) {
//                     // ✅ Check if we have profile city data to show immediately
//                     final bool hasProfileCity = profile?.data?.city != null &&
//                         profile!.data!.city!.isNotEmpty;
//
//                     // ✅ Show loading when fetching cities for NEW country selection
//                     if (state is GetCitiesDataLoadingState) {
//                       return const Center(
//                           child: CustomLoading(color: AppColors.mainColor));
//                     }
//
//                     // ✅ Show error state if cities API failed
//                     else if (state is GetCitiesDataErrorState) {
//                       return Text(state.message.toString());
//                     }
//
//                     // ✅ Show cities autocomplete when we have cities data
//                     else if (registerCubit.citiesModel != null &&
//                         registerCubit.citiesModel!.cities != null &&
//                         registerCubit.citiesModel!.cities!.isNotEmpty) {
//                       return Autocomplete<Cities>(
//                         displayStringForOption: (Cities city) =>
//                         city.nameEn,
//                         optionsBuilder: (TextEditingValue textEditingValue) {
//                           if (textEditingValue.text.isEmpty) {
//                             return registerCubit.citiesModel!.cities!;
//                           }
//                           return registerCubit.citiesModel!.cities!.where(
//                                 (Cities city) {
//                               return city.nameEn
//                                   .toLowerCase()
//                                   .contains(
//                                   textEditingValue.text.toLowerCase());
//                             },
//                           );
//                         },
//                         onSelected: (Cities city) {
//                           editPersonalInfoCubit.cityController.text =
//                               city.nameEn;
//                           editPersonalInfoCubit.cityId = city.id;
//                           setState(() {});
//                         },
//                         fieldViewBuilder: (context, textEditingController,
//                             focusNode, onFieldSubmitted) {
//                           // ✅ Initialize with profile city data ONLY if country matches
//                           if (textEditingController.text.isEmpty &&
//                               hasProfileCity &&
//                               profile.data!.countryId == editPersonalInfoCubit.countryId) {
//                             textEditingController.text = profile.data!.city!;
//                           }
//
//                           return CustomTextFormField(
//                             controller: textEditingController,
//                             focusNode: focusNode,
//                             hintText: AppStrings.city,
//                             prefixIcon: Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: SvgPicture.asset(SvgImages.location),
//                             ),
//                             onChanged: (value) {
//                               editPersonalInfoCubit.cityController.text = value;
//                             },
//                           );
//                         },
//                       );
//                     }
//
//                     // ✅ Show message when no cities available
//                     else if (editPersonalInfoCubit.countryId != null) {
//                       return Text(
//                         AppStrings.noCitiesAvailableForSelectedCountry,
//                         style: TextStyle(
//                           color: AppColors.greyColor1,
//                           fontSize: 14,
//                         ),
//                       );
//                     }
//
//                     // ✅ Show profile city ONLY if country matches the current selected country
//                     else if (hasProfileCity &&
//                         profile.data!.countryId == editPersonalInfoCubit.countryId) {
//                       return CustomTextFormField(
//                         controller: editPersonalInfoCubit.cityController,
//                         hintText: AppStrings.city,
//                         prefixIcon: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: SvgPicture.asset(SvgImages.location),
//                         ),
//                         onChanged: (value) {
//                           editPersonalInfoCubit.cityController.text = value;
//                         },
//                       );
//                     }
//
//                     // ✅ Hide city field when no country selected
//                     else {
//                       return const SizedBox.shrink();
//                     }
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
// }