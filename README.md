# Nauka Ziga - do zapamiętania

<https://rofrol.github.io/learning-zig-karlseguin/01-language_overview_part_1.html>

## Struktury

struct - definiowanie pól bez kropki, inicjalizacja z kropką

`user.diagnose()` to syntax sugar dla `User.diagnose(user)`

typ jest wnioskowany na podstawie przypisania: `const user = {}` to co `const user: User = {}`.

Przy zwracaniu z funkcji trzeba kropkę `function init() User { return .{};}`

## Tablice i wycinki

Długość tablicy jest częścią typu: `[4]i32` i `[5]i32` to dwa różne typy.

Długość tablicy dla typu może być wywnioskowana:

```zig
const c [_]i32{1, 2, 3, 4, 5};
```

Długość wycinka nie jest częścią typu, bo długość znana w czasie wykonania, a typy są zawsze znane w czasie kompilacji.

```zig

```

## Łańcuchy

Literał "Goku" to typ `*const [4:0]u8`.

Ogólniej `\*const [LENGTH:SENTINEL]u8`.

Można jednak tak:

```zig
const a: []const u8 = "Goku";
```

## comptime i anytime

Poniżej będzie błąd `error: variable of type 'comptime_int' must be const or comptime`:

```zig
var i = 5;
i += 1;
```

Trzeba zmienić na `var i: i32 = 5;` albo zmienić na `const var = 5;`.

## Przepływ sterowania

Dodać do oryginału informację, że typowy for można uzyskać z blokiem, żeby zmienna do iterowania nie była dostępna poza while.

"Akceptuje również instrukcję do wykonania" - nie wiadomo czy chodzi o while czy o else. Tu także zmienić, że akceptuje "instrukcje" - może być kilka instrukcji rozdzielonych średnikiem.

`==` nie działa z wycinkami, trzeba użyć `str.mem.eql(u8, str1, str2)`.

`std.ascii.eqlIgnoreCase(str1, str2)` - porównanie bez uwzględniania wielkości liter.

Operator trójargumentowy: `const x = if (condition) 1 else 2;`

W switchu `3...5` obejmuje obie liczby, a for wyklucza górną granicę.

Górna granica w forze może być wywnioskowana z długości.

Blok z etykietą musi być zakończony średnikiem.

Literalny enum np. `.confirmed`

## Wskaźniki

&user - adres zmiennej user

`a: T` - zmienna typu T

`a: *T` - wskaźnik do zmiennej typu T. Uzyskujemy przez `&a`.

Pola w strukturze - można wypisać adresy konkretnych pól, np.

```zig
std.debug.print("{*} {*}\n", .{&user, &user.id, &user.name});
```

Adresy `user` i `user.id` są takie same, bo `id` to pierwsze pole w strukturze.

Jeśli `user` jest adresem, to Zig podąży za adresem jeśli użyjemy `user.name`.

Wskaźnik to po prostu wartość, która jest adresem i typem.
