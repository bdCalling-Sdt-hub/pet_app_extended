
import 'package:get/get.dart';

import '../../../helpers/prefs_helper.dart';
import '../../../services/api_service.dart';
import '../../../utils/App_Urls/app_urls.dart';
import '../../../utils/App_Utils/app_utils.dart';
import '../../../views/screens/signup/signup_view.dart';


class DeleteAccountController extends GetxController{

  static DeleteAccountController get instance => Get.put(DeleteAccountController());

  bool isLoading = false;

  Future<void> deleteAccountRepo()async {
    isLoading = true;
    update();

    Map<String, String> header = {
      'Authorization' : PrefsHelper.token
    };

    var response = await ApiService.deleteApi("${AppUrls.users}/${PrefsHelper.userId}", header: header);

    if(response.statusCode == 200){
      PrefsHelper.removeAllPrefData();
      Get.offAll(()=> SignupView());
      Utils.snackBarSuccessMessage("Success:", "Your account has been deleted!");
    }else{
      Utils.snackBarErrorMessage("Error:", "Something went wrong, try again!");
    }
    isLoading = false;
    update();
  }
}