import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/main_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages/home/home_screen.dart';
import 'package:safeonvendor_flutter_repo/presentation/widgets/custom_bottom_navigation.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: controller.currentIndex.value,
          children: [
            // Home Tab
            const HomeScreen(),
            
            // Categories Tab
            _buildPlaceholderScreen('Categories', Icons.category),
            
            // Explore Tab
            _buildPlaceholderScreen('Explore', Icons.explore),
            
            // Account Tab
            _buildPlaceholderScreen('Account', Icons.person),
            
            // Cart Tab
            _buildPlaceholderScreen('Cart', Icons.shopping_cart),
          ],
        );
      }),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }

  Widget _buildPlaceholderScreen(String title, IconData icon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 100, color: Colors.grey),
          const SizedBox(height: 20),
          Text(
            '$title Screen',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text('Coming Soon!'),
        ],
      ),
    );
  }
}

