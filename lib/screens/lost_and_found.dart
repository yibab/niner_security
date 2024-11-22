import 'package:flutter/material.dart';
import 'package:niner_security/widgets/footer.dart';

import '../db/address.dart';
import '../widgets/niner_text.dart';

class LostReports extends StatefulWidget {
  const LostReports({super.key});

  @override
  State<LostReports> createState() => _LostReportsState();
}

class _LostReportsState extends State<LostReports> {
  late List collections = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCollections();
  }


  Future<void> fetchCollections() async {
    try {
      final records = await pb.collection("reports").getFullList(
        filter: "type = 'Lost Item'",
        sort: '-created',
      );
      setState(() {
        collections = records;
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
      backgroundColor: const Color(0xFFCCFFDD),
      appBar: AppBar(
        flexibleSpace: Stack(
          children: [
            Container(
              color: const Color(0xFF00703C),
            ),
            Opacity(
              opacity: .3,
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
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
              itemCount: collections.length,
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                final collection = collections[index];
                return ListTile(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        color: Color(0xFF00703C), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      // Full-width gold underline
                      Positioned.fill(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Container(
                            height: 2,
                            color: const Color(0xFFAD9651),
                          ),
                        ),
                      ),
                      // Text content
                      Text(
                        "${collection.getStringValue('report_name')} - ${collection.getStringValue('type')}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times New Roman',
                          fontSize: 20,
                          color: Color(0xFF00703C),
                        ),
                      ),
                    ],
                  ),
                  tileColor: Colors.white,
                  subtitle: ListBody(
                    children: [
                      Text(
                        "Disposition: ${collection.getStringValue('disposition')}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Location: ${collection.getStringValue('location')}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Description: ${collection.getStringValue('user_description')}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Contact Information: ${collection.getStringValue('contact')}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Submitted at: ${collection.getStringValue('datetime')}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 15);
              },
            ),
          ),
          const Copyright(),
        ],
      ),
    );
  }
}
