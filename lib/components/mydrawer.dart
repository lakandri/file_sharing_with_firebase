import 'package:filesharewithfirebase/auths/auth_service.dart';
import 'package:filesharewithfirebase/auths/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'auth_service.dart';
// import 'components/mydrawer_tiles.dart';
import 'mydrawer_tiles.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ClipOval(
                  child: Image.asset(
                    'assets/profile.png',
                    height: 60,
                    width: 65,
                  ),
                ),
              )),
          const Text(
            'Ujen File App',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          MydrawerTiles(
            tileName: 'HomePage',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          MydrawerTiles(
            tileName: 'Settings',
            icon: Icons.settings,
            onTap: () {},
          ),
          const Spacer(),
          MydrawerTiles(
            tileName: 'Logout',
            icon: Icons.logout_outlined,
            onTap: () async {
              final authService =
                  Provider.of<AuthService>(context, listen: false);
              await authService.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
