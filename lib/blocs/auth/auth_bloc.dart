import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SendOTP>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(Duration(seconds: 2));
      emit(AuthSuccess());
    });

    on<VerifyOTP>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(Duration(seconds: 1));
      emit(AuthSuccess());

    });

    on<LoginWithEmail>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(Duration(seconds: 2));
      emit(AuthSuccess());
    });

    on<SignUpUser>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(Duration(seconds: 2));
      emit(AuthSuccess());
    });
  }
}
