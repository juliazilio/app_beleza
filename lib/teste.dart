import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String image;
  final String name;
  final String price;

  Product({
    required this.image,
    required this.name,
    required this.price,
  });
}

class Cart {
  List<Product> items = [];
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Product> products = [
    Product(image: 'imagens/scandal.jpeg', name: 'Scandal', price: 'R\$ 299,99'),
    Product(image: 'imagens/ysl.jpeg', name: 'Libre YSL', price: 'R\$ 259,99'),
    Product(image: 'imagens/goodgirl.jpeg', name: 'Good Girl', price: 'R\$ 349,99'),
    Product(image: 'imagens/perfumesf.jpg', name: 'Olympea', price: 'R\$ 299,99'),
    Product(image: 'imagens/missdior.jpg', name: 'Miss Dior', price: 'R\$ 419,99'),
    Product(image: 'imagens/chanel.png', name: 'Chanel', price: 'R\$ 519,99'),
  ];

  Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
        products: products,
        cart: cart,
        onAddToCart: (product) {
          setState(() {
            cart.items.add(product);
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${product.name} adicionado ao carrinho!')),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Product> products;
  final Cart cart;
  final Function(Product) onAddToCart;

  const HomeScreen({Key? key, required this.products, required this.cart, required this.onAddToCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: () {},
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
                    color: Colors.red,
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
      body: ProductGrid(products: products, onAddToCart: onAddToCart),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onAddToCart;

  const ProductGrid({Key? key, required this.products, required this.onAddToCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          product: products[index],
          onAddToCart: () => onAddToCart(products[index]),
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const ProductCard({Key? key, required this.product, required this.onAddToCart}) : super(key: key);

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
                  product.name,
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

  const CartScreen({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
      ),
      body: Container(
        color: Colors.grey, // Altera a cor da tela do carrinho para cinza
        child: cart.items.isEmpty
            ? Center(child: Text("O carrinho está vazio", style: TextStyle(color: Colors.black)))
            : Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final product = cart.items[index];
                  return Dismissible(
                    key: Key(product.name),
                    background: Container(color: Colors.red),
                    onDismissed: (direction) {
                      // Remover item do carrinho
                      cart.items.removeAt(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${product.name} removido do carrinho!')),
                      );
                    },
                    child: ListTile(
                      leading: Image.asset(product.image),
                      title: Text(product.name),
                      subtitle: Text(product.price),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Total: ${calculateTotal(cart.items)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Ação de finalizar compra
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Compra finalizada!')),
                      );
                    },
                    child: Text('Finalizar Compra'),
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
      ),
    );
  }

  String calculateTotal(List<Product> items) {
    double total = 0.0;
    for (var item in items) {
      total += double.parse(item.price.replaceAll(RegExp(r'[^\d,]'), '').replaceAll(',', '.'));
    }
    return 'R\$ ${total.toStringAsFixed(2).replaceAll('.', ',')}';
  }
}
