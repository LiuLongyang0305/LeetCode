// https://leetcode.com/problems/longest-substring-with-at-least-k-repeating-characters/
class Solution {
    func longestSubstring(_ s: String, _ k: Int) -> Int {
        return longestSubstring([Character](s), k)
    }
    
    private  func longestSubstring(_ chars: [Character], _ k: Int) -> Int {
        var map = [Character:[Int]]()
        var counter = [Character:Int]()
        for i in 0..<chars.count {
            counter[chars[i], default: 0 ] += 1
            map[chars[i],default: [] ].append(i)
        }
        var indices = [Int]()
        for (ch,cnt) in counter {
            if cnt < k {
                indices.append(contentsOf: map[ch]!)
            }
        }
        guard !indices.isEmpty else {
            return chars.count
        }
        indices.sort()
        if indices.first! != 0 {
            indices.insert(-1, at: 0)
        }
        if indices.last! != chars.count - 1 {
            indices.append(chars.count)
        }
        var curAns = 0
        for i in 0..<(indices.count - 1) {
            let left = indices[i] + 1
            let right = indices[i + 1] - 1
            if right - left + 1 >= k {
                curAns = max(curAns, longestSubstring([Character](chars[left...right]), k))
            }
        }
        return curAns
    }
}