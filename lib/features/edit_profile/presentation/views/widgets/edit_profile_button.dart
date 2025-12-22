 import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';
import '../../../../layout/presentation/views/layout_view.dart';
import '../../../../profile/presentation/view_model/profile_cubit.dart';
import '../../view_model/edit_profile_info_cubit.dart';
import '../../view_model/edit_profile_info_states.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileInfoCubit,EditProfileInfoStates>(
      buildWhen: (previous, current){
        return current is EditProfileInfoErrorState || current is EditProfileInfoSuccessState || current is EditProfileInfoLoadingState;
      },
      listener: (context,state){
        if (state is EditProfileInfoErrorState) {
          Toast.showErrorToast(msg: state.error.toString(), context: context);
        }
        if (state is EditProfileInfoSuccessState){
          context.read<ProfileCubit>().getProfileData();
          AppNav.customNavigator(context: context,
            screen: const LayoutView(),
            finish: true,
          );
          Toast.showSuccessToast(msg: state.editProfileInfoModel.message.toString(), context: context);

        }
      },
      builder: (context,state){
        var editProfileInfoCubit = context.read<EditProfileInfoCubit>();
        return ConditionalBuilder(
          condition: state is ! EditProfileInfoLoadingState,
          fallback: (context)=>const CustomLoading(),
          builder: (context){
            return CustomButton(
              btnText: LangKeys.save.tr(),
              onPressed: (){
                // editProfileInfoCubit.editProfileInfoData(
                //   email: editProfileInfoCubit.emailCon.text.isNotEmpty
                //       ? editProfileInfoCubit.emailCon.text
                //       : null,
                //   name: editProfileInfoCubit.nameCon.text.isNotEmpty
                //       ? editProfileInfoCubit.nameCon.text
                //       : null,
                //   phoneNumber: editProfileInfoCubit.phoneNumber.isNotEmpty
                //       ? editProfileInfoCubit.phoneNumber
                //       : null,
                //    image: ,
                //    gender: ,
                //    categoryId: editProfileInfoCubit.categoryController.text,
                //
                // );


              },
            );
          },

        );
      },

    );
  }
}
