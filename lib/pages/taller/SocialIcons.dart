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
            // Acción al presionar el botón de Facebook
            _launchURL('https://www.facebook.com/');
          },
        ),
        SizedBox(width: 10),
        IconButton(
          icon: Image.asset(
            'assets/instagram_icon.png',
            width: 40,
            height: 40,
          ),
          onPressed: () {
            // Acción al presionar el botón de Instagram
            _launchURL('https://www.instagram.com/');
          },
        ),
        SizedBox(width: 10),
        IconButton(
          icon: Image.asset(
            'assets/whatsapp96.png',
            width: 40,
            height: 40,
          ),
          onPressed: () {
            // Acción al presionar el botón de WhatsApp
            _launchURL('https://wa.me/');
          },
        ),
        SizedBox(width: 10),
        IconButton(
          icon: Image.asset(
            'assets/tiktok.png',
            width: 40,
            height: 40,
          ),
          onPressed: () {
            // Acción al presionar el botón de TikTok
            _launchURL('https://www.tiktok.com/');
          },
        ),
      ],
    );
  }

  // Función para abrir enlaces utilizando url_launcher
  void _launchURL(String url) async {
    try {
      await launch(url);
    } catch (e) {
      print('No se pudo abrir el enlace $url: $e');
    }
  }
}
