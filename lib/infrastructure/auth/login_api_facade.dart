import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tailme/domain/Login/model/user_login_model.dart';
import 'package:tailme/domain/auth/auth_failures.dart';
import 'package:tailme/domain/auth/i_auth_facade.dart';
import 'package:tailme/domain/auth/value_objects.dart';
import 'package:tailme/infrastructure/string.dart';

class LoginApiFacade implements IAuthFacade {
  @override
  Future<Either<AuthFailures, Unit>> registerWithEmailAndPassword({required String emailAddress, required String password}) {
    // TODO: implement registerWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailures, Unit>> signInWithEmailAndPassword({required String emailAddress, required String password}) async{
    String email = EmailAddress(emailAddress).getOrCrash();
    String pass = Password(password).getOrCrash();
    final user = UserLogin(email: email, password: pass);
    try {
      var headers = {'Content-Type': 'application/json'};
      var data = json.encode({"email": user.email, "password": user.password});
      var dio = Dio();
      var response = await dio.request(
        '$base64Url$userLoginUrl',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

       if (response.statusCode == 200) {
      print(response.data);
      return right(unit);
    } else if(response.statusCode == 404){
      
      print('Response data 404: ${response.data}');
      return left(const AuthFailures.invalidEmailAndPassCombination());
    }
    else{
      print('Non-200 status code: ${response.statusCode}');
      return left(AuthFailures.serverError());

    }
  } on DioException catch (e) {
    
    if (e.response != null) {
      
      print('Non-200 status code: ${e.response?.statusCode}');
      print('Response data: ${e.response?.data}');
    } else {
      // Handle other errors such as network issues
      print('Error: ${e.message}');
    }

    throw UnimplementedError();

  }

}}
