import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/main_imports.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.editProfile.tr()),
      ),
    );
  }
}
