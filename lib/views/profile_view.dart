import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(16),
      child: Material(
        elevation: 12,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 128,
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: const [
                  CircleAvatar(
                    foregroundImage: AssetImage('assets/profile.jpg'),
                    radius: 48,
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        'José Perez',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      subtitle: Text('Registrado el 15/11/21'),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text("Editar perfil"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text("Información de pago"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.place),
              title: const Text("Dirección de facturación"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.monetization_on),
              title: const Text("Cupones"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
