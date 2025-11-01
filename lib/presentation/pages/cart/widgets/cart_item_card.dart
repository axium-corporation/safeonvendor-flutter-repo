import 'package:flutter/material.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';

class CartItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final bool isExpanded;
  final VoidCallback onToggleExpand;
  final VoidCallback onDelete;
  final VoidCallback onIncreaseQuantity;
  final VoidCallback onDecreaseQuantity;

  const CartItemCard({
    super.key,
    required this.item,
    required this.isExpanded,
    required this.onToggleExpand,
    required this.onDelete,
    required this.onIncreaseQuantity,
    required this.onDecreaseQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColor.pureWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 19,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Main Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image and Basic Info
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image
                    Container(
                      width: 75,
                      height: 85,
                      decoration: BoxDecoration(
                        color: AppColor.homeBackground,
                        border: Border.all(
                          color: Colors.black.withValues(alpha: 0.05),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          item['imageUrl'] ?? '',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.image_not_supported,
                              size: 40,
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Product Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Name
                          Text(
                            item['productName'] ?? '',
                            style: AppTextStyles.kInterTextStyle14with500(
                              const Color(0xFF060709),
                            ).copyWith(fontSize: 20, height: 1.3),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 6),

                          // Tags
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: (item['tags'] as List<String>).map((tag) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF2F6F4),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  tag,
                                  style: AppTextStyles.kInterTextStyle12with400(
                                    const Color(0xFF05422C),
                                  ).copyWith(height: 1.5),
                                ),
                              );
                            }).toList(),
                          ),

                          const SizedBox(height: 12),

                          // Price and Rating
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Price
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '₹ ${item['originalPrice']}',
                                      style:
                                          AppTextStyles.kInterTextStyle14with400(
                                            const Color(0xFF9D9EA2),
                                          ).copyWith(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            height: 1.5,
                                          ),
                                    ),
                                    Text(
                                      '₹ ${item['discountedPrice']}  | ${item['discount']}% OFF',
                                      style:
                                          AppTextStyles.kInterTextStyle14with500(
                                            const Color(0xFFEB2606),
                                          ).copyWith(fontSize: 16, height: 1.5),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 8),

                              // Rating
                              Flexible(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 14,
                                        color: const Color(0xFFF2BC1B),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${item['rating']}',
                                        style:
                                            AppTextStyles.kInterTextStyle14with400(
                                              const Color(0xFF060709),
                                            ).copyWith(height: 1.5),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Container(
                                        width: 1,
                                        height: 12,
                                        color: const Color(0xFFC8C9CB),
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          '${item['reviews']} Reviews',
                                          style:
                                              AppTextStyles.kInterTextStyle12with400(
                                                const Color(0xFF9D9EA2),
                                              ).copyWith(height: 1.5),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Delete Button
                    GestureDetector(
                      onTap: onDelete,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.delete_outline,
                          size: 24,
                          color: const Color(0xFFEB2606),
                        ),
                      ),
                    ),
                  ],
                ),

                // Expandable Section
                if (isExpanded) ...[
                  const SizedBox(height: 16),

                  // GST and Total
                  Text(
                    '₹${item['gst']} GST   |   ₹${item['totalWithTax']} (Incl. of all taxes)',
                    style: AppTextStyles.kInterTextStyle14with400(
                      const Color(0xFF9D9EA2),
                    ).copyWith(height: 1.5),
                  ),

                  const SizedBox(height: 16),

                  // Quantity Selector
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFF4F4F4),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Quantity',
                          style: AppTextStyles.kInterTextStyle12with400(
                            AppColor.pureBlack,
                          ).copyWith(height: 1.5),
                        ),
                        Container(
                          width: 1,
                          height: 20,
                          color: const Color(0xFFF4F4F4),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        Row(
                          children: [
                            // Decrease
                            GestureDetector(
                              onTap: onDecreaseQuantity,
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF4F4F4),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 16,
                                  color: AppColor.pureBlack,
                                ),
                              ),
                            ),

                            const SizedBox(width: 4),

                            // Quantity
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF4F4F4),
                                border: Border.all(
                                  color: const Color(0xFFF4F4F4),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${item['quantity']}',
                                style: const TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                  color: Color(0xFF060709),
                                ),
                              ),
                            ),

                            const SizedBox(width: 4),

                            // Increase
                            GestureDetector(
                              onTap: onIncreaseQuantity,
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF4F4F4),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 16,
                                  color: AppColor.pureBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Delivery Info
                  Row(
                    children: [
                      Text(
                        'Delivery by ${item['deliveryDate']}',
                        style: AppTextStyles.kInterTextStyle12with400(
                          AppColor.pureBlack,
                        ).copyWith(height: 1.5),
                      ),
                      Container(
                        width: 1,
                        height: 13,
                        color: const Color(0xFF95989A),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      Text(
                        item['deliveryCharge'] ?? 'FREE',
                        style: AppTextStyles.kInterTextStyle12with600(
                          const Color(0xFF249B3E),
                        ).copyWith(height: 1.5),
                      ),
                    ],
                  ),
                ],

                const SizedBox(height: 12),

                // Expand/Collapse Button
                GestureDetector(
                  onTap: onToggleExpand,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: 24,
                        color: AppColor.homePrimary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        isExpanded ? 'Hide Details' : 'View Details',
                        style: AppTextStyles.kInterTextStyle12with600(
                          AppColor.homePrimary,
                        ).copyWith(height: 1.5),
                      ),
                    ],
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
