import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/models/cart.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Cart', style: Theme.of(context).textTheme.headline1),
      ),
      body: Container(
          color: Colors.yellow,
          child: Column(
            children: const [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: _CartList(),
                ),
              ),
              Divider(
                height: 4,
                color: Colors.black,
              ),
              _CartTotal(),
            ],
          )),
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemNamesStyle = Theme.of(context).textTheme.headline6;
    var cart = context.watch<CartModel>();

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          onPressed: () => cart.remove(cart.items[index]),
          icon: const Icon(Icons.remove_circle_outline),
        ),
        title: Text(
          cart.items[index].name,
          style: itemNamesStyle,
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hugeStyle =
        Theme.of(context).textTheme.headline1!.copyWith(fontSize: 48);
    return SizedBox(
      height: 200,
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<CartModel>(
            builder: ((context, cart, child) => Text(
                  '\$${cart.totalPrice}',
                  style: hugeStyle,
                )),
          ),
          const SizedBox(width: 24),
          TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Buying not supported yet')));
              },
              style: TextButton.styleFrom(
                  primary: Colors.black, backgroundColor: Colors.white),
              child: const Text('BUY'))
        ],
      )),
    );
  }
}
