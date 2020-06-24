import 'package:flutter/material.dart';
import 'package:flutter_card/pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Products(this.products,{this.deleteProduct}) {
    print('[Products Widget] Constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.push<bool>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(products[index]['title'],
                           products[index]['image']),
                        ),
                      ).then((bool value) {
                        if (value) {
                          deleteProduct(index);
                        }
                      }),
                  child: Text('Details'))
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard = Center(child: Text('No products Found'));

    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return _buildProductList();
  }
}
