
// global netWork Variable

import 'package:connectivity_plus/connectivity_plus.dart';

bool isNetworkAvail = true;

//checking the network
Future<bool> isNetworkAvailable() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  print("------------------------------ ////////////////////// ------------------------------");
  print("connectivityResult : ${connectivityResult[0]},  mobile : ${ConnectivityResult.mobile},  wifi : ${ConnectivityResult.wifi}");
  if (connectivityResult[0] == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult[0] == ConnectivityResult.wifi) {
    print("wifi return : true");
    return true;
  }
  return false;
}
