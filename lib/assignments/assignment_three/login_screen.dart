import 'package:flutter/material.dart';
import 'package:flutter_assignments/assignments/assignment_three/widgets/custom_text_field.dart';
import 'package:flutter_assignments/models/otp_models.dart';
import 'package:flutter_assignments/routes/route_names.dart';
import 'package:flutter_assignments/state/otp_state_manager.dart';
import 'package:tailwind_standards/tailwind_standards.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final OtpStateManager _stateManager = OtpStateManager();

  @override
  void initState(){
    super.initState();
    _stateManager.state.addListener(_handleStateChange);
  }

  void _handleStateChange() {
    final currentState = _stateManager.state.value;

    switch(currentState){
      case OtpVerificationState.codeSent:
        Navigator.pushNamed(context, RouteNames.otpVerification);
        break;
      case OtpVerificationState.error:
        _showErrorSnackBar();
        break;
      default:
        break;
    }
  }
  
  void _showErrorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_stateManager.errorMessage.value),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> _handleSendOtp() async{
    await _stateManager.sendOtp();
  }


  String? emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    
    return null;
  }

  String? phoneValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    return null;
  }

  @override
  void dispose() {
    _stateManager.state.removeListener(_handleStateChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.cyan50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(38.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                  Image.asset('assets/images/fulWala.png'),            

                  const Text(
                    'OTP Verification',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: 8),

                  const Text(
                    'Enter email and phone number to send one time Password',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  
                  const SizedBox(height: 32),           

                  Form(
                    key: _stateManager.loginFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          label: "Email",
                          controller: _stateManager.emailController,
                          hint: 'striver80085@gmail.com',
                          keyboardType: TextInputType.emailAddress,
                          validator: emailValidator,
                          prefixIcon: const Icon(Icons.email_outlined),
                        ),

                        SizedBox(height: 20),

                        CustomTextField(
                          label: "Phone",
                          controller: _stateManager.phoneController,
                          hint: '8983710591',
                          keyboardType: TextInputType.phone,
                          validator:  phoneValidator,
                          prefixIcon: const Icon(Icons.phone_android_outlined),
                        ),

                        ValueListenableBuilder(
                          valueListenable: _stateManager.isLoading,
                          builder: (context, isLoading, child) {
                            return SizedBox(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                  )
                                ),

                                onPressed: isLoading ? null : _handleSendOtp,
                                child: isLoading ? 
                                  const CircularProgressIndicator(color: Colors.white) :
                                  const Text(
                                    'Continue',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),

                            )
                            );
                          }
                        )],
                    )
                  ) 
              ],
            ),
          )
        ),
      )
      
    );
    
  }



}