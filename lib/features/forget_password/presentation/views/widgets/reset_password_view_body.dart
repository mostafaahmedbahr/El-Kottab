import 'package:match_kora_app/features/forget_password/presentation/views/widgets/reset_password_button.dart';
import 'package:match_kora_app/features/forget_password/presentation/views/widgets/reset_password_form.dart';
import 'package:match_kora_app/features/forget_password/presentation/views/widgets/reset_password_texts.dart';

import '../../../../../main_importants.dart';
import '../../../data/repos/forget_password_repo_impl.dart';
import '../../view_model/reset_password_cubit.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => ResetPasswordCubit(getIt.get<ResetPasswordRepoImpl>()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              const  ResetPasswordTexts(),
              verticalSpace(20),
                const  ResetPasswordForm(),
              verticalSpace(20),
              ResetPasswordButton(formKey),
            ],
          ),
        ),
      ),
    );
  }
}
