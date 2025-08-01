abstract class AccountEvent {}

class LoadAccountInfo extends AccountEvent {}

class UpdateAccountInfo extends AccountEvent {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;

  UpdateAccountInfo({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
  });
}
