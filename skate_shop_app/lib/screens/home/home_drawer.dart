import 'package:flutter/material.dart';
class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 5,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _getUserHeader(),
            ListTile(
              title: Text("Mis Skates"),
              leading: Icon(Icons.apps),
            ),
            ListTile(
              title: Text("Notificaciones"),
              leading: Icon(Icons.notifications_none),
            ),
            ListTile(
              title: Text("Lista de deseos"),
              leading: Icon(Icons.favorite_border),
            ),
            Divider(
              color: Colors.black45,
              height: 10,
            ),
            ListTile(
              title: Text("Cuenta"),
              leading: Icon(Icons.person_outline),
            ),
            ListTile(
              title: Text("Configuracion"),
              leading: Icon(Icons.settings),
            ),
            Divider(
              color: Colors.black45,
              height: 10,
            ),
            ListTile(
              title: Text("Ayuda y Comentarios"),
            ),
            ListTile(
              title: Text("Acerca de Retro Skate "),
            ),
          ],
        ));
  }

  UserAccountsDrawerHeader _getUserHeader() {
    return UserAccountsDrawerHeader(
      onDetailsPressed: () {
        debugPrint("Detail Account");
      },
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/originals/c9/bd/6b/c9bd6bbcbd28690a5f47ee6ce1eb5d0b.jpg"),
          )),
      accountName: Text("Lopez Daimian"),
      accountEmail: Text("dennyslopez2013@gmail.com"),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(
            "https://avatars1.githubusercontent.com/u/46911625?s=400&u=d33335cce7908a2cc536161de475e5fa336746c4&v=4"),
      ),
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          child: Text("FL"),
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
              "https://www.tecnoshoponline.es/wp-content/uploads/9eb6de771bf478a1a04d08969a76ccf6.png"),
        )
      ],
    );
  }
}
