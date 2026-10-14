// https://leetcode.cn/problems/total-distance-to-type-a-string-using-one-finger/
let keyboardPositionMap: [Character: (row: Int, col: Int)] = [
    // 第 0 行
    "q": (0, 0), "w": (0, 1), "e": (0, 2), "r": (0, 3), "t": (0, 4),
    "y": (0, 5), "u": (0, 6), "i": (0, 7), "o": (0, 8), "p": (0, 9),
    // 第 1 行
    "a": (1, 0), "s": (1, 1), "d": (1, 2), "f": (1, 3), "g": (1, 4),
    "h": (1, 5), "j": (1, 6), "k": (1, 7), "l": (1, 8),
    // 第 2 行
    "z": (2, 0), "x": (2, 1), "c": (2, 2), "v": (2, 3), "b": (2, 4),
    "n": (2, 5), "m": (2, 6)
]
func distance(from a: Character, to b: Character) -> Int? {
    guard let posA = keyboardPositionMap[a], let posB = keyboardPositionMap[b] else {
        return nil
    }
    return abs(posA.row - posB.row) + abs(posA.col - posB.col)
}


class Solution {
    func totalDistance(_ s: String) -> Int {
        var last:Character = "a"
        var dis = 0
        for ch in s {
            dis += (distance(from: last, to: ch) ?? 0)
            last = ch
        }
        return dis
    }
}
