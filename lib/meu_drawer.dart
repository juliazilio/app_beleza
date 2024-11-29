import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Aplicativo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[800],
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Página Inicial')),
      drawer: MeuDrawer(),
      body: Center(child: Text('Bem-vindo à Página Inicial')),
    );
  }
}

class MeuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.grey[800]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categorias',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('Explore nossas ofertas e produtos', style: TextStyle(color: Colors.grey[300])),
              ],
            ),
          ),
          _createDrawerItem(icon: Icons.local_florist, text: 'Perfume', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ImageGridPage(title: 'Perfumes', imagePaths: [
              'olypea.png',
              'missdior2.png',
              'chanel1.png',
              'scand.png'
            ])));
          }),
          _createDrawerItem(icon: Icons.face, text: 'Skin Care', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ImageGridPage(title: 'Skin Care', imagePaths: [
              'assets/skincare.jpg',
              'assets/skin2.png',
              'assets/skin3.jpg',
              'assets/skincare4.png'
            ])));
          }),
          _createDrawerItem(icon: Icons.face_3_rounded, text: 'Cabelo', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ImageGridPage(title: 'Cabelo', imagePaths: [
              'assets/cabelo1.png',
              'assets/cabelo2.png',
              'assets/cabelo3.png',
              'assets/cabelo4.png'
            ])));
          }),
          _createDrawerItem(icon: Icons.face_2_outlined, text: 'Maquiagem', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ImageGridPage(title: 'Maquiagem', imagePaths: [
              'assets/maquiagem1.png',
              'assets/maquiagem2.png',
              'assets/maquiagem3.png',
              'assets/maquiagem4.png'
            ])));
          }),
          _createDrawerItem(icon: Icons.local_offer, text: 'Ofertas', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ImageGridPage(title: 'Ofertas', imagePaths: [
              'assets/oferta1.png',
              'assets/oferta2.png',
              'assets/oferta3.png',
              'assets/oferta4.png'
            ])));
          }),
          _createDrawerItem(icon: Icons.notifications, text: 'Notificações', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsPage()));
          }),
          _createDrawerItem(icon: Icons.person, text: 'Perfil', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          }),
          _createDrawerItem(icon: Icons.favorite, text: 'Favoritos', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ImageGridPage(title: 'Favoritos', imagePaths: [
              'assets/favoritos1.png',
              'assets/favoritos2.png',
              'assets/favoritos3.png',
              'assets/favoritos4.png'
            ])));
          }),
          _createDrawerItem(icon: Icons.history, text: 'Histórico de Compras', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ImageGridPage(title: 'Histórico de Compras', imagePaths: [
              'assets/historico1.png',
              'assets/historico2.png',
              'assets/historico3.png',
              'assets/historico4.png'
            ])));
          }),
          _createDrawerItem(icon: Icons.feedback, text: 'Feedback', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackPage()));
          }),
        ],
      ),
    );
  }

  Widget _createDrawerItem({required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(text, style: TextStyle(color: Colors.black)),
      onTap: onTap,
    );
  }
}

class ImageGridPage extends StatelessWidget {
  final String title;
  final List<String> imagePaths;

  ImageGridPage({required this.title, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.grey[800],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Card(
            child: Image.asset(
              imagePaths[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificações'),
        backgroundColor: Colors.grey[800],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Promoção de perfumes!',
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Desconto de 20% em todas as compras.'),
          ),
          ListTile(
            title: Text('Novo produto disponível!'),
            subtitle: Text('Confira nosso novo creme anti-idade.'),
          ),
          ListTile(
            title: Text('Ofertas especiais para você!'),
            subtitle: Text('Veja as melhores ofertas na sua área.'),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: Julia Daiane Zilio', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Email: juliazilio06@email.com', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Telefone: (54) 992647574', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ação de editar perfil
              },
              child: Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Seu Feedback é importante para nós!', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Digite seu feedback',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Ação de enviar feedback
              },
              child: Text('Enviar Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
