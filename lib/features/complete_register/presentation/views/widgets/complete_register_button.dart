import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/core/utils/app_nav.dart';
import 'package:el_kottab/features/otp/presentation/views/otp_view.dart';
import '../../../../../main_imports.dart';
import '../../view_model/complete_register_cubit.dart';
import '../../view_model/complete_register_states.dart';

class CompleteRegisterButton extends StatelessWidget {
  const CompleteRegisterButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteRegisterCubit , CompleteRegisterStates>(
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
        var completeRegisterCubit = context.read<CompleteRegisterCubit>();
        return
          ConditionalBuilder(
            condition: true,
            fallback: (context)=>CustomLoading(),
            builder: (context){
              return  CustomButton(
                borderColor: AppColors.white,
                btnText: LangKeys.signUp.tr(),
                onPressed: (){
                  AppNav.customNavigator(context: context, screen: OtpView(goToLayoutOrResetPassword: "false"),finish: true);
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