import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            icon: Image.asset(
              'assets/facebook.png',
              width: 40,
              height: 40,
            ),
            onPressed: () {
              // Acción al presionar el botón de Instagram
              _launchURL('https://www.facebook.com/');

            },
          ),
        SizedBox(width: 10),
        Flexible(
          child: IconButton(
            icon: Image.asset(
              'assets/instagram_icon.png',
              width: 40,
              height: 40,
            ),
            onPressed: () {
              // Acción al presionar el botón de Instagram
              print('Abrir enlace de Instagram');
            },
          ),
        ),
        SizedBox(width: 10),
        Flexible(
          child: IconButton(
            icon: Image.asset(
              'assets/whatsapp96.png',
              width: 40,
              height: 40,
            ),
            onPressed: () {
              // Acción al presionar el botón de WhatsApp
              print('Abrir enlace de WhatsApp');
            },
          ),
        ),
        SizedBox(width: 10),
        Flexible(
          child: IconButton(
            icon: Image.asset(
              'assets/tiktok.png',
              width: 40,
              height: 40,
            ),
            onPressed: () {
              // Acción al presionar el botón de TikTok
              print('Abrir enlace de TikTok');
            },
          ),
        ),
      ],
    );
  }

  // Función para abrir enlaces utilizando url_launcher
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('No se pudo abrir el enlace $url');
    }
  }
}
