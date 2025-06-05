import 'package:flutter/material.dart';

class CartProduct {
  final String name;
  final String imageUrl;
  final int price;
  int quantity;

  CartProduct({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartProduct> _cartProducts = [
    CartProduct(
      name: 'Money Plant In Sleek Green Pot',
      imageUrl: 'assets/categories/plants.png',
      price: 699,
      quantity: 2,
    ),
    CartProduct(
      name: 'Lucky Bamboo With Glass Pot',
      imageUrl: 'assets/suggested/bamboo_plant.png',
      price: 599,
      quantity: 1,
    ),
    CartProduct(
      name: 'Lucky Bamboo With Glass Pot',
      imageUrl: 'assets/suggested/choco_cake.png',
      price: 349,
      quantity: 1,
    ),
    CartProduct(
      name: 'Lucky Bamboo With Glass Pot',
      imageUrl: 'assets/suggested/choco_cake.png',
      price: 349,
      quantity: 1,
    )

  ];

  final int deliveryCharge = 19;
  final int convenienceCharge = 39;
  final int discount = 150;

  int get productPrice =>
      _cartProducts.fold(0, (sum, item) => sum + item.price * item.quantity);

  int get subtotal => productPrice - discount;

  int get total =>
      (subtotal > 0 ? subtotal : 0) + deliveryCharge + convenienceCharge;

  void _increaseQuantity(int index) {
    setState(() {
      _cartProducts[index].quantity++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (_cartProducts[index].quantity > 1) {
        _cartProducts[index].quantity--;
      } else {
        _cartProducts.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isEmpty = _cartProducts.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isEmpty
          ? const Center(
        child: Text(
          "🛒 Your cart is empty",
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const StepIndicator(),
                  const LocationCard(),
                  ListView.builder(
                    itemCount: _cartProducts.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final product = _cartProducts[index];
                      return CartItem(
                        product: product,
                        onIncrease: () => _increaseQuantity(index),
                        onDecrease: () => _decreaseQuantity(index),
                      );
                    },
                  ),
                  const DeliveryInfo(),
                  PriceDetails(
                    productPrice: productPrice,
                    discount: discount,
                    deliveryCharge: deliveryCharge,
                    convenienceCharge: convenienceCharge,
                  ),
                ],
              ),
            ),
          ),
          CartBottomBar(total: total),
        ],
      ),
    );
  }
}

class StepIndicator extends StatelessWidget {
  const StepIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.shopping_cart, color: Colors.green),
          Icon(Icons.local_shipping_outlined, color: Colors.grey),
          Icon(Icons.currency_rupee, color: Colors.grey),
        ],
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.location_on_outlined),
      title: const Text('Basti, Uttar Pradesh'),
      tileColor: Colors.grey.shade100,
    );
  }
}

class CartItem extends StatelessWidget {
  final CartProduct product;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItem({
    super.key,
    required this.product,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                product.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₹${product.price}',
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          product.quantity == 1
                              ? Icons.delete_outline
                              : Icons.remove,
                          size: 20,
                        ),
                        onPressed: onDecrease,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          product.quantity.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, size: 20),
                        onPressed: onIncrease,
                      ),
                    ],
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

class DeliveryInfo extends StatelessWidget {
  const DeliveryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.calendar_today_outlined),
      title: const Text('11th Jun, 09:00 am - 09:00 pm'),
      subtitle: const Text('Courier ₹19'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
    );
  }
}

class PriceDetails extends StatelessWidget {
  final int productPrice;
  final int discount;
  final int deliveryCharge;
  final int convenienceCharge;

  const PriceDetails({
    super.key,
    required this.productPrice,
    required this.discount,
    required this.deliveryCharge,
    required this.convenienceCharge,
  });

  @override
  Widget build(BuildContext context) {
    int subtotal = productPrice - discount;
    int finalAmount =
        (subtotal > 0 ? subtotal : 0) + deliveryCharge + convenienceCharge;

    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _priceRow("Total Product Price", "₹$productPrice"),
            _priceRow("Discount On MRP", "-₹$discount", color: Colors.green),
            _priceRow("Delivery Charges", "₹$deliveryCharge"),
            _priceRow("Convenience Charge", "₹$convenienceCharge"),
            const Divider(),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              color: Colors.green.shade50,
              child: Text(
                "🎉 You are saving ₹$discount on this order",
                style: const TextStyle(color: Colors.green),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _priceRow(String title, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value, style: TextStyle(color: color ?? Colors.black)),
        ],
      ),
    );
  }
}

class CartBottomBar extends StatelessWidget {
  final int total;

  const CartBottomBar({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("₹$total",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const Text("View price details",
                    style: TextStyle(color: Colors.green)),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade700,
              padding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () {},
            child: const Text("Proceed"),
          )
        ],
      ),
    );
  }
}
