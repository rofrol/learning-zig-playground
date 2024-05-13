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
