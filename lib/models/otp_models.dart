class OTPFormData {
  final String email;
  final String phoneNumber;
  final String otpCode;

  // constructor
  OTPFormData({
    required this.email,
    required this.phoneNumber,
    required this.otpCode,
  });
}

enum OtpVerificationState { initial, loading, codeSent, verified, error }
