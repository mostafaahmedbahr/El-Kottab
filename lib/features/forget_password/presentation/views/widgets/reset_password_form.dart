//  import 'package:match_kora_app/features/forget_password/presentation/view_model/forget_password_states.dart';
//
// import '../../../../../main_importants.dart';
// import '../../view_model/forget_password_cubit.dart';
//
// class ResetPasswordForm extends StatelessWidget {
//   const ResetPasswordForm({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ResetPasswordCubit , ResetPasswordStates>(
//       builder: (context,state){
//         var resetPasswordCubit = context.read<ResetPasswordCubit>();
//         return Column(
//           children: [
//             verticalSpace(20),
//             CustomTextFormField(
//               controller:  resetPasswordCubit.newPassCon,
//               keyboardType: TextInputType.visiblePassword,
//               hintText: AppStrings.password,
//               prefixIcon: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: SvgPicture.asset(SvgImages.lock,colorFilter: ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn)),
//               ),
//               validator: (value) => MyValidators.passwordValidator(value),
//               suffixIcon: IconButton(
//                 color: AppColors.greyColor2,
//                 icon: resetPasswordCubit.isVisible
//                     ? const Icon(Icons.visibility_off,color: AppColors.blackColor,)
//                     : const Icon(Icons.visibility,color: AppColors.blackColor,),
//                 onPressed: () {
//                   resetPasswordCubit.changeSuffixIcon();
//                 },
//               ),
//
//               obscureText: resetPasswordCubit.isVisible,
//             ),
//             verticalSpace(20),
//             CustomTextFormField(
//               controller:  resetPasswordCubit.newPassConfirmationCon,
//               keyboardType: TextInputType.visiblePassword,
//               hintText: AppStrings.confirmPassword,
//               prefixIcon: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: SvgPicture.asset(SvgImages.lock,colorFilter: ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn)),
//               ),
//               validator: (String? value) {
//                 return MyValidators.repeatPasswordValidator(
//                   value: value,
//                   password: resetPasswordCubit.newPassCon.text,
//                 );
//               },
//               suffixIcon: IconButton(
//                 color: AppColors.greyColor2,
//                 icon: resetPasswordCubit.isVisible2
//                     ? const Icon(Icons.visibility_off,color: AppColors.blackColor,)
//                     : const Icon(Icons.visibility,color: AppColors.blackColor,),
//                 onPressed: () {
//                   resetPasswordCubit.changeSuffixIcon2();
//                 },
//               ),
//
//               obscureText: resetPasswordCubit.isVisible2,
//             ),
//             verticalSpace(32),
//           ],
//         );
//       },
//     );
//   }
// }
