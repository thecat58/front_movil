import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 205, 82, 69),
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Image.asset(
            'assets/logo.png',
            width: 50,
            height: 50,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/registro.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/logo.png'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Nombre del taller',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(
              'Dirección del taller',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '2',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      'Talleres',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    title: Text(
                      'Nombre del dueño',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      'Cargo del dueño',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                  ListTile(
                    title: Text(
                      'Teléfono',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      '+1234567890',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 20,
                    indent: 20,
                    endIndent: 20,
                  ),
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
