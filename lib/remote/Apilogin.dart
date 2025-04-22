

import '../static/Link.dart' show linklogin;
import 'crudnew.dart';

class Apilogin {
  Crudnew cr;
  Apilogin(this.cr);
  getdata(String username, String password) async {
    var response = await cr.postdata(linklogin, {
      'username': username.toString(),
      'password': password.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }

 
}