import 'package:demo_template/Constants/Enums/ViewState.dart';
import 'package:demo_template/DataHandler/Local/SharedPrefs.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final ViewStateEnum _state = ViewStateEnum.idle;
  // FirebaseService firebaseService = FirebaseService.instance;

  // AppControllers appControllers = AppControllers.instance;
  SharedPrefs sharedPrefs = SharedPrefs.instance;

  ViewStateEnum get state => _state;

  // /*
  // Change The Value Of View State
  //  */
  // void setLoaderState(ViewStateEnum viewState) {
  //   if (state != viewState) _state = viewState;
  //   update();
  // }

}