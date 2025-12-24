import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:match_kora_app/features/login/presentation/views/login_view.dart';
import 'package:match_kora_app/features/forget_password/presentation/view_model/reset_password_states.dart';

import '../../../../../main_importants.dart';
import '../../view_model/reset_password_cubit.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton(this.formKey, {super.key});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit , ResetPasswordStates>(
      listener: (context,state){
        if(state is ResetPasswordSuccessState){
          NewToast.showNewSuccessToast(msg: state.resetPasswordModel.message.toString(),
              context: context);
          AppNav.customNavigator(context: context, screen: LoginView());
        }
        if(state is ResetPasswordErrorState){
          NewToast.showNewErrorToast(msg: state.error.toString(),
              context: context);
        }
      },
      builder: (context,state){
        var resetPasswordCubit = context.read<ResetPasswordCubit>();
        return
          ConditionalBuilder(
            condition: state is ! ResetPasswordLoadingState,
            fallback: (context)=>CustomLoading(),
            builder: (context){
              return  CustomButton(
                borderColor: AppColors.whiteColor,
                btnText: Text(AppStrings.resetPassword,
                  style: AppStyles.textStyle16W500White,),
                onPressed: (){
                  if (formKey.currentState!.validate()) {
                    resetPasswordCubit.resetPassword();
                  }
                },
              );
            },
          );
      },
    );
  }
}
