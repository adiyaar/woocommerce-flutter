import 'package:flutter/material.dart';
import 'package:nyoba/pages/search/QRScanner.dart';
import 'package:nyoba/provider/GeneralSettingsProvider.dart';
import 'package:nyoba/provider/SearchProvider.dart';
import 'package:nyoba/utils/utility.dart';
import 'package:nyoba/widgets/product/ListItemProduct.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = new TextEditingController();

  int count = 5;

  search() async {
    await Provider.of<SearchProvider>(context, listen: false)
        .searchProducts(searchController.text);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    final settingProvider = Provider.of<GeneralSettingsProvider>(context, listen: false);

    Widget buildProduct = Container(
      child: ListenableProvider.value(
        value: searchProvider,
        child: Consumer<SearchProvider>(builder: (context, value, child) {
          if (value.loadingSearch) {
            return Center(
              child: customLoading(),
            );
          }
          if (value.listSearchProducts.isEmpty) {
            return buildSearchEmpty();
          }
          return Container(
            child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: value.listSearchProducts.length,
                itemBuilder: (context, i) {
                  return ListItemProduct(
                    itemCount: value.listSearchProducts.length,
                    product: value.listSearchProducts[i],
                    i: i,
                  );
                }),
          );
        }),
      ),
    );
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: settingProvider.isBarcodeActive,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => QRScanner()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: primaryColor),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                    child: Container(
                        height: 30,
                        padding: EdgeInsets.all(5),
                        child: Image.asset("images/search/barcode_icon.png")
                    )
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "SCAN BARCODE",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(),
            child: Container(
                height: 70,
                padding: EdgeInsets.only(right: 10, top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {});
                          search();
                        },
                        style: TextStyle(fontSize: 14),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          isDense: true,
                          isCollapsed: true,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(5),
                            ),
                          ),
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search",
                          hintStyle: TextStyle(fontSize: responsiveFont(10)),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: searchController.text.isNotEmpty,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            searchController.clear();
                          });
                          search();
                        },
                        icon: Icon(Icons.cancel),
                        color: primaryColor,
                      ),
                    )
                  ],
                ))),
      ),
      body: Column(
        children: [
          Expanded(
            child: buildProduct,
          )
        ],
      ),
    );
  }

  Widget appBar() {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(),
        child: Container(
            height: 70,
            padding: EdgeInsets.only(right: 10, top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {});
                      search();
                    },
                    style: TextStyle(fontSize: 14),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      isDense: true,
                      isCollapsed: true,
                      filled: true,
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5),
                        ),
                      ),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      hintStyle: TextStyle(fontSize: responsiveFont(10)),
                    ),
                  ),
                ),
                Visibility(
                  visible: searchController.text.isNotEmpty,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        searchController.clear();
                      });
                      search();
                    },
                    icon: Icon(Icons.cancel),
                    color: primaryColor,
                  ),
                )
              ],
            )));
  }

  Widget buildSearchEmpty() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/search/search_empty.png",
            height: 250,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              searchController.text.isEmpty
                  ? "Search Products Here"
                  : "Can't find the products",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
