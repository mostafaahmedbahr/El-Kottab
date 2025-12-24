import 'package:el_kottab/features/forget_password/presentation/views/widgets/reset_password_button.dart';

import '../../../../../core/app_services/remote_services/service_locator.dart';
import '../../../../../main_imports.dart';
import '../../../data/repos/forget_password_repo_impl.dart';
import '../../view_model/forget_password_cubit.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(getIt.get<ForgetPasswordRepoImpl>()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20.h),
              // const  ForgetPasswordTexts(),
              Gap(20.h),
                // const  ForgetPasswordForm(),
              Gap(20.h),
              ForgetPasswordButton(formKey),
            ],
          ),
        ),
      ),
    );
  }
}
