import 'package:flutter/material.dart';
import 'package:flutter_assignments/assignments/assignment_three/widgets/otp_input_field.dart';
import 'package:flutter_assignments/models/otp_models.dart';
import 'package:flutter_assignments/routes/route_names.dart';
import 'package:flutter_assignments/state/otp_state_manager.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final OtpStateManager _stateManager = OtpStateManager();
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(4, (index) => FocusNode());
    
    _stateManager.state.addListener(_handleStateChange);
  }

  void _handleStateChange() {
    final currentState = _stateManager.state.value;
    
    switch (currentState) {
      case OtpVerificationState.verified:
        _navigateToSuccess();
        break;
      case OtpVerificationState.error:
        _showErrorSnackBar();
        break;
      default:
        break;
    }
  }

  void _navigateToSuccess() {
    Navigator.pushReplacementNamed(context, RouteNames.otpSuccess);
  }

  void _showErrorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_stateManager.errorMessage.value),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _handleOtpChange(int index) {
    if (index < 3) {
      _focusNodes[index + 1].requestFocus();
    } else if (index == 3) {
      // All OTP digits entered, you could auto-verify here
      // _stateManager.verifyOtp();
    }
  }

  Future<void> _handleVerifyOtp() async {
    await _stateManager.verifyOtp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),


      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/fulWala.png'),

              const SizedBox(height: 20),

              const Text(
                'Verification Code',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              
              // THIS IS THE MAGIC PART - Email from ValueNotifier!
              ValueListenableBuilder<String>(
                valueListenable: _stateManager.userEmail,
                builder: (context, email, child) {
                  return Text(
                    'We have sent the verification code to your email address $email',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  );
                },
              ),
              
              const SizedBox(height: 32),
              
              // OTP Input Form
              Form(
                key: _stateManager.otpFormKey,
                child: Column(
                  children: [
                    // OTP Input Fields
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        return OtpInputField(
                          controller: _stateManager.otpControllers[index],
                          focusNode: _focusNodes[index],
                          onChanged: () => _handleOtpChange(index),
                          isActive: _focusNodes[index].hasFocus,
                        );
                      }),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Confirm Button
                    ValueListenableBuilder<bool>(
                      valueListenable: _stateManager.isLoading,
                      builder: (context, isLoading, child) {
                        return SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: isLoading ? null : _handleVerifyOtp,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: isLoading
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Text(
                                    'Confirm',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _stateManager.state.removeListener(_handleStateChange);
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}
