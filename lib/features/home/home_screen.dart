import 'package:flutter/material.dart';
import 'package:newss_app/core/constants/assets.gen.dart';
import 'package:newss_app/core/extensions/context_extension.dart';
import 'package:newss_app/core/routing/routes.dart';
import 'package:newss_app/core/services/date_utils.dart';
import 'package:newss_app/features/drawer/custom_drawer.dart';

import 'widgets/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
        ),
        centerTitle: true,
        leading: const LeadingIcon(),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: context.isDark ? Colors.white : Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  'News App',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            CustomDrawer(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateService.getMessageByData(),
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Here is Some News For You!",
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(height: 16),
              CategoryCard(
                categoryImagePath: Assets.image.generalPng.path,
                onViewAllTab: () {
                  context.goToNamed(
                    Routes.categoryNews,
                    arguments: "general",
                  );
                },
                viewAllButtonIsRight: true,
              ),
              const SizedBox(height: 16),
              CategoryCard(
                categoryImagePath: Assets.image.buisn.path,
                onViewAllTab: () {
                  context.goToNamed(
                    Routes.categoryNews,
                    arguments: "business",
                  );
                },
                viewAllButtonIsRight: false,
              ),
              const SizedBox(height: 16),
              CategoryCard(
                categoryImagePath: Assets.image.sports.path,
                onViewAllTab: () {
                  context.goToNamed(
                    Routes.categoryNews,
                    arguments: "sports",
                  );
                },
                viewAllButtonIsRight: true,
              ),
              const SizedBox(height: 16),
              CategoryCard(
                categoryImagePath: Assets.image.technology.path,
                onViewAllTab: () {
                  context.goToNamed(
                    Routes.categoryNews,
                    arguments: "technology",
                  );
                },
                viewAllButtonIsRight: false,
              ),
              const SizedBox(height: 16),
              CategoryCard(
                categoryImagePath: Assets.image.enterm.path,
                onViewAllTab: () {
                  context.goToNamed(
                    Routes.categoryNews,
                    arguments: "entertainment",
                  );
                },
                viewAllButtonIsRight: true,
              ),
              const SizedBox(height: 16),
              CategoryCard(
                categoryImagePath: Assets.image.health.path,
                onViewAllTab: () {
                  context.goToNamed(
                    Routes.categoryNews,
                    arguments: "health",
                  );
                },
                viewAllButtonIsRight: false,
              ),
              const SizedBox(height: 16),
              CategoryCard(
                categoryImagePath: Assets.image.sience.path,
                onViewAllTab: () {
                  context.goToNamed(
                    Routes.categoryNews,
                    arguments: "science",
                  );
                },
                viewAllButtonIsRight: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LeadingIcon extends StatelessWidget {
  const LeadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.menu,
        color: context.isDark ? Colors.white : Colors.black,
      ),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
