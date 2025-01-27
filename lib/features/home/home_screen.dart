import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newss_app/core/constants/assets.gen.dart';
import 'package:newss_app/core/extensions/context_extension.dart';
import 'package:newss_app/core/services/date_utils.dart';
import 'package:newss_app/features/drawer/custom_drawer.dart';

import 'widgets/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                'News App',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const CustomDrawer(),
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
                "Here is Some News For You",
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              CategoryCard(
                categoryImagePath: Assets.image.generalPng.path,
                onViewAllTab: () {},
                viewAllButtonIsRight: true,
              ),
              const SizedBox(height: 16),

              CategoryCard(
                categoryImagePath: Assets.image.buisness.path,
                onViewAllTab: () {},
                viewAllButtonIsRight: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
