import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_flavour_ex/constants.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String? gender;
  final ScrollController _scrollController = ScrollController();
  double pos = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.addListener(() {
        setState(() {
          pos = _scrollController.offset;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        /* height: setHeight(size, pos),
                        width: setwidth(size, pos), */
                        height: size.height * 0.6,
                        width: size.width,
                        child: Image.network(
                          "https://images.unsplash.com/photo-1543508282-6319a3e2621f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2815&q=80",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                      child: Text(
                        "Uniqlo Co",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                      child: Text(
                        "Sweeter Airism Technology",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                      child: Text(
                        "\$29.12",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.black45)),
                      child: Row(
                        children: const [
                          Text(
                            "Size",
                            style: TextStyle(fontSize: 16),
                          ),
                          Spacer(),
                          Text(
                            "M",
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    ProductTopBarIcon(
                      icon: Icons.arrow_back_ios,
                      isAddPadding: true,
                      onTap: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    ProductTopBarIcon(
                      icon: Icons.favorite_border_outlined,
                      isAddPadding: false,
                      onTap: () {},
                    ),
                    ProductTopBarIcon(
                      icon: Icons.share,
                      isAddPadding: false,
                      onTap: () {},
                    )
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(0, -10),
                    blurRadius: 5)
              ]),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.purple,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: ColorConstant.black,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                        child: Text(
                          "Buy Now",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  double setHeight(Size size, double pos) {
    double height = size.height * 0.6 - pos;

    if (height > size.height * 0.1) {
      return height;
    } else {
      return size.height * 0.1;
    }
  }

  double setwidth(Size size, double pos) {
    double width = size.width - pos;

    if (width > size.width * 0.2) {
      return width;
    } else {
      return size.width * 0.2;
    }
  }
}

class ProductTopBarIcon extends StatelessWidget {
  const ProductTopBarIcon(
      {Key? key,
      required this.icon,
      required this.isAddPadding,
      required this.onTap})
      : super(key: key);
  final IconData icon;
  final bool isAddPadding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: (isAddPadding) ? const EdgeInsets.only(left: 5) : null,
        backgroundColor: ColorConstant.white, // <-- Button color
        foregroundColor: Colors.red, // <-- Splash color
      ),
      child: Icon(
        icon,
        color: ColorConstant.black,
        size: 20,
      ),
    );
  }
}
