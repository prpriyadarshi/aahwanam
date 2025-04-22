abstract class AccountState {}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  final String name;
  final String email;
  final String profileUrl;

  AccountLoaded({required this.name, required this.email, required this.profileUrl});
}

class AccountError extends AccountState {
  final String message;

  AccountError(this.message);
}
