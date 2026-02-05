import 'package:food_delivery/data/repository/auth_repo.dart';
import 'package:food_delivery/models/response_model.dart';
import 'package:food_delivery/models/sign_up_body_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService{
  // Add your authentication logic here
  final AuthRepo authRepo;
  AuthController({required this.authRepo});
  bool _isLoading = false;
  bool get isLoading => _isLoading;
// Registration method
  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;
    // Add these debug prints
    print("Status Code: ${response.statusCode}");
    print("Status Text: ${response.statusText}");
    print("Response Body: ${response.body}");
    print("Request Data: ${signUpBody.toJson()}");

    if (response.statusCode == 200) {
      print("registration successful");
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      print("registration failed");
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
  // login method can be added here
  Future<ResponseModel> login(String email , String password) async {
    _isLoading = true;
    update();
    Response response = await authRepo.login( email , password);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      print("login successful");
      authRepo.saveUserToken(response.body["token"]);
      print(response.body["token"].toString());
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      print("login failed");
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }


}