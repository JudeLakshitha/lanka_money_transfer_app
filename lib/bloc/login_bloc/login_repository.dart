class LoginRepository{
   Future<void> login() async{
    print('attempting login');
    await Future.delayed(Duration(seconds: 3));
    print('logged In');
    throw Exception('failed to log-in');
  }
}