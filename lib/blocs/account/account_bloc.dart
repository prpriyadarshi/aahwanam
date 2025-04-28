import 'package:flutter_bloc/flutter_bloc.dart';
import 'account_event.dart';
import 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<LoadAccountInfo>((event, emit) async {
      emit(AccountLoading());
      try {
        await Future.delayed(Duration(seconds: 1));
        emit(AccountLoaded(
          firstName: 'Chanchal',
          lastName: 'Soni',
          phone: '9876543210',
          email: 'Chanchal.soni@payg.in',
          profileUrl: 'assets/images/profile.png',
        ));
      }
      catch (e) {
        emit(AccountError("Failed to load data"));
      }
    });
  }
}