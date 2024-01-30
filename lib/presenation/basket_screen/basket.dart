import 'package:flutter/material.dart';
import 'package:mytexnomart/data/source/model/data/special_product_item_data.dart';

import '../../utils/hive_helper.dart';

class BasketItem extends StatefulWidget {
  final SpecialItemData product;
  final VoidCallback onDelete;

  const BasketItem({Key? key, required this.product, required this.onDelete})
      : super(key: key);

  @override
  _BasketItemState createState() => _BasketItemState();
}

class _BasketItemState extends State<BasketItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 120,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Image.network(widget.product.image ?? ''),
          ),
        ),

        Column(
          children: [
            SizedBox(
              width: 160,
              child: Text(
                widget.product.name ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ),
            // SizedBox(
            //   width: 160,
            //   child:
            //   // Text(
            //   //   "${widget.product.value ?? ''} сум",
            //   //   overflow: TextOverflow.ellipsis,
            //   //   textAlign: TextAlign.start,
            //   //   style: TextStyle(
            //   //     fontWeight: FontWeight.w700,
            //   //     fontSize: 14,
            //   //   ),
            //   // ),
            // ),
            Container(
              width: 160,
              decoration: BoxDecoration(
                color: const Color(0x15000000),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 2.0,
                  left: 5.0,
                  bottom: 2.0,
                  right: 3,
                ),
                child: Text(
                  widget.product.salePrice.toString() ?? '',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 48.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      bool success = await HiveHelper.addProductToFavourite(
                          widget.product);
                      if (success) {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      } else {
                        // Обработка ошибки, если не удалось выполнить операцию
                      }
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                  ),
                  InkWell(
                    onTap: widget.onDelete,
                    child: const Icon(Icons.delete_outlined),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
