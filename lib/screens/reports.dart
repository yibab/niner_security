import 'package:flutter/material.dart';
import 'package:niner_security/widgets/footer.dart';

import '../db/address.dart';
import '../widgets/niner_text.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  late List collections;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCollections();
  }

  Future<void> fetchCollections() async {
    try {
      final records = await pb.collection("reports").getFullList(
        sort: '-created',
      );
      setState(() {
        collections = records; // Assuming response.items is a List<Collection>
        isLoading = false;
      });
    } catch (e) {
      // Handle error
      print('Error fetching collections: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFCCFFDD),
      appBar: AppBar(
        flexibleSpace: Stack(
          children: [
            Container(
              color: Color(0xFF00703C),
            ),
            Opacity(opacity: .3,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
        title: const NinerText(),
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
              itemCount: collections.length,
              itemBuilder: (context, index) {
                final collection = collections[index];
                return ListTile(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF00703C), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text(collection.getStringValue('report'), style: TextStyle(fontWeight: FontWeight.bold),),
                  tileColor: Colors.white,
                  subtitle: Row(
                    children: [Text(collection.getStringValue('type'), style: TextStyle(fontWeight: FontWeight.bold),)],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
            ),
          ),
          const Copyright(),
        ],
      ),
    );
  }
}