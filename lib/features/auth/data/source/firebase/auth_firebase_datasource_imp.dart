import 'package:aims_coding_task/features/auth/domain/data/auth_remote_datasource.dart';
import 'package:aims_coding_task/features/auth/domain/usecases/login.dart';
import 'package:aims_coding_task/features/auth/domain/usecases/logout.dart';
import 'package:aims_coding_task/util/exceptions/message_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: AuthFirebaseDataSource)
class AuthFirebaseDataSourceImp implements AuthFirebaseDataSource {
  final Logger _logger;

  AuthFirebaseDataSourceImp({
    required Logger logger,
  }) : _logger = logger;

  @override
  Future<LoginUsecaseOutput> login(LoginUsecaseInput input) async {
    try {
      _logger.i(input.toString());

      final auth = FirebaseAuth.instance;

      UserCredential userCredential;

      try {
        userCredential = await auth.signInWithEmailAndPassword(
          email: input.email,
          password: input.password,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          // If user doesn't exist, create the user
          userCredential = await auth.createUserWithEmailAndPassword(
            email: input.email,
            password: input.password,
          );
        } else if (e.code == 'wrong-password' ||
            e.code == 'invalid-credential') {
          throw MessageException(message: "Incorrect password.");
        } else if (e.code == 'invalid-email') {
          throw MessageException(
              message: "The email address is badly formatted.");
        } else {
          _logger.e("FirebaseAuthException: $e");
          throw SomethingWentWrongException();
        }
      }

      final token = await userCredential.user!.getIdToken();

      _logger.i("User signed in or created successfully with token: $token");

      return LoginUsecaseOutput(token: token!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw MessageException(
            message: "The account already exists for that phone number.");
      } else if (e.code == 'wrong-password') {
        throw MessageException(message: "Incorrect password.");
      } else if (e.code == 'invalid-email') {
        throw MessageException(
            message: "The email address is badly formatted.");
      } else {
        _logger.e("FirebaseAuthException: $e");
        throw SomethingWentWrongException();
      }
    } catch (e) {
      // Generic error handling
      _logger.e("SOMETHING WENT WRONG AT login: $e");
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<LogoutUsecaseOutput> logout(LogoutUsecaseInput input) async {
    try {
      final auth = FirebaseAuth.instance;

      // Perform the sign out
      await auth.signOut();

      _logger.i("User successfully logged out");

      return LogoutUsecaseOutput();
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT logout: $e");
      throw SomethingWentWrongException();
    }
  }
}
