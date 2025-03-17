# Tutorial 6 - Game Development

Nama: Fikri Risyad Indratno<br>
NPM: 2206031170

## Latihan Mandiri: Fitur Tambahan

### Tombol pada layar *game over* untuk kembali ke menu utama

Saya menambahkan `VBoxContainer` pada `Game Over.tscn` sebagai *child* dari `ColorRect` atau `GameOver`. Kemudian, saya memindahkan `Label` *game over* ke dalam `VBoxContainer` dan membuat `LinkButton` sebagai tombol untuk kembali ke menu utama. *Script* yang sebelumnya digunakan oleh tombol *New Game* untuk pindah ke `Level1.tscn` saya modifikasi agar bisa digunakan oleh tombol lain dan dapet me-*reset* nyawa ketika ingin bermain kembali setelah dari halaman *Game Over* Saya meng-attach *script* tersebut ke `LinkButton` dan menghubungkan dengan *signal* `pressed()`. Berikut *script* yang sudah dimodifikasi:

```
extends LinkButton

@export var scene_to_load : String

var scenes = ["Level 1", "Level 2"]

func _on_pressed() -> void:
	if scene_to_load in scenes:
		Global.lives = 3
	get_tree().change_scene_to_file("res://scenes/" + scene_to_load + ".tscn")
```

### Fitur Select Stage

Saya menambahkan `VBoxContainer` pada `MainMenu.tscn` sebagai *child* dari `MarginContainer/HBoxContainer/VBoxContainer`. Di dalamnya terdapat tiga `LinkButton`, yang pertama untuk memilih `Level 1.tscn` bernama `Level1Button`, yang kedua untuk memilih `Level 2.tscn` bernama `Level2Button`, dan yang ketiga untuk kembali ke menu utama sebelumnya `BackToMenuButton`. Pada tombol `StageSelectButton` di `MainMenu.tscn` dan `BackToMenuButton`, saya menambahkan *script* untuk men-*toggle* tombol apa yang akan muncul di menu utama. Tombol yang muncul awalnya adalah *New Game* dan *Stage Select*, ketika *Stage Select* ditekan, tombol *Level 1*, *Level 2*, dan *Back* akan muncul, di mana kedua tombol level akan mengantarkan pemain ke level tersebut, sedangkan tombol *Back* akan menampilkan kembali tombol *New Game* dan *Stage Select*. Berikut adalah *script* yang digunakan pada tombol `StageSelectButton` dan `BackToMenuButton`:

```
extends LinkButton

@onready var vbox_container = get_parent().get_parent()

func _on_pressed() -> void:
	var new_game_buttons = vbox_container.get_node("MainMenuButtons")
	new_game_buttons.visible = !new_game_buttons.visible
	
	var stage_select_buttons = vbox_container.get_node("StageSelectButtons")
	stage_select_buttons.visible = !stage_select_buttons.visible
```

Setelah melakukan ini, saya melihat bahwa `VBoxContainer` untuk judul dan tombol-tombol menjadi tidak rapih karena perbedaan jumlah tombol dari menu awal dan menu *stage select* akan menggeser judul ke atas. Oleh karena itu di atas `VBoxContainer` ini saya menambahkan `MarginContainer` dengan `Container Sizing` yang `Vertical` menjadi `Shrink Begin` dan pada `Constants` pada `Theme Overrides`, saya mengubah `Margin Top` menjadi `230`.