# LabMobile3_Rifqi-Alrasid_C
Aplikasi Story Reader

# Screenshot
![image](https://github.com/user-attachments/assets/725c3118-7462-49c0-bc1f-99003be1ee63)
![image](https://github.com/user-attachments/assets/b47381dc-85b8-4e5e-9d24-9de1b176974d)
![image](https://github.com/user-attachments/assets/c7513244-570f-49a5-838d-527b1a9fdb23)
![image](https://github.com/user-attachments/assets/0b936ecf-f184-4a54-8071-c588c596f7bf)
![image](https://github.com/user-attachments/assets/0035c6a8-ca27-4441-8843-450286db6192)
![image](https://github.com/user-attachments/assets/930d1b79-3d43-422d-8938-6767e827460a)


# Penjelasan Code
1. Login Page (`login_page.dart`)
Deskripsi: Halaman login yang memungkinkan pengguna untuk masuk menggunakan username dan password.

Bagian Penting:

Imports & Dependencies
```
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
```
Ini mengimpor paket yang diperlukan, termasuk shared_preferences untuk menyimpan data pengguna.

StatefulWidget LoginPage

```
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}
```
LoginPage adalah StatefulWidget karena statusnya (seperti input login) akan berubah.

TextField untuk Input

```
Widget _showInput(TextEditingController controller, String placeholder, bool isPassword) {
  return TextField(
    controller: controller,
    obscureText: isPassword,
    style: const TextStyle(
      fontFamily: 'UnifrakturMaguntia',
      color: Colors.white,
    ),
    decoration: InputDecoration(
      hintText: placeholder,
      hintStyle: const TextStyle(
        color: Colors.grey,
        fontFamily: 'UnifrakturMaguntia',
      ),
      filled: true,
      fillColor: Colors.black38,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.redAccent,
        ),
      ),
    ),
  );
}
```
_showInput adalah metode yang membuat TextField dengan gaya Gothic. obscureText digunakan untuk menyembunyikan teks saat menginput password.

Login Validation dan Navigation

```
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.redAccent,
  ),
  child: const Text(
    'Login',
    style: TextStyle(
      fontFamily: 'UnifrakturMaguntia',
      color: Colors.white,
    ),
  ),
  onPressed: () {
    if (_usernameController.text == 'admin' &&
        _passwordController.text == 'admin') {
      _saveUsername();
      _showDialog('Anda Berhasil Login', const HomePage());
    } else {
      _showDialog('Username dan Password Salah', const LoginPage());
    }
  },
),
```
Tombol login memeriksa kredensial yang benar. Jika benar, ia menyimpan username dan menavigasi ke halaman HomePage. Jika salah, ia menampilkan dialog kesalahan.

2. Home Page (`home_page.dart`)
Deskripsi: Halaman utama setelah login, menampilkan kategori cerita yang dapat dipilih.

Bagian Penting:

ElevatedButton untuk Navigasi
```
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.redAccent,
  ),
  child: const Text(
    'Dark Fantasy Stories',
    style: TextStyle(
      fontFamily: 'UnifrakturMaguntia',
      color: Colors.white,
    ),
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoryListPage(category: 'Dark Fantasy'),
      ),
    );
  },
),
```
Tombol ini mengarahkan pengguna ke StoryListPage dengan kategori yang dipilih.
3. Story List Page (`story_list_page.dart`)
Deskripsi: Halaman yang menampilkan daftar cerita berdasarkan kategori yang dipilih.

Bagian Penting:

ListView.builder untuk Daftar Cerita
```
ListView.builder(
  itemCount: stories?.length ?? 0,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(
        stories![index],
        style: const TextStyle(
          fontFamily: 'UnifrakturMaguntia',
          color: Colors.white70,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoryReaderPage(storyTitle: stories[index]),
          ),
        );
      },
    );
  },
),
```
ListView.builder menampilkan daftar cerita dengan kategori yang dipilih. Ketika salah satu cerita diketuk, pengguna diarahkan ke StoryReaderPage.
4. Story Reader Page (`story_reader_page.dart`)
Deskripsi: Halaman untuk membaca cerita yang dipilih.

Bagian Penting:

Tampilan Konten Cerita
```
Text(
  storyContent[storyTitle] ?? 'Story not found.',
  style: const TextStyle(
    fontFamily: 'UnifrakturMaguntia',
    fontSize: 18,
    color: Colors.white70,
  ),
),
```
Menampilkan konten cerita dengan gaya Gothic. Jika cerita tidak ditemukan, pesan default akan ditampilkan.
5. About Page (`about_page.dart`)
Deskripsi: Halaman informasi tentang aplikasi.

Bagian Penting:

Tampilan Halaman Tentang
```
Text(
  'This is the About Page',
  style: TextStyle(
    fontFamily: 'UnifrakturMaguntia',
    fontSize: 18,
    color: Colors.white70,
  ),
),
```
Menampilkan informasi dasar tentang aplikasi dengan gaya Gothic.
Sidemenu (`sidemenu.dart`)
Deskripsi: Menu samping untuk navigasi aplikasi.

Bagian Penting:

Navigasi Menu Biasanya berisi tautan untuk halaman lain seperti "Home", "About", dan "Logout". Menu ini memudahkan navigasi antara halaman-halaman aplikasi.
