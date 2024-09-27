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
      appBar: AppBar(
        title: const NinerText(),
      ),
      body: Column(
        children: [
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
                        title: Text(collection.getStringValue('report')),
                        subtitle: Row(
                          children: [Text(collection.getStringValue('type'))],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 20);
                    },
                  ),
          ),
          const Copyright(),
        ],
      ),
    );
  }
}
