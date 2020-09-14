// https://leetcode.com/problems/replace-all-s-to-avoid-consecutive-repeating-characters/
class Solution {
    func modifyString(_ s: String) -> String {
        var chars = [Character](s)
        let N = chars.count
        let letters = [Character]("abcdefghijklmnopqrstuvwxyz")
        func change(_ index: Int) {
            let left: Character? = index == 0 ? nil : chars[index - 1]
            let right: Character? = index == N - 1 ? nil : (chars[index + 1] == "?" ? nil : chars[index + 1])
            for letter in letters {
                var flag = true
                if let l = left, l == letter {
                    flag = false
                }
                if let r = right, r == letter {
                    flag = false
                }
                if flag {
                    chars[index] = letter
                    return
                }
            }
        }
        func change2(_ index: Int) {
            var set = Set<Character>()
            if index > 0 {
                set.insert(chars[index - 1])
            }
            if index < N - 1 && chars[index + 1] != "?" {
                set.insert(chars[index + 1])
            }
            for letter in letters {
                if !set.contains(letter) {
                    chars[index] = letter
                    return
                }
            }
        }
        for i in 0..<N {
            if chars[i] == "?" {
               change(i)
                // change2(i)
            }
        }
        return String(chars)
    }
}

