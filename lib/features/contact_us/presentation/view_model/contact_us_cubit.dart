import 'package:el_kottab/features/contact_us/data/repos/contact_us_repo.dart';
import '../../../../main_imports.dart';
import '../../data/models/contact_us_model.dart';
import 'contact_us_states.dart';

class ContactUsCubit extends Cubit<ContactUsStates> {
  ContactUsCubit(this.contactUsRepo) : super(ContactUsInitState());

  static ContactUsCubit get(context) => BlocProvider.of(context);

  final ContactUsRepo? contactUsRepo;

  ContactUsModel? contactUsModel;

  Future<void> contactUs({
    required String email,
    required String phone,
    required String title,
    required String message,
    required String country,
  }) async {
    emit(ContactUsLoadingState());
    var result = await contactUsRepo!.contactUs(
      email: email,
      phone: phone,
      title: title,
      message: message,
      country: country,
    );
    return result.fold(
      (failure) {
        emit(ContactUsErrorState(failure.errMessage));
      },
      (data) async {
        contactUsModel = data;
        emit(ContactUsSuccessState(data));
      },
    );
  }

  var emailCon = TextEditingController();
  var phoneCon = TextEditingController();
  var titleCon = TextEditingController();
  var messageCon = TextEditingController();
  String phoneNumber = '';
  String countryCode = '';
  String countryName = 'Egypt';

}
