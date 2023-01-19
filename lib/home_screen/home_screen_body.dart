import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_flavour_ex/constants.dart';
import 'package:flutter_flavour_ex/product_screen/product_details_screen.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("body build");
    return SingleChildScrollView(
      child: Column(
        children: [
          const Banner(),
          MultichoiceFilter(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GridView.builder(
                itemCount: 10,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.95,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductDetails())),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            height: 130,
                            width: double.infinity,
                            child: Image.network(
                              "https://images.unsplash.com/photo-1544441893-675973e31985?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text("Simple fashion: Summer collection",
                                maxLines: 2, overflow: TextOverflow.ellipsis),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class Banner extends StatefulWidget {
  const Banner({
    Key? key,
  }) : super(key: key);

  @override
  State<Banner> createState() => _BannerState();
}

class _BannerState extends State<Banner> {
  final PageController controller = PageController();
  int currentPage = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer.periodic(const Duration(seconds: 3), (timer) {
        setState(() {
          if (currentPage < 3) {
            currentPage++;
            controller.animateToPage(currentPage,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
          } else {
            currentPage = 0;
            controller.jumpToPage(0);
          }
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: PageView.builder(
            itemCount: 4,
            controller: controller,
            onPageChanged: (value) => setState(() {
              currentPage = value;
            }),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1448387473223-5c37445527e7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1800&q=80",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 30,
          child: ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    });
                  },
                  child: AnimatedContainer(
                    height: (currentPage == index) ? 12 : 10,
                    width: (currentPage == index) ? 12 : 10,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: (currentPage == index)
                            ? ColorConstant.black
                            : ColorConstant.lightGrey,
                        shape: BoxShape.circle),
                    duration: const Duration(milliseconds: 300),
                  ),
                );
              }),
        )
      ],
    );
  }
}

class MultichoiceFilter extends StatelessWidget {
  MultichoiceFilter({
    Key? key,
  }) : super(key: key);

  final List<String> options = [
    "Men",
    "Women",
    "Kids",
    "Sports",
    "Casual",
    "Formal"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: options.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ChoiceChipFilter(
              options: options,
              i: i,
            );
          }),
    );
  }
}

class ChoiceChipFilter extends StatefulWidget {
  const ChoiceChipFilter({
    Key? key,
    required this.options,
    required this.i,
  }) : super(key: key);

  final List<String> options;
  final int i;

  @override
  State<ChoiceChipFilter> createState() => _ChoiceChipFilterState();
}

class _ChoiceChipFilterState extends State<ChoiceChipFilter> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ChoiceChip(
        selectedColor: ColorConstant.black,
        backgroundColor: ColorConstant.lightGrey,
        labelStyle: TextStyle(
            color: isSelected ? (ColorConstant.white) : ColorConstant.black),
        label: Text(widget.options[widget.i]),
        selected: isSelected,
        onSelected: (value) => setState(() {
          isSelected = !isSelected;
        }),
      ),
    );
  }
}
