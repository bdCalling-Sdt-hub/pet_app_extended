
import 'package:felpus/app/modules/signup/views/signup_view.dart';
import 'package:get/get.dart';

import '../../../app/common/App_Urls/app_urls.dart';
import '../../../app/common/App_Utils/app_utils.dart';
import '../../../app/common/helper/prefs_helper.dart';
import '../../../app/common/services/api_service.dart';

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