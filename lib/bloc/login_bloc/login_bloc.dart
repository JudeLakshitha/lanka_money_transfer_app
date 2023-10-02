import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:lanka_money_transfer_app/bloc/login_bloc/login_submission_status.dart';
import 'package:meta/meta.dart';

import 'login_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepo;

  //LoginBloc({required this.loginRepo}) : super(const LoginState());

  LoginBloc({required this.loginRepo}) : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      //username update
      if (event is LoginUsernameChanged) {
        emit(
          state.copyWith(
            username: event.username,
            password: '',
            formStatus: FormSubmitting(),
          ),
        );
        //password update
      } else if (event is LoginPasswordChanged) {
        emit(
          state.copyWith(
            username: '',
            password: event.password,
            formStatus: FormSubmitting(),
          ),
        );
        //Form submitted
      } else if (event is LoginSubmitted) {
        emit(
          state.copyWith(
            username: '',
            password: '',
            formStatus: FormSubmitting(),
          ),
        );
        try {
          await loginRepo.login();
          emit(
            state.copyWith(
              username: '',
              password: '',
              formStatus: SubmissionSuccess(),
            ),
          );
        } catch (e) {
          state.copyWith(
            username: '',
            password: '',
            formStatus: SubmissionFailed(e),
          );
          print('Printing Exception----');
        }
      }
    });
  }

// LoginBloc({required this.loginRepo}) : super(const LoginState()) {
//   on<LoginEvent>((event, emit) async {});
//
//   loginUser(Emitter<LoginState> emit, LoginEvent event) async {
//     //emit(LoginLoading());
//     Response response;
//
//     try {
//       if (event is LoginSubmitted) {
//         await Future.delayed(Duration(seconds: 2));
//         response = await UserAuth.userLogin(
//           email: event.email,
//           password: event.password,
//         );
//         if (response.statusCode == 200) {
//           if (response.data["role"] == "CUSTOMER") {
//             SharedPreferencesUtils.setUserToken(
//                 token: response.data["access_token"]);
//             emit(LoginSuccess());
//           } else {
//             emit(LoginFailure(message: "Invalid Credentials."));
//           }
//         }
//       } else {
//         emit(LoginFailure(message: response.data["message"].toString()));
//       }
//     } catch (e) {
//       // if (e is DioException) {
//       //   if (e.type == DioExceptionType.connectionTimeout) {
//       //     emit(LoginFailure(message: e.toString()));
//       //   } else if (e.response != null) {
//       //     String error = e.response?.data["message"];
//       //     emit(LoginFailure(message: error));
//       //   }
//       // }
//     }
//   }
// }
}

// Stream<LoginState> mapEventToState(LoginEvent event) async* {
//   //username update
//   if (event is LoginUsernameChanged) {
//     yield state.copyWith(
//         username: event.username, password: '', formStatus: FormSubmitting());
//
//     //password update
//   } else if (event is LoginPasswordChanged) {
//     yield state.copyWith(
//         password: event.password, username: '', formStatus: FormSubmitting());
//
//     //form submit
//   } else if (event is LoginSubmitted) {
//     yield state.copyWith(
//         password: '', username: '', formStatus: FormSubmitting());
//     try {
//       await loginRepo.login();
//     } catch (e) {
//       // yield state.copyWith(password: '', username: '', formStatus: SubmissionFailed(e));
//       print(e.toString());
//     }
//   }
// }
