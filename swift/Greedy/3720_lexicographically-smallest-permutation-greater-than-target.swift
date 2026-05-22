//https://leetcode.cn/problems/lexicographically-smallest-permutation-greater-than-target/
class Solution {
    func lexGreaterPermutation(_ s: String, _ target: String) -> String {
        var sortedS = String(s.sorted { $0.asciiValue! > $1.asciiValue!})
        guard sortedS > target else {return ""}
        var counter = [Character:Int]()
        for ch in s {
            counter[ch,default: 0] += 1
        }

        var temp = target
        var tempSortedS = sortedS
        
        var sb = ""
        while let f = temp.first, let idx = sortedS.firstIndex(of: f) {
            temp.removeFirst()
            sortedS.remove(at: idx)
            guard sortedS > temp else {
                sortedS.insert(f, at: idx)
                temp.insert(f, at: temp.startIndex)
                break
            }
            sb.append(f)
        }
        let target = temp.first!.asciiValue!
        if let idx = sortedS.lastIndex(where: {$0.asciiValue! > target }) {
            sb.append(sortedS[idx])
            sortedS.remove(at: idx)
            if !sortedS.isEmpty {
                sb += String(sortedS.reversed())
            }
        }
        return sb
    }
}
