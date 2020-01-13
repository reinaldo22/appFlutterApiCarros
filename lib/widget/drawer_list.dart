import 'package:carros/pages/login/login_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final urlFoto =
        "https://avatars3.githubusercontent.com/u/22408651?s=460&v=4";
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Reinaldo Vargas"),
              accountEmail: Text("vargas.reynaldo22@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(urlFoto),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 2");
                Navigator.pop(context);
              },
            ),
            ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => _onclickLogout(context))
          ],
        ),
      ),
    );
  }

  _onclickLogout(BuildContext context) {
    Navigator.pop(context);
    rotas(context, LoginPage(), replace: true);
  }
}
