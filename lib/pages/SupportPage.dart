import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final isWide = size.width > 600;
int _selectedRating = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("23".tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   Text(
                   "24".tr,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 16),
                  Text("25".tr,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 24),
                  if (isWide)
                    Row(
                      children: [
                        Expanded(child: _buildFormField('26'.tr)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildFormField('27'.tr)),
                      ],
                    )
                  else ...[
                   _buildFormField('26'.tr),
                    const SizedBox(height: 12),
 _buildFormField('27'.tr)                  ],
                  const SizedBox(height: 12),
                  _buildFormField('28'.tr, maxLines: 4),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      // هنا تضع الأكشن عند الضغط (مثلاً إرسال البيانات)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('31'.tr)),
                      );
                    },
                    icon: const Icon(Icons.send),
                    label:  Text('29'.tr),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Divider(),
                  Column(children: [
                     Text(
                    "30".tr,
                    style: TextStyle(fontWeight: FontWeight.normal),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 8),
                  const Text("  support@hajtravel.com :Email", textAlign: TextAlign.right),
                  const Text(" Whatsapp: 966-5-12345678", textAlign: TextAlign.right),
                  const SizedBox(height: 12),
  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    final starIndex = index + 1;
                    return IconButton(
                      icon: Icon(
                        _selectedRating >= starIndex ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 32,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedRating = starIndex;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("شكراً! قمت بتقييم التطبيق بـ $starIndex نجوم."),
                          ),
                        );
                      },
                    );
                  }),)
                
                  ],)
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
