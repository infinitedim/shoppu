import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppu/components/custom_bottom_nav_bar.dart';
import 'package:shoppu/components/product_card.dart';
import 'package:shoppu/constants.dart';
import 'package:shoppu/enums.dart';
import 'package:shoppu/models/product_model.dart';
import 'package:shoppu/routes/routes.dart';
import 'package:shoppu/components/icon_btn_with_counter.dart';
import 'package:shoppu/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": FontAwesomeIcons.bolt, "text": "Flash Deal"},
      {"icon": FontAwesomeIcons.moneyBillTransfer, "text": "Bill"},
      {"icon": FontAwesomeIcons.gamepad, "text": "Game"},
      {"icon": FontAwesomeIcons.gift, "text": "Daily Gift"},
      {"icon": FontAwesomeIcons.magnifyingGlass, "text": "More"},
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(30)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: SizeConfig.screenWidth * 0.6,
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      onChanged: (value) => debugPrint(value),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20),
                          vertical: getProportionateScreenWidth(15),
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "Search product",
                        prefixIcon: const Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  IconBtnWithCounter(
                    icon: FontAwesomeIcons.cartShopping,
                    onTap: () => Navigator.pushNamed(context, cart),
                  ),
                  IconBtnWithCounter(
                    icon: FontAwesomeIcons.bell,
                    numOfitem: 3,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(getProportionateScreenWidth(20)),
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(15),
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF4A3298),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text.rich(
                TextSpan(
                  style: GoogleFonts.inter(color: Colors.white),
                  children: <InlineSpan>[
                    const TextSpan(text: "A Summer Surpise\n"),
                    TextSpan(
                      text: "Cashback 20%",
                      style: GoogleFonts.inter(
                        fontSize: getProportionateScreenWidth(24),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  categories.length,
                  (index) => CategoryCard(
                    icon: categories[index]["icon"],
                    text: categories[index]["text"],
                    onTap: () {},
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                  ),
                  child: SectionTitle(
                    title: "Special for you",
                    onTap: () {},
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(20)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      SpecialOfferCard(
                        image: "assets/Image Banner 2.png",
                        category: "Smartphone",
                        numOfBrands: 18,
                        onPressed: () {},
                      ),
                      SpecialOfferCard(
                        image: "assets/Image Banner 3.png",
                        category: "Fashion",
                        numOfBrands: 24,
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                  ),
                  child: SectionTitle(title: "Popular Products", onTap: () {}),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      ...List.generate(
                        demoProducts.length,
                        (index) {
                          if (demoProducts[index].isPopular) {
                            return ProductCard(
                              product: demoProducts[index],
                            );
                          }

                          return const SizedBox.shrink();
                        },
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: FaIcon(icon),
            ),
            const SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.onPressed,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: onPressed,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF343434).withOpacity(0.4),
                        const Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: GoogleFonts.inter(color: Colors.white),
                      children: <InlineSpan>[
                        TextSpan(
                          text: "$category\n",
                          style: GoogleFonts.inter(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "See More",
            style: GoogleFonts.inter(
              color: const Color(0xFFBBBBBB),
            ),
          ),
        ),
      ],
    );
  }
}
