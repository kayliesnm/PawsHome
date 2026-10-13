import 'package:flutter/material.dart';
import '../user_account.dart';

class AddPostPage extends StatefulWidget {
  final User currentUser;

  const AddPostPage({Key? key, required this.currentUser}) : super(key: key);

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  String? selectedImage;
  final TextEditingController _captionController = TextEditingController();

  void _pickImage(String imagePath) {
    setState(() {
      selectedImage = imagePath;
    });
  }

  void _submitPost() {
    if (selectedImage != null && _captionController.text.isNotEmpty) {
      setState(() {
        selectedImage = null;
        _captionController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GestureDetector(
                        onTap: () => _pickImage('assets/post.png'),
                        child: Container(
                          height: screenHeight * 0.45, // <-- responsive!
                          decoration: BoxDecoration(
                            border: Border.all(color: theme.primaryColor),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black12,
                          ),
                          child: selectedImage == null
                              ? const Center(
                                  child: Text(
                                    "Tap to take or select photos",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    selectedImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Caption input
                      TextField(
                        controller: _captionController,
                        decoration: InputDecoration(
                          hintText: "Write a caption...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        maxLines: 3,
                      ),

                      const SizedBox(height: 20),

                      // Post button
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: _submitPost,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            ),
                          ),
                          child: const Text(
                            "Post",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Only photos of cats and dogs are allowed!',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),

                      const Spacer(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
