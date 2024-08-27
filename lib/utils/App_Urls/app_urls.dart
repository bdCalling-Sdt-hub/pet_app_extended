
class AppUrls {
  static String socketUrl = "";
  // static String baseUrl = "http://192.168.10.130:9000/api/v1";
  static String baseUrl = "http://192.168.10.137:8000/api/v1";
  // static String photoUrl = "http://192.168.10.130:9000";
  static String photoUrl = "http://192.168.10.137:8000";

  static String users = "$baseUrl/users";

  static String login = "$baseUrl/users/login";

  static String signUp = "$baseUrl/users/signup";

  static String forgotPassword = "$baseUrl/users/forget-password";

  static String filterByTag = "$baseUrl/pets/search/for";

  static String notification = "$baseUrl/notification";

  static String myPets = "$baseUrl/pets/my/pet/";

  static String pets = "$baseUrl/pets";

  static String petsAdd = "$baseUrl/pets/add";

  static String verifyOtp = "$baseUrl/users/verify-otp";

  static String verifyForgetOtp = "$baseUrl/users/otp/forget-password";

  static String resetPassword = "$baseUrl/users/reset-password";

  static String changePassword = "$baseUrl/users/change-password";

  static String createGroup = "$baseUrl/chats/group";

  static String myGroups = "$baseUrl/chats/my-group";
}