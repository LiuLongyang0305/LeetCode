class Q434_Solution {
    func countSegments(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        var count = 0
        var index  = s.startIndex
        while index < s.endIndex  && s[index] == " " {
            index = s.index(after: index)
        }
        if index == s.endIndex {
            return 0
        }
        var index2 = s.index(before: s.endIndex)
        while index2 >= index && s[index2] == " " {
            index2 =  s.index(before: index2)
        }
        
        while index <= index2 {
            if s[index] == " " && s[s.index(before: index)] != " "{
                count += 1
            }
            index = s.index(after: index)
        }
        return count + 1
    }
}