import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final String productName;
  final List<String> productImages;
  final double productPrice;

  ProductDetailPage({
    required this.productName,
    required this.productImages,
    required this.productPrice,
  });

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Detail", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 **Image Carousel with Dots**
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: 280,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.productImages.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            widget.productImages[index],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),

                  /// 🔹 **Dot Indicator**
                  Positioned(
                    bottom: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(widget.productImages.length, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: _currentPage == index ? 10 : 6,
                          height: _currentPage == index ? 10 : 6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index ? Colors.white : Colors.white54,
                          ),
                        );
                      }),
                    ),
                  ),

                  /// 🔹 **Next Image Button (Arrow)**
                  Positioned(
                    right: 20,
                    bottom: 30,
                    child: GestureDetector(
                      onTap: () {
                        if (_currentPage < widget.productImages.length - 1) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Icon(Icons.arrow_forward, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              /// 🔹 **Color Selection**
              Text("Color", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Row(
                children: [
                  _buildColorOption(Colors.brown[200]!),
                  _buildColorOption(Colors.brown),
                  _buildColorOption(Colors.black),
                ],
              ),

              SizedBox(height: 20),

              /// 🔹 **Price & Description Box**
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Row(
                  children: [
                    /// **Price**
                    Text(
                      "\$${widget.productPrice.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 16),

                    /// **Vertical Divider**
                    Container(
                      width: 1,
                      height: 50,
                      color: Colors.grey[300],
                    ),
                    SizedBox(width: 16),

                    /// **Description**
                    Expanded(
                      child: Text(
                        "Inspired by the footstools found in club spaces and bedrooms at Soho House",
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              /// 🔹 **Buy Now Button**
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text("Buy Now", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),

      /// 🔹 **Bottom Navigation Bar**
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          BottomNavigationBarItem(
            icon: CircleAvatar(radius: 12, backgroundColor: Colors.grey),
            label: '',
          ),
        ],
      ),
    );
  }

  /// 🟡 **Color Selection Widget**
  Widget _buildColorOption(Color color) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[400]!),
      ),
    );
  }
}
