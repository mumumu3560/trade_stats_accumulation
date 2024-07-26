//image_selector.dartファイル
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trade_stats_accumulation/utils/various.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;

class ImageSelector extends HookWidget {
  final TextEditingController imagePathController;
  final String label;

  const ImageSelector({
    Key? key,
    required this.imagePathController,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imagePath = useState<String?>(null);

    useEffect(() {
      imagePath.value = imagePathController.text;
      return null;
    }, []);

    Future<void> selectImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final String? savedPath = await _saveImage(File(pickedFile.path));
        if (savedPath != null) {
          imagePath.value = savedPath;
          imagePathController.text = savedPath;
        } else {
          // エラーハンドリング
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('画像の保存に失敗しました。')),
          );
        }
      }
    }

    return Column(
      //中央ぞろえ
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: selectImage,
          child: Text('画像を選択'),
        ),
        SizedBox(height: 8),
        if (imagePath.value != null) ...[
          SizedBox(
            width: SizeConfig.blockSizeHorizontal! * 70,
            height: SizeConfig.blockSizeVertical! * 50,
            child: _buildImageWidget(imagePath.value!),
          ),
          TextButton(
            onPressed: () {
              imagePath.value = null;
              imagePathController.text = '';
            },
            child: Text('画像を削除'),
          ),
        ],
      ],
    );
  }

  Widget _buildImageWidget(String path) {
    final file = File(path);
    final fileExists = file.existsSync();

    if (fileExists) {
      return Image.file(file, fit: BoxFit.cover);
    } else {
      return Image.asset('assets/images/no_image.png', fit: BoxFit.cover);
    }
  }

  Future<String?> _saveImage(File image) async {
    try {
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String fileName = '${Uuid().v4()}.jpg';
      final String filePath = path.join(appDir.path, 'images', fileName);
      
      // imagesディレクトリが存在することを確認
      final imagesDir = Directory(path.join(appDir.path, 'images'));
      if (!await imagesDir.exists()) {
        await imagesDir.create(recursive: true);
      }

      // Windows用のパス調整
      final String normalizedPath = path.normalize(filePath);
      
      final File newImage = await image.copy(normalizedPath);
      
      if (await newImage.exists()) {
        return normalizedPath;
      } else {
        print('Failed to copy image');
        return null;
      }
    } catch (e) {
      print('Error saving image: $e');
      return null;
    }
  }
}





/*

// image_selector.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trade_stats_accumulation/utils/various.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;

class ImageSelector extends HookWidget {
  final TextEditingController imagePathController;
  final String label;

  const ImageSelector({Key? key, required this.imagePathController, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imagePath = useState<String?>(null);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    useEffect(() {
      imagePath.value = imagePathController.text;
      return null;
    }, []);

    Future<void> selectImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final String? savedPath = await _saveImage(File(pickedFile.path));
        if (savedPath != null) {
          imagePath.value = savedPath;
          imagePathController.text = savedPath;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('画像の保存に失敗しました。')),
          );
        }
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: selectImage,
          icon: Icon(Icons.image),
          label: Text('画像を選択'),
          style: ElevatedButton.styleFrom(
            backgroundColor: isDarkMode ? Colors.blueGrey[700] : Colors.blue,
          ),
        ),
        SizedBox(height: 8),
        if (imagePath.value != null) ...[
          Container(
            width: SizeConfig.blockSizeHorizontal! * 30,
            height: SizeConfig.blockSizeVertical! * 50,
            decoration: BoxDecoration(
              border: Border.all(color: isDarkMode ? Colors.white70 : Colors.black54),
              borderRadius: BorderRadius.circular(8),
            ),
            child: _buildImageWidget(imagePath.value!),
          ),
          TextButton(
            onPressed: () {
              imagePath.value = null;
              imagePathController.text = '';
            },
            child: Text('画像を削除', style: TextStyle(color: Colors.red)),
          ),
        ],
      ],
    );
  }

  Widget _buildImageWidget(String path) {
    final file = File(path);
    final fileExists = file.existsSync();

    if (fileExists) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.file(file, fit: BoxFit.cover),
      );
    } else {
      return Image.asset('assets/images/no_image.png', fit: BoxFit.cover);
    }
  }

  Future<String?> _saveImage(File image) async {
    try {
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String fileName = '${Uuid().v4()}.jpg';
      final String filePath = path.join(appDir.path, 'images', fileName);
      
      final imagesDir = Directory(path.join(appDir.path, 'images'));
      if (!await imagesDir.exists()) {
        await imagesDir.create(recursive: true);
      }

      final String normalizedPath = path.normalize(filePath);
      
      final File newImage = await image.copy(normalizedPath);
      
      if (await newImage.exists()) {
        return normalizedPath;
      } else {
        print('Failed to copy image');
        return null;
      }
    } catch (e) {
      print('Error saving image: $e');
      return null;
    }
  }
}
 */