abstract class AuthEvent {}

class SendOTP extends AuthEvent {
  final String phoneNumber;
  SendOTP(this.phoneNumber);
}

class VerifyOTP extends AuthEvent {
  final String otp;
  VerifyOTP(this.otp);
}


class LoginWithEmail extends AuthEvent {
  final String email, password;
  LoginWithEmail(this.email, this.password);
}

class SignUpUser extends AuthEvent {
  final String firstName, lastName, email, phone, password;
  SignUpUser(this.firstName, this.lastName, this.email, this.phone, this.password);
}
