import 'package:flutter/material.dart';
import 'package:flutter_assignments/models/otp_models.dart';

class OtpStateManager extends ChangeNotifier {
  // Singleton pattern
  static final OtpStateManager _instance = OtpStateManager._internal();
  factory OtpStateManager() => _instance;
  OtpStateManager._internal();

  // Form controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final List<TextEditingController> otpControllers = List.generate(4, (index) => TextEditingController());

  // Form keys
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  // using ValueNotifier for state management
  final ValueNotifier<OtpVerificationState> _state = ValueNotifier(OtpVerificationState.initial);
  final ValueNotifier<String> _errorMessage = ValueNotifier('');
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  // value notifiers for form 
  final ValueNotifier<String> _userEmail = ValueNotifier('');
  final ValueNotifier<String> _userPhone = ValueNotifier('');

  // Getters for value notifiers:
  ValueNotifier<OtpVerificationState> get state => _state;
  ValueNotifier<String> get errorMessage => _errorMessage;
  ValueNotifier<bool> get isLoading => _isLoading;
  ValueNotifier<String> get userEmail => _userEmail;
  ValueNotifier<String> get userPhone => _userPhone;

  // Get current Form data:
  OTPFormData getCurrentFormData() {
    return OTPFormData(
      email: emailController.text,
      phoneNumber: phoneController.text,
      otpCode: otpControllers.map((controller) => controller.text).join(),
    );
  }

  // Validate Login Form
  bool validateLoginForm(){
    return loginFormKey.currentState?.validate() ?? false;
  }

  bool validateOtp(){
    return otpFormKey.currentState?.validate() ?? false;
  }

  // Submit Login Form
  Future<bool> sendOtp() async{
    if(!validateLoginForm()) return false;

    _isLoading.value = true;
    _state.value = OtpVerificationState.loading;

    try{
      _userEmail.value = emailController.text;
      _userPhone.value = phoneController.text;

      await Future.delayed(const Duration(seconds: 2));

      _state.value = OtpVerificationState.codeSent;
      _errorMessage.value = '';
      return true;
    }catch(er) {
      _state.value = OtpVerificationState.error;
      _errorMessage.value = "Failed to send OTP: ${er.toString()}";
      return false;
    }finally{
      _isLoading.value = false;
    }
  } 

  // Verify OTP Form
  Future<bool> verifyOtp() async {
    if(!validateOtp()) return false;

    _isLoading.value = true;
    _state.value = OtpVerificationState.loading;

    try{
      await Future.delayed(const Duration(seconds: 2));

      // Currently set the otp to 1234.
      final otpCode = otpControllers.map((c) => c.text).join();
      if(otpCode == '1234'){
        _state.value = OtpVerificationState.verified;
        _errorMessage.value = '';
        return true;
      } else {
        throw Exception('Invalid Otp code');
      }
    } catch(err){
      _state.value = OtpVerificationState.error;
      _errorMessage.value = "Failed to verify OTP: ${err.toString()}";
      return false;
    } finally{
      _isLoading.value = false;
    }
  }

  // Reset values:
  void reset(){
    _state.value = OtpVerificationState.initial;
    _errorMessage.value = '';
    _isLoading.value = false;
    _userEmail.value = '';
    _userPhone.value = '';


    emailController.clear();
    phoneController.clear();

    for(var controller in otpControllers){
      controller.clear();
    }
  }

  @override
  void dispose(){
    emailController.dispose();
    phoneController.dispose();
    
    for (var controller in otpControllers) {
      controller.dispose();
    }
    
    _state.dispose();
    _errorMessage.dispose();
    _isLoading.dispose();
    _userEmail.dispose();
    _userPhone.dispose();

    super.dispose();
  }
}