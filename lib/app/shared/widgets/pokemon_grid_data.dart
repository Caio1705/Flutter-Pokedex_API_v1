//        SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 1.4,
//         ),
//         itemCount: pokedex.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//               child: Text(
//             pokedex[index]['name'],
//           ));
//         },

        // const SliverGridDelegateWithMaxCrossAxisExtent(
        //   maxCrossAxisExtent: 200,
        //   childAspectRatio: 1,
        //   crossAxisSpacing: Constants.screenPadding,
        //   mainAxisSpacing: Constants.screenPadding,
        // ),
        // itemCount: myProducts.length,
        // itemBuilder: (
        //   BuildContext context,
        //   index,
        // ) {
        //   return Container(
        //     alignment: Alignment.center,
        //     decoration: BoxDecoration(
        //       color: Colors.amber,
        //       borderRadius: BorderRadius.circular(12),
        //     ),
        //     child: Text(
        //       myProducts[index]["name"],
        //     ),
        //   );
        // },

        //final List<Map> myProducts = List.generate(
        //   100,
        //   (index) => {
        //     "id": index + 1,
        //     "name": "Product ${index + 1}",
        //   },
        // ).toList();

          // void searchPokemonData() {
  //   var url = Uri.http(
  //     'raw.githubusercontent.com',
  //     '/Biuni/PokemonGO-Pokedex/master/pokedex.json',
  //   );
  //   http.get(url).then((value) {
  //     if (value.statusCode == 200) {
  //       var decodeJsonData = jsonDecode(value.body);
  //       pokedex = decodeJsonData['pokemon'];
  //       setState(() {});
  //     }
  //   });
  // }