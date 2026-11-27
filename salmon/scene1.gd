extends Node2D

const d1: Array = [
	{"name": "", "text": "Kamar Andini terlihat sedikit berantakan. Di atas meja kecil terdapat berbagai perlengkapan ritual yang sudah Andini siapkan. Sebuah foto laki-laki yang disukainya diletakkan di tengah, dikelilingi sesajen dan beberapa benda ritual."},
	{"name": "", "text": "Andini duduk bersila di depan meja. Ia memperhatikan foto tersebut sambil memastikan semua perlengkapannya sudah siap."},
]	

const d2: Array = [
	{"name": "Andini", "text": "Oke, foto sudah. Sesajen juga sudah."},
	{"name": "Andini", "text": "Sepertinya tidak ada yang kurang."},
	{"name": "", "text": "Andini mulai melakukan ritualnya. Ia memusatkan perhatian pada foto tersebut, kemudian mengarahkan energi spiritualnya untuk mengirimkan pelet kepada orang yang ada di dalam foto."},
	{"name": "Andini", "text": "Baiklah... semoga kali ini berhasil."}
]

const d3: Array = [
	{"name": "", "text": "Cahaya mulai muncul dari sekitar meja. Energi spiritual perlahan berkumpul, kemudian bergerak meninggalkan ruangan menuju targetnya."},
	{"name": "", "text": "Namun, belum jauh energi tersebut bergerak, tiba-tiba muncul kilatan cahaya yang sangat terang."}
]

const d4: Array = [
	{"name": "", "text": "WHOOSH!"},
	{"name": "", "text": "Energi pelet langsung terpental dan menghilang."}
]

const d5: Array = [
	{"name": "Andini", "text": "HAH?!"},
	{"name": "", "text": "Andini spontan berdiri dan memperhatikan perlengkapan ritualnya."},
	{"name": "Andini", "text": "Tunggu, apa yang barusan terjadi?"},
	{"name": "", "text": "Tiba-tiba, muncul sosok ikan Salmon besar di hadapannya."}
]

const d6: Array = [
	{"name": "Khodam Salmon", "text": "Hentikan. Jangan ganggu tuanku."},
	{"name": "Andini", "text": "Lho?!"},
	{"name": "Andini", "text": "Jadi, selama ini dia dilindungi Khodam?"},
	{"name": "Khodam Salmon", "text": "Kekuatanmu bahkan tidak cukup untuk melewati perlindunganku."},
]

const d7: Array = [
	{"name": "", "text": "Andini kembali duduk sambil menatap foto laki-laki di atas meja."},
	{"name": "Andini", "text": "Astaga... ternyata tidak semudah itu."},
	{"name": "", "text": "Asap tipis dari sesajen perlahan menghilang. Andini masih duduk di depan meja, menatap foto laki-laki yang tadi digunakan dalam ritual."},
	{"name": "Andini", "text": "...seriusan? Khodam salmon?"},
	{"name": "", "text": "Andini mengambil foto itu, lalu membolak-baliknya seolah berharap ada sesuatu yang berubah."},
	{"name": "Andini", "text": "padahal tinggal sedikit lagi."},
	{"name": "", "text": "Tiba-tiba, terdengar suara dari belakangnya "}
]

const d8: Array = [
	{"name": "???", "text": "kalau memang semudah itu, dari tadi sudah berhasil."},
	{"name": "", "text": "Andini menoleh. Sosok khodam salmon yang berada pada dirinya muncul."}
]

const d9: Array = [
	{"name": "Andini", "text": "ya, ya. Aku tahu. Tapi aku nggak mungkin menyerah hanya karna khodam salmon lainnya ada dan mencoba menghalangiku."},
	{"name": "Andini", "text": "...Tiga Khodam."},
	{"name": "Salmon Andini", "text": "Apa?"},
	{"name": "Andini", "text": "Kalau aku bisa mengalahkan tiga Khodam lain, mungkin aku bisa mengatasi kekuatan Salmon itu juga!"},
	{"name": "Salmon Andini", "text": "Itu kesimpulan yang cukup bodoh."}
]

const d10: Array = [
	{"name": "Andini", "text": "Tapi bukan berarti nggak bisa berhasil."},
	{"name": "", "text": "Andini berdiri dan mulai merapikan barang-barangnya."},
	{"name": "Andini", "text": "Baiklah. Kita mulai besok!"}
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogManager.start_dialog(Vector2.ZERO, d1)
	await DialogManager.dialogue_ended
	$mc1.visible = false
	$kamar.visible = false
	
	DialogManager.start_dialog(Vector2.ZERO, d2)
	await DialogManager.dialogue_ended
	$AnimationPlayer.play("pelet_transfer")
	
	DialogManager.start_dialog(Vector2.ZERO, d3)
	await DialogManager.dialogue_ended
	$AnimationPlayer.play("kilat_cahaya")
	await get_tree().create_timer(0.36).timeout
	$kamar.visible = true
	$sly.visible = true
	
	DialogManager.start_dialog(Vector2.ZERO, d4)
	await DialogManager.dialogue_ended
	
	
	DialogManager.start_dialog(Vector2.ZERO, d5)
	await DialogManager.dialogue_ended
	$sly.visible = false
	$AnimationPlayer.play("muncul salmon")
	await get_tree().create_timer(0.8).timeout
	$salmon.visible = true
	
	DialogManager.start_dialog(Vector2.ZERO, d6)
	await DialogManager.dialogue_ended
	$AnimationPlayer.play("salmon ilang")
	await get_tree().create_timer(1.5).timeout
	$kamar.visible = false
	
	DialogManager.start_dialog(Vector2.ZERO, d7)
	await DialogManager.dialogue_ended
	$kamar.visible = true
	$"salmon mc".visible = true
	
	DialogManager.start_dialog(Vector2.ZERO, d8)
	await DialogManager.dialogue_ended
	$AnimationPlayer.play("salmon mc muncul")
	
	DialogManager.start_dialog(Vector2.ZERO, d9)
	await DialogManager.dialogue_ended
	await get_tree().create_timer(0.5).timeout
	$"salmon mc".visible = false
	$mc1.visible = true
	DialogManager.start_dialog(Vector2.ZERO, d10)
	await DialogManager.dialogue_ended
	
	
	
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
