import 'package:flutter/material.dart';
import 'package:shimmer_effect/shimmer_effect.dart';

import '../components/card_list_item.dart';
import '../components/circle_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var _isLoading = true;

  @override
  void initState() {
    super.initState();
    _restart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer Effect Sample'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16.0),
          _buildTopRowItem(),
          const SizedBox(height: 16.0),
          _buildListItem(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _restart,
        tooltip: 'Restart',
        child: const Icon(Icons.restart_alt),
      ), // This trailing co,
    );
  }

  void _restart() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 5)).then((value) {
      setState(() => _isLoading = false);
    });
  }

  Widget _buildTopRowItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildCircleItem(),
          const SizedBox(width: 16.0),
          _buildCircleItem(),
        ],
      ),
    );
  }

  Widget _buildCircleItem() {
    return ShimmerLoading(
      isLoading: _isLoading,
      child: const CircleListItem(),
    );
  }

  Widget _buildListItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ShimmerLoading(
        isLoading: _isLoading,
        child: CardListItem(isLoading: _isLoading),
      ),
    );
  }
}
