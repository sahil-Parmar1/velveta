import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velveta/state/providers.dart';
import 'package:velveta/utils/colors.dart';
import 'package:velveta/utils/textstyles.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velveta/utils/shimmer_template.dart';


class Menu_Bar extends ConsumerWidget {
  const Menu_Bar({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final hoverData=ref.watch(hoverProvider);
    return MouseRegion(
      onEnter: (_) =>  ref.read(hoverProvider.notifier).state=ref.read(hoverProvider).copyWith(isHovering: true),
      onExit: (_) => ref.read(hoverProvider.notifier).state=ref.read(hoverProvider).copyWith(isHovering: false),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 30.0,bottom: 50),
            constraints: BoxConstraints(
                maxWidth: 1000
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    _buildcategory(),
                    _buildFeatured(),
                    _buildMore(),
                    Imagemenu(count: 2, names: ["Plus size","Blouses"])
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildcategory()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Category",style: TextstylesDesktop.menulabelstyle,),
        SizedBox(height: 24,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Shop All",style: TextstylesDesktop.submenulabelstyle,),
            SizedBox(height: 8),
            Text("Boluses & Top",style: TextstylesDesktop.submenulabelstyle,),
            SizedBox(height: 8),
            Text("Pants",style: TextstylesDesktop.submenulabelstyle,),
            SizedBox(height: 8),
            Text("Dresses & Jumpsuits",style: TextstylesDesktop.submenulabelstyle,),
            SizedBox(height: 8),
            Text("Outwear & Jackets",style: TextstylesDesktop.submenulabelstyle,),
            SizedBox(height: 8),
            Text("Pullovers",style: TextstylesDesktop.submenulabelstyle,),
          ],
        )
      ],
    );
  }

  //featured
  Widget _buildFeatured()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Featured",style: TextstylesDesktop.menulabelstyle,),
        SizedBox(height: 24,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New In",style: TextstylesDesktop.submenulabelstyle,),
            SizedBox(height: 8),
            Text("Velvetaweek",style: TextstylesDesktop.submenulabelstyle,),
            SizedBox(height: 8),
            Text("Plus Size",style: TextstylesDesktop.submenulabelstyle,),
            SizedBox(height: 8),
            Text("Best Seller",style: TextstylesDesktop.submenulabelstyle,),
          ],
        )
      ],
    );
  }

  //more
  Widget _buildMore()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("More",style: TextstylesDesktop.menulabelstyle,),
        SizedBox(height: 24,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bundles",style: TextstylesDesktop.submenulabelstyle,),
            SizedBox(height: 8),
            Text("Occasion Wear",style: TextstylesDesktop.submenulabelstyle,),
            SizedBox(height: 8),
            Text("Matching Set",style: TextstylesDesktop.submenulabelstyle,),
            SizedBox(height: 8),
            Text("Suiting",style: TextstylesDesktop.submenulabelstyle,),
          ],
        )
      ],
    );
  }


}

class Imagemenu extends StatefulWidget {
  final int count;
  final List<String> names;

  Imagemenu({super.key,required this.count,required this.names});

  @override
  State<Imagemenu> createState() => _ImagemenuState();
}

class _ImagemenuState extends State<Imagemenu> {
  late Future<List<String>> imageUrlsFuture;

  @override
  void initState()
  {
    super.initState();
    imageUrlsFuture=_fetchImageUrls(widget.names);
  }

  Future<List<String>> _fetchImageUrls(List<String> names) async {
    final firestore = FirebaseFirestore.instance;
    List<String> imageUrls = [];

    for (String name in names) {
      try {
        DocumentSnapshot doc =
        await firestore.collection('demo').doc(name).get();

        if (doc.exists && doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          imageUrls.add(data['image'] ?? '');
        } else {
          imageUrls.add(''); // or placeholder URL
        }
      } catch (e) {
        imageUrls.add('');
        debugPrint('Error fetching image for $name: $e');
      }
    }

    return imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: imageUrlsFuture,
        builder: (context,snapshot){
       if(snapshot.connectionState==ConnectionState.waiting)
         return Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: List.generate(widget.count, (index){
             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   buildShimmer(height: 420, width: 288,color: AppColors.Shimmer),
                   SizedBox(height: 10,),
                   buildShimmer(height: 20, width: 100,color: AppColors.Shimmer)
                 ],
               ),
             );
           }),
         );
       else if (snapshot.hasError)
         return Text("Error:${snapshot.error}");

       final urls=snapshot.data ?? [];
       return Row(
         children: List.generate(widget.count, (index){
           final url=urls[index];
           return  Padding(
             padding: const EdgeInsets.only(right: 12.0), // spacing between items
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 url.isNotEmpty
                     ? Image.network(
                   url,
                   fit: BoxFit.cover,
                   width: 288,
                   height: 420,
                   errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                   loadingBuilder: (context, child, loadingProgress) {
                     if (loadingProgress == null) return child;
                     return const Center(child: CircularProgressIndicator());
                   },
                 )
                     : const Placeholder(),
                 const SizedBox(height: 8),
                 Text(
                   "${widget.names[index]}",
                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                 ),
               ],
             ),
           );
         }),
       );



        }

      );
  }
}

