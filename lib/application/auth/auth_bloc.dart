import 'package:bloc/bloc.dart';
import 'package:flutter_ddd/domain/auth/i_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _iAuthFacade;
  AuthBloc(this._iAuthFacade) : super(AuthState.initial()) {
    // on<AuthEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    @override
    Stream<AuthState> mapEventToState(
      AuthEvent event,
    ) async* {
      yield* event.map(authCheckRequested: (e) async* {
        final userOption = await _iAuthFacade.getSignedInUser();
        yield userOption.fold(
          () => AuthState.unauthenticated(),
          (a) => AuthState.authenticated(),
        );
      }, signedOut: (e) async* {
        _iAuthFacade.signOut();
        yield AuthState.unauthenticated();
      });
    }

    ;
  }
}
