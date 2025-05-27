//https://leetcode.com/problems/resulting-string-after-adjacent-removals/
class Solution {
    let lowcaseCharToNextChar: [Character:Character] = ["q": "r", "t": "u", "x": "y", "z": "a", "w": "x", "l": "m", "h": "i", "v": "w", "c": "d", "p": "q", "a": "b", "e": "f", "b": "c", "y": "z", "k": "l", "g": "h", "n": "o", "d": "e", "r": "s", "s": "t", "j": "k", "m": "n", "u": "v", "f": "g", "o": "p", "i": "j"]
    var strsSet = Set<[Character]>()
    init(strsSet: Set<[Character]> = Set<[Character]>()) {
        for (k,v) in lowcaseCharToNextChar {
            self.strsSet.insert([k,v])
            self.strsSet.insert([v,k])
        }
    }
    func resultingString(_ s: String) -> String {
        if s.count <= 1 {
            return s
        }

        let N = s.count
        let chars = [Character](s)
        var removed = [Bool](repeating: false, count: N)

        var idx = 1
        var notRemoved = [0]

        while idx < N {
            if notRemoved.isEmpty {
                notRemoved.append(idx)
                idx += 1
                continue
            }

            let arr = [chars[notRemoved.last!],chars[idx]]
            if strsSet.contains(arr) {
                removed[notRemoved.removeLast()] = true
                removed[idx] = true
            } else {
                notRemoved.append(idx)
            }
            idx += 1
        }

        var ans = ""
        for i in 0..<N {
            if !removed[i] {
                ans.append(chars[i])
            }
        }


        return ans
    }
}
