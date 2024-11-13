// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:filesharewithfirebase/components/mydrawer.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<firebase_storage.Reference> files = [];

//   @override
//   void initState() {
//     super.initState();
//     _listFiles();
//   }

//   Future<void> _listFiles() async {
//     try {
//       final firebase_storage.ListResult result = await firebase_storage
//           .FirebaseStorage.instance
//           .ref('uploads')
//           .listAll();

//       setState(() {
//         files = result.items;
//       });
//     } catch (e) {
//       print('Failed to list files: $e');
//     }
//   }

//   Future<void> _pickAndUploadFile() async {
//     try {
//       final FilePickerResult? result = await FilePicker.platform.pickFiles();
//       if (result == null) {
//         print('No file selected');
//         return;
//       }

//       final File file = File(result.files.single.path!);
//       final String fileName = result.files.single.name;

//       final firebase_storage.Reference firebaseStorageRef = firebase_storage
//           .FirebaseStorage.instance
//           .ref()
//           .child('uploads/$fileName');

//       final firebase_storage.UploadTask uploadTask =
//           firebaseStorageRef.putFile(file);
//       await uploadTask;

//       final String downloadURL = await firebaseStorageRef.getDownloadURL();
//       print('File uploaded successfully. Download URL: $downloadURL');
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('File uploaded successfully'),
//         ),
//       );
//       _listFiles(); // Refresh the file list after uploading
//     } catch (e) {
//       print('Failed to upload file: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to upload file: $e'),
//         ),
//       );
//     }
//   }

//   Future<void> _downloadFile(firebase_storage.Reference ref) async {
//     try {
//       final Directory systemTempDir = Directory.systemTemp;
//       final File tempFile = File('${systemTempDir.path}/${ref.name}');
//       if (tempFile.existsSync()) {
//         await tempFile.delete();
//       }
//       await ref.writeToFile(tempFile);

//       print('File downloaded to: ${tempFile.path}');
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('File downloaded successfully'),
//         ),
//       );
//       _shareFile(tempFile);
//     } catch (e) {
//       print('Failed to download file: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to download file: $e'),
//         ),
//       );
//     }
//   }

//   Future<void> _shareFile(File file) async {
//     try {
//       final XFile xFile = XFile(file.path);
//       await Share.shareXFiles([xFile], text: 'Check out this file!');
//       print('File shared: ${file.path}');
//     } catch (e) {
//       print('Failed to share file: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 116, 184, 240),
//         title: const Text('File Sharing App'),
//         centerTitle: true,
//       ),
//       drawer: const Drawer(
//         child: MyDrawer(),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(22.0),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 74, 157, 225),
//             shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.circular(29),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 const Text(
//                   'Upload your files',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 28,
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: _pickAndUploadFile,
//                   child: const Text(
//                     'Upload File',
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 const Text(
//                   'Downloaded Files',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 32,
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: files.length,
//                     itemBuilder: (context, index) {
//                       final ref = files[index];
//                       return ListTile(
//                         title: Text(
//                           ref.name,
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             IconButton(
//                               icon: const Icon(
//                                 Icons.download,
//                                 color: Colors.white,
//                               ),
//                               onPressed: () => _downloadFile(ref),
//                             ),
//                             IconButton(
//                               icon: const Icon(
//                                 Icons.share,
//                                 color: Colors.red,
//                               ),
//                               onPressed: () async {
//                                 final Directory systemTempDir =
//                                     Directory.systemTemp;
//                                 final File tempFile =
//                                     File('${systemTempDir.path}/${ref.name}');
//                                 if (tempFile.existsSync()) {
//                                   await tempFile.delete();
//                                 }
//                                 await ref.writeToFile(tempFile);
//                                 _shareFile(tempFile);
//                               },
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:filesharewithfirebase/components/mydrawer.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<firebase_storage.Reference> files = [];
  @override
  void initState() {
    super.initState();
    _listFiles();
  }

  Future<void> _listFiles() async {
    try {
      final firebase_storage.ListResult result = await firebase_storage
          .FirebaseStorage.instance
          .ref('uploads')
          .listAll();

      setState(() {
        files = result.items;
      });
    } catch (e) {
      print('Failed to list files: $e');
    }
  }

  Future<void> _pickAndUploadFile() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result == null) {
        print('No file selected');
        return;
      }

      final File file = File(result.files.single.path!);
      final String fileName = result.files.single.name;

      final firebase_storage.Reference firebaseStorageRef = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('uploads/$fileName');

      final firebase_storage.UploadTask uploadTask =
          firebaseStorageRef.putFile(file);
      await uploadTask;

      final String downloadURL = await firebaseStorageRef.getDownloadURL();
      print('File uploaded successfully. Download URL: $downloadURL');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('File uploaded successfully'),
        ),
      );
      _listFiles(); // Refresh the file list after uploading
    } catch (e) {
      print('Failed to upload file: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to upload file: $e'),
        ),
      );
    }
  }

  Future<void> _downloadFile(firebase_storage.Reference ref) async {
    try {
      final Directory systemTempDir = Directory.systemTemp;
      final File tempFile = File('${systemTempDir.path}/${ref.name}');
      if (tempFile.existsSync()) {
        await tempFile.delete();
      }
      await ref.writeToFile(tempFile);

      print('File downloaded to: ${tempFile.path}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('File downloaded successfully'),
        ),
      );
      _shareFile(tempFile);
    } catch (e) {
      print('Failed to download file: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to download file: $e'),
        ),
      );
    }
  }

  Future<void> _shareFile(File file) async {
    try {
      final XFile xFile = XFile(file.path);
      await Share.shareXFiles([xFile], text: 'Check out this file!');
      print('File shared: ${file.path}');
    } catch (e) {
      print('Failed to share file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 116, 184, 240),
        title: const Text('File Sharing App'),
        centerTitle: true,
      ),
      drawer: const Drawer(
        child: MyDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 74, 157, 225),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(29),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'Upload your files',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                ElevatedButton(
                  onPressed: _pickAndUploadFile,
                  child: const Text(
                    'Upload File',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Downloaded Files',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: files.length,
                    itemBuilder: (context, index) {
                      final ref = files[index];
                      return ListTile(
                        title: Text(
                          ref.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.download,
                                color: Colors.white,
                              ),
                              onPressed: () => _downloadFile(ref),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.share,
                                color: Colors.red,
                              ),
                              onPressed: () async {
                                final Directory systemTempDir =
                                    Directory.systemTemp;
                                final File tempFile =
                                    File('${systemTempDir.path}/${ref.name}');
                                if (tempFile.existsSync()) {
                                  await tempFile.delete();
                                }
                                await ref.writeToFile(tempFile);
                                _shareFile(tempFile);
                              },
                            ),
                          ],
                        ),
                      );
                    },
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
