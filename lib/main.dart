import 'package:flutter/material.dart';
import 'meu_drawer.dart'; // Importe a classe MeuDrawer

void main() {
  runApp(MyApp());
}

class Product {
  final String image;
  final String text;
  final String price;

  Product({
    required this.image,
    required this.text,
    required this.price,
  });
}

class Cart {
  List<Product> items = [];
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade200, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo ao Virtual Beauty!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Adicione aqui a lógica de autenticação
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text('Entrar'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Navegar para a tela de registro ou redefinição de senha
                },
                child: Text('Esqueceu a senha?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    'perfumesimportados.png',
    'maquiagem.png',
    'skincare.jpg',
  ];

  final List<Product> products = [
    Product(
      image: 'scand.png',
      text: 'Scandal',
      price: 'R\$ 299,99',
    ),
    Product(
      image: 'libre.png',
      text: 'Libre YSL',
      price: 'R\$ 259,99',
    ),
    Product(
      image: 'goodgirl1png',
      text: 'Good Girl',
      price: 'R\$ 349,99',
    ),
    Product(
      image: 'olypea1.png',
      text: 'Olympea',
      price: 'R\$ 299,99',
    ),
    Product(
      image: 'missdior2.jpg',
      text: 'Miss Dior',
      price: 'R\$ 419,99',
    ),
    Product(
      image: 'chanel1.png',
      text: 'Chanel',
      price: 'R\$ 519,99',
    ),
  ];

  Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfileScreen()),
              );
            },
            icon: Icon(Icons.account_circle),
            color: Colors.white,
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen(cart: cart)),
                  );
                },
                icon: Icon(Icons.shopping_bag_outlined),
                color: Colors.white,
              ),
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Text(
                    '${cart.items.length}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
        centerTitle: true,
        title: Text("Virtual Beauty"),
      ),
      drawer: MeuDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Pesquisar",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600, size: 20),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey.shade100),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Novidades",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    child: PageView.builder(
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Perfumes Femininos",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return GridItem(
                        product: products[index],
                        onAddToCart: () {
                          addToCart(products[index]);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addToCart(Product product) {
    setState(() {
      cart.items.add(product);
    });
  }
}

class GridItem extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const GridItem({Key? key, required this.product, required this.onAddToCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  product.price,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: onAddToCart,
                  child: Text('Adicionar ao Carrinho'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    onPrimary: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  final Cart cart;

  CartScreen({required this.cart});

  @override
  Widget build(BuildContext context) {
    double total = cart.items.fold(0, (sum, item) {
      return sum + double.parse(item.price.replaceAll('R\$', '').replaceAll(',', '.').trim());
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
        backgroundColor: Colors.grey,
      ),
      body: cart.items.isEmpty
          ? Center(child: Text("O carrinho está vazio"))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final product = cart.items[index];
                return ListTile(
                  leading: Image.asset(product.image),
                  title: Text(product.text),
                  subtitle: Text(product.price),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Remover o item do carrinho
                      cart.items.removeAt(index);
                      // Atualizar a interface
                      (context as Element).markNeedsBuild(); // Força a reconstrução
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Total: R\$ ${total.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Adicione a lógica de finalização da compra aqui
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Compra finalizada com sucesso!")),
              );
            },
            child: Text('Finalizar Compra'),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              onPrimary: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}

// Tela de perfil do usuário
class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Perfil"),
        backgroundColor: Colors.grey,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Meus Dados"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserDataScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Meus Pedidos"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyOrdersScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Configurações"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Sair"),
            onTap: () {
              // Lógica para sair da conta
              Navigator.pop(context); // Apenas para voltar à tela anterior
            },
          ),
        ],
      ),
    );
  }
}

// Tela de Dados do Usuário
class UserDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Dados"),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nome: Julia Daiane Zilio ", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("E-mail: juliazilio06@email.com", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para editar dados do usuário
              },
              child: Text("Editar Dados"),
              style: ElevatedButton.styleFrom(primary: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// Tela de Meus Pedidos
class MyOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Pedidos"),
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
        itemCount: 3, // Exemplo com 3 pedidos
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Pedido ${index + 1}"),
            subtitle: Text("Detalhes do pedido..."),
            onTap: () {
              // Lógica para ver detalhes do pedido
            },
          );
        },
      ),
    );
  }
}

// Tela de Configurações
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
        backgroundColor: Colors.grey,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text("Alterar Senha"),
            onTap: () {
              // Lógica para alterar a senha
            },
          ),
          ListTile(
            title: Text("Notificações"),
            onTap: () {
              // Lógica para gerenciar notificações
            },
          ),
        ],
      ),
    );
  }
}
