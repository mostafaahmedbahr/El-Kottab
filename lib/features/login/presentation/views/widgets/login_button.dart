import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/utils/toast/toast.dart';
import '../../../../../main_imports.dart';
import '../../view_model/login_cubit.dart';
import '../../view_model/login_states.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      buildWhen: (previous, current) {
        return current is LoginSuccessState ||
            current is LoginLoadingState ||
            current is LoginErrorState  ;
      },
      listener: (context, state) {
        if (state is LoginErrorState) {
          Toast.showErrorToast(msg: state.error.toString(), context: context);
        } else if (state is LoginSuccessState) {
          Toast.showSuccessToast(
            msg: state.loginModel.message.toString(),
            context: context,
          );
        }
      },
      builder: (context, state) {
        var loginCubit = context.watch<LoginCubit>();
        return ConditionalBuilder(
          condition: state is! LoginLoadingState,
          fallback: (context) => CustomLoading(),
          builder: (context) {
            return CustomButton(
              btnText: Text(LangKeys.continuee.tr()),
              onPressed:  () {
                if (formKey.currentState!.validate()) {
                  loginCubit.login(
                    email: loginCubit.emailCon.text,
                    password: loginCubit.passwordCon.text,
                  );
                }
              } ,

            );
          },
        );
      },
    );
  }
}