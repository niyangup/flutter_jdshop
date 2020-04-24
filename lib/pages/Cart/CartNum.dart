import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../services/ScreenAdapter.dart';
import 'package:provider/provider.dart';
import '../../provider/Cart.dart';

class CartNum extends StatefulWidget {
  Map _itemData;
  CartNum(this._itemData,{Key key}) : super(key: key);

  _CartNumState createState() => _CartNumState();
}

class _CartNumState extends State<CartNum> {
  Map _itemData;
  var cartProvider;
  
  @override
  Widget build(BuildContext context) {

    //注意
    this._itemData=widget._itemData;

    this.cartProvider = Provider.of<Cart>(context);

    return Container(
      width: ScreenAdapter.width(168),
      decoration:
          BoxDecoration(border: Border.all(width: ScreenAdapter.width(2), color: Colors.black12)),
      child: Row(
        children: <Widget>[
          _leftBtn(),
          _centerArea(),
          _rightBtn()
        ],
      ),
    );
  }

  //左侧按钮

  Widget _leftBtn() {
    return InkWell(
      onTap: () {
        if(_itemData["count"]>1){
           _itemData["count"]--;
           this.cartProvider.itemCountChange();
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: ScreenAdapter.width(45),
        height: ScreenAdapter.height(45),
        child: Text("-"),
      ),
    );
  }

  //右侧按钮
  Widget _rightBtn() {
    return InkWell(
      onTap: (){
           _itemData["count"]++;
          this.cartProvider.itemCountChange();
      },
      child: Container(
        alignment: Alignment.center,
        width: ScreenAdapter.width(45),
        height: ScreenAdapter.height(45),
        child: Text("+"),
      ),
    );
  }

//中间
  Widget _centerArea() {
    return Container(
      alignment: Alignment.center,
      width: ScreenAdapter.width(70),
      decoration: BoxDecoration(
          border: Border(
        left: BorderSide(width: ScreenAdapter.width(2), color: Colors.black12),
        right: BorderSide(width: ScreenAdapter.width(2), color: Colors.black12),
      )),
      height: ScreenAdapter.height(45),
      child: Text("${_itemData["count"]}"),
    );
  }
}
