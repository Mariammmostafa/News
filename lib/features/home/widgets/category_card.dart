import 'package:flutter/material.dart';
import 'package:newss_app/core/extensions/context_extension.dart';

class CategoryCard extends StatelessWidget {
  final String categoryImagePath;
  final Function() onViewAllTab;
  final bool viewAllButtonIsRight;

  const CategoryCard({
    super.key,
    required this.categoryImagePath,
    required this.onViewAllTab,
    required this.viewAllButtonIsRight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onViewAllTab,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Image.asset(
            categoryImagePath,
            width: context.width,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: viewAllButtonIsRight
                ? Alignment.bottomRight
                : Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.all(15),
              alignment: viewAllButtonIsRight
                  ? Alignment.bottomRight
                  : Alignment.bottomLeft,
              height: 50,
              width: context.width * 0.40,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Directionality(
                textDirection: viewAllButtonIsRight
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      "View All",
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
