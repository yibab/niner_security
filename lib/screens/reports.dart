import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: NinerText(),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: collections.length,
              itemBuilder: (context, index) {
                final collection = collections[index];
                return ListTile(
                  shape: RoundedRectangleBorder(side: BorderSide(color: Color(0xFF00703C), width: 2),
                  borderRadius: BorderRadius.circular(20)),
                  title: Text(collection.getStringValue('report')),
                  subtitle: Row(
                    children: [Text(collection.getStringValue('type'))],
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 20); },
            ),
    );
  }
}
