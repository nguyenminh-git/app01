import 'package:flutter/material.dart';
class CartItem {
  final String name;
  final String size;
  final String color;
  final int price; // VND
  final String image; // demo image (network)
  int qty;

  CartItem({
    required this.name,
    required this.size,
    required this.color,
    required this.price,
    required this.image,
    this.qty = 1,
  });
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final promoCtrl = TextEditingController();

  final List<CartItem> items = [
    CartItem(
      name: 'Áo Thun Basic',
      size: 'M',
      color: 'Trắng',
      price: 150000,
      image:"assets/images/1iphone12.jpg",
      qty: 1,
    ),
    CartItem(
      name: 'Quần Jeans Slimfit',
      size: '30',
      color: 'Xanh',
      price: 350000,
      image:"assets/images/1iphone12.jpg",
      qty: 1,
    ),
  ];

  int shippingFreeThreshold = 150000;
  int shippingFee = 50000;
  int discount = 20000; // demo

  int get subtotal =>
      items.fold(0, (sum, it) => sum + (it.price * it.qty));

  int get shipping => subtotal >= shippingFreeThreshold ? 0 : shippingFee;

  int get total => subtotal + shipping - discount;

  String vnd(int n) {
    // format đơn giản: 480.000đ
    final s = n.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      final idxFromEnd = s.length - i;
      buf.write(s[i]);
      if (idxFromEnd > 1 && idxFromEnd % 3 == 1) buf.write('.');
    }
    return '${buf.toString()}đ';
  }

  @override
  void dispose() {
    promoCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top info
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Giỏ hàng (${items.length})',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      minHeight: 8,
                      value: (subtotal / shippingFreeThreshold).clamp(0.0, 1.0),
                      backgroundColor: Colors.grey.shade200,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtotal >= shippingFreeThreshold
                        ? 'Bạn đã được miễn phí vận chuyển'
                        : 'Mua thêm ${vnd(shippingFreeThreshold - subtotal)} để được miễn phí vận chuyển (${vnd(shippingFee)}/${vnd(0)})',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),

            // List items
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, i) {
                  final it = items[i];
                  return _CartItemCard(
                    item: it,
                    vnd: vnd,
                    onRemove: () {
                      setState(() => items.removeAt(i));
                    },
                    onMinus: () {
                      setState(() {
                        if (it.qty > 1) it.qty--;
                      });
                    },
                    onPlus: () {
                      setState(() => it.qty++);
                    },
                  );
                },
              ),
            ),

            // Promo + Summary + Pay
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    offset: const Offset(0, -4),
                    color: Colors.black.withOpacity(0.06),
                  )
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Tổng cộng:',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 2),
                            Text(
                              vnd(total < 0 ? 0 : total),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE91E63),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'THANH TOÁN',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF7F7F7),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  const _CartItemCard({
    required this.item,
    required this.vnd,
    required this.onRemove,
    required this.onMinus,
    required this.onPlus,
  });

  final CartItem item;
  final String Function(int) vnd;
  final VoidCallback onRemove;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              item.image,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 72,
                height: 72,
                color: Colors.grey.shade200,
                child: const Icon(Icons.image_not_supported_outlined),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: onRemove,
                      icon: const Icon(Icons.close),
                      visualDensity: VisualDensity.compact,
                    )
                  ],
                ),
                Text(
                  'Size: ${item.size}, Màu: ${item.color}',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      vnd(item.price),
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 16),
                    ),
                    const Spacer(),
                    _QtyControl(
                      qty: item.qty,
                      onMinus: onMinus,
                      onPlus: onPlus,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _QtyControl extends StatelessWidget {
  const _QtyControl({
    required this.qty,
    required this.onMinus,
    required this.onPlus,
  });

  final int qty;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onMinus,
            icon: const Icon(Icons.remove),
            visualDensity: VisualDensity.compact,
          ),
          Text('$qty', style: const TextStyle(fontWeight: FontWeight.w700)),
          IconButton(
            onPressed: onPlus,
            icon: const Icon(Icons.add),
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}