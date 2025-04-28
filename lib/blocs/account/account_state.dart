abstract class AccountState {}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String profileUrl;

  AccountLoaded({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.profileUrl,
  });
}


class AccountError extends AccountState {
  final String message;
  AccountError(this.message);
}
