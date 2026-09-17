//https://leetcode.cn/problems/lexicographically-smallest-palindromic-permutation-greater-than-target/
class Solution {
    func lexPalindromicPermutation(_ s: String, _ target: String) -> String {
        let M = target.count
        guard M > 1 else {return s > target ? s : ""}
        var counter = [Character:Int]()
        var existed = Set<Character>()
        for ch in s {
            counter[ch,default: 0] += 1
            existed.insert(ch)
        }
        var middleChar:Character? = nil
        for (ch,cnt) in counter {
            if cnt & 1 != 0 {
                guard nil == middleChar else {
                    return ""
                }
                middleChar = ch
                counter[ch] = cnt - 1
            }
        }

        let sortedSmallerFirst = existed.sorted()
        let sortedLargerFirst = existed.sorted { $0 > $1}

        var left = ""
        var right = ""
        for i in 0..<(M / 2) {
            var isFind = false
            for ch in sortedSmallerFirst {
                guard (counter[ch] ?? 0) >= 2 else {continue}
                var temp = counter
                temp[ch,default: 0] -= 2
                if left + "\(ch)" + getMaxPalindromicBasedOn(temp, sortedLargerFirst, middleChar) + "\(ch)" + right > target {
                    isFind = true
                    counter = temp
                    left += "\(ch)"
                    right = "\(ch)" + right
                    break
                }
            }
            guard isFind else {return ""}
        }
        if let m = middleChar {
            left += "\(m)"
        }
        return left + right
    }

    private func getMaxPalindromicBasedOn(_ counter:[Character:Int], _ sortedExistedChars:[Character], _ middle: Character?) -> String {
        var left = ""
        var right = ""
        for ch in sortedExistedChars {
            let cnt = counter[ch]!
            if cnt > 0 {
                let s = String(repeating: ch, count: cnt / 2)
                left += s
                right = s + right
            }
        }
        if let m = middle {
            return left + "\(m)" + right
        } else {
            return left + right
        }

    }
}
