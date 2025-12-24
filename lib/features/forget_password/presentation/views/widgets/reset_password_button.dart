import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_imports.dart';
import '../../view_model/forget_password_cubit.dart';
import '../../view_model/forget_password_states.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton(this.formKey, {super.key});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit , ForgetPasswordStates>(
      listener: (context,state){
        if(state is ForgetPasswordSuccessState){
          Toast.showSuccessToast(msg: state.forgotPasswordByEmailModel.message.toString(),
              context: context);
          //AppNav.customNavigator(context: context, screen: LoginView());
        }
        if(state is ForgetPasswordErrorState){
          Toast.showErrorToast(msg: state.error.toString(),
              context: context);
        }
      },
      builder: (context,state){
        var resetPasswordCubit = context.read<ForgetPasswordCubit>();
        return
          ConditionalBuilder(
            condition: state is ! ForgetPasswordLoadingState,
            fallback: (context)=>CustomLoading(),
            builder: (context){
              return  CustomButton(
                borderColor: AppColors.white,
                btnText:  LangKeys.resetPassword.tr(),
                onPressed: (){
                  if (formKey.currentState!.validate()) {
                    //resetPasswordCubit.resetPassword();
                  }
                },
              );
            },
          );
      },
    );
  }
}
