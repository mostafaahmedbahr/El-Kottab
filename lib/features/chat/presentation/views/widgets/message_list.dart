import 'package:el_kottab/features/chat/presentation/views/widgets/right_message_by_me.dart';

import '../../../../../main_imports.dart';
import 'left_message_from_teacher.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:   EdgeInsets.all(16.r),
      children: [
        LeftMessageFromTeacher(),
        RightMessageByMe(),


      ],
    );
  }
}