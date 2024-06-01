import 'package:dartz/dartz.dart';

import 'package:tailme/domain/auth/auth_failures.dart';



abstract class IAuthFacade {
  Future<Either<AuthFailures,Unit>> registerWithEmailAndPassword({
   
    required String emailAddress,
    required String password,
  });

  Future<Either<AuthFailures,Unit>> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
}
