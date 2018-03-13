# Perbandingan Kinerja Bitcoin Sort antara Parallel dengan Non-Parallel
- **Turfa Auliarachman** - 13515133

Pembagian tugas: Semua dikerjakan oleh **Turfa Auliarachman**, 13515133.

## Requirements
1. *Compiler* C mendukung **OpenMP**.
2. *Compiler* C dapat diakses dengan perintah `cc`.

## Petunjuk Penggunaan
### Kompilasi
Untuk melakukan kompilasi, gunakan perintah:
```
make
```

### Menjalankan Program
Untuk menjalankan program, gunakan perintah:
```
./bitonic_sort [jumlah_data]

[jumlah_data] harus berupa bilangan bulat positif.
```

## Laporan
### Solusi Paralel
Solusi parallel yang saya buat adalah dengan memparallelkan semua perbandingan
elemen yang ada di **bitonic sort**.

### Analisis Solusi
Pada dasarnya, **bitonic sort** hanya terdiri dari perbandingan-perbandingan
dan penukaran elemen yang independen pada setiap *batch*. Solusi yang
saya ajukan adalah membuat perbandingan-perbandingan dan penukan elemen yang
independen tersebut berjalan secara parallel. Dengan memparallelkan unsur
utama dari algoritma ini, menurut saya ini adalah cara yang paling efektif
dalam memparallelkan algoritma **bitonic sort**.

### Jumlah Thread dan Analisis
Jumlah *thread* yang saya gunakan adalah sejumlah *core* yang ada pada komputer
yang menjalankan.

Hal ini dikarenakan pada algoritma **bitonic sort**, banyaknya iterasi yang
akan digunakan setiap *batch* adalah sebanyak setengah dari banyaknya elemen
yang akan diurutkan. Namun, jika dibuat *thread* terlalu banyak, akan terjadi
*overhead* yang terlalu besar dalam pembangkitan dan manajemen *thread* pada
OS.

### Pengukuran Waktu
| Banyak Elemen | Waktu Percobaan 1 (ms) | Waktu Percobaan 2 (ms) | Waktu Percobaan 3 (ms) | Waktu Rata-Rata |
| :-----------: | :--------------------: | :--------------------: | :--------------------: | :-------------: |
| 5.000 | 2.030 (**single thread**) <br /> 1.617 (**multithread**) | 2.048 (**single thread**) <br /> 1.559 (**multithread**) | 1.857 (**single thread**) <br /> 1.405 (**multithread**) | 1.978,33 <br /> 1.527 |
| 50.000 | 18.314 (**single thread**) <br /> 13.844 (**multithread**) | 23.028 (**single thread**) <br /> 16.206 (**multithread**) | 24.423 (**single thread**) <br /> 17.184 (**multithread**) | 21.921,67 <br /> 15.744,67 |
| 100000 | 27.561 (**single thread**) <br /> 21.032 (**multithread**) | 43.761 (**single thread**) <br /> 31.047 (**multithread**) | 24.398 (**single thread**) <br /> 19.714 (**multithread**) | 31.906,67 <br /> 23.931 |
| 200.000 | 106333 (**single thread**) <br /> 63754 (**multithread**) | 54543 (**single thread**) <br /> 44309 (**multithread**) | 93858 (**single thread**) <br /> 58053 (**multithread**) | 84.911,33 <br /> 55.372 |
| 400.000 | 168640 (**single thread**) <br /> 101281 (**multithread**) | 172122 (**single thread**) <br /> 99364 (**multithread**) | 170789 (**single thread**) <br /> 100086 (**multithread**) | 170.517 <br /> 100.243,67 |

### Analisis Perbandingan
Pada percobaan dengan banyak elemen 5.000, terjadi peningkatan kecepatan
sebanyak 23%. PAda percobaan dengan banyak elemen 50.000, 100.000, 200.000,
dan 400.000, berturut-turut peningkatannya adalah sebanyak 28%, 25%, 35%, dan
41%.

Dari sana, kita melihat bahwa semakin banyak jumlah elemen, semakin besar juga
peningkatan kecepatannya. Hal itu dikarenakan ketika jumlah elemennya lebih
sedikit, waktu *overhead* akan lebih terasa dibanding ketika jumlah elemennya
lebih banyak.
