# LabMobile3_Rifqi-Alrasid_C
Aplikasi Story Reader

# Screenshot
![Screenshot 2024-09-24 233012](https://github.com/user-attachments/assets/18ab13d6-c0af-4413-8310-9b5a30e32e8f)
![Screenshot 2024-09-24 233029](https://github.com/user-attachments/assets/bb6ba828-ceee-48c1-b8af-7b6a7df7432b)
![Screenshot 2024-09-24 233055](https://github.com/user-attachments/assets/4a3b9bea-a78a-474d-82ac-d03a02e9dade)
![Screenshot 2024-09-24 233246](https://github.com/user-attachments/assets/3f3fe13b-ca00-4409-8bb9-df30737c45d1)
![Screenshot 2024-09-24 233312](https://github.com/user-attachments/assets/7da57c37-8358-4cd1-beb0-214dabb6fc1a)
![Screenshot 2024-09-24 232937](https://github.com/user-attachments/assets/7befef8d-6e56-4fad-ab5f-a0a8b18dfc52)



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
