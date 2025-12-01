
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';
import '../../view_model/register_cubit.dart';
import '../../view_model/register_states.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit , RegisterStates>(
      listener: (context,state){
        // if(state is SignUpSuccess){
        //   NewToast.showNewSuccessToast(msg: state.registerModel.message.toString(),
        //       context: context);
        //   AppNav.customNavigator(context: context, screen: OtpView(goToLayoutOrResetPassword: "Layout",));
        // }
        // if(state is SignUpError){
        //   NewToast.showNewErrorToast(msg: state.message.toString(),
        //       context: context);
        // }
      },
      builder: (context,state){
        var registerCubit = context.read<RegisterCubit>();
        return
          ConditionalBuilder(
            condition: state is ! SignUpLoading,
            fallback: (context)=>CustomLoading(),
            builder: (context){
              return  CustomButton(
                borderColor: AppColors.white,
                btnText: LangKeys.signUp.tr(),
                onPressed: (){
                  if (formKey.currentState!.validate()) {
                    // registerCubit.register(
                    //   name: registerCubit.nameCon.text,
                    //   email: registerCubit.emailCon.text,
                    //   phone: registerCubit.phoneNumber,
                    //   image: registerCubit.profileImage,
                    //   password:  registerCubit.passCon.text,
                    //   passwordConfirmation:  registerCubit.confirmPassCon.text,
                    //   countryId: registerCubit.selectedCountry!.id!,
                    //   cityId: registerCubit.selectedCity!.id,
                    // );
                  }
                },
              );
            },
          );
      },
    );
  }
}