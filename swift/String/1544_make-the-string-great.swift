// https://leetcode.com/problems/make-the-string-great/
class Solution {
    func makeGood(_ s: String) -> String {
        var last = ""
        var cur = s
        while cur != last {
            var temp = ""
            for ch in cur {
                if temp.isEmpty {
                    temp.append(ch)
                } else {
                    if abs(Int(temp.last!.asciiValue!) - Int(ch.asciiValue!)) == 32 {
                        temp.removeLast()
                    } else {
                        temp.append(ch)
                    }
                }
            }
            (last,cur) = (cur,temp)
        }
        return cur
    }
}

