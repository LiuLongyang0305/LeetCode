// https://leetcode.com/problems/replace-question-marks-in-string-to-minimize-its-value/
struct HeapNode {
    var value: Character
    var cnt: Int

}
extension HeapNode: Comparable {
    static func < (lhs: HeapNode, rhs: HeapNode) -> Bool {
        if lhs.cnt == rhs.cnt {
            return lhs.value < rhs.value
        }
        return lhs.cnt < rhs.cnt
    }
}
class Solution {
    private let lowercaseLetters:[Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    func minimizeStringValue(_ s: String) -> String {
        guard let _ = s.firstIndex(of: "?") else {return s}
        var heap = Heap<HeapNode>()
        var counter = [Character:Int]()
        for ch in s {
            counter[ch,default: 0] += 1
        }

        for ch in lowercaseLetters {
            if let cnt = counter[ch] {
                heap.insert(HeapNode(value: ch, cnt: cnt))
            } else {
                heap.insert(HeapNode(value: ch, cnt: 0))
            }
        }

        var candidates:[Character] = []
        for _ in 0..<counter["?"]! {
            var minNode = heap.popMin()!
            candidates.append(minNode.value)
            minNode.cnt += 1
            heap.insert(minNode)
        }
        candidates.sort()
        var ans = ""
        for ch in s {
            if ch == "?" {
                ans.append(candidates.removeFirst())
            } else {
                ans.append(ch)
            }
        }
        return ans
    }
}