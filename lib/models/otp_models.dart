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

  OTPFormData copyWith({
    String? email,
    String? phoneNumber,
    String? otpCode,
  }) {
    return OTPFormData(
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      otpCode: otpCode ?? this.otpCode
    );
  }
}

enum OtpVerificationState { initial, loading, codeSent, verified, error }
