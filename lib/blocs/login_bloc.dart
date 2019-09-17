import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase {
  final _userNameController = BehaviorSubject<String>();
  Observable<String> get userNameFlux => _userNameController.stream;
  Sink<String> get userNameEvent => _userNameController.sink;


  @override
  void dispose() { 
    super.dispose();
  }
}









