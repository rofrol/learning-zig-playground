# Nauka Ziga - do zapamiętania

https://rofrol.github.io/learning-zig-karlseguin/01-language_overview_part_1.html

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
