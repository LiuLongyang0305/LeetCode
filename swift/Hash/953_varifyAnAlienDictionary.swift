class Q953_Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var dic : Dictionary<Character,Set<Character>> = Dictionary<Character,Set<Character>>()
        for index in order.indices {
            dic[order[index]] = Set<Character>(order[index..<order.endIndex])
        }
        for i in 0..<(words.count - 1) {
            
            var index1 = words[i].startIndex
            var index2 = words[i + 1].startIndex
            let endIndex1 = words[i].endIndex
            let endIndex2 = words[i + 1].endIndex
            
            while index1 != endIndex1 && index2 != endIndex2 && words[i][index1] == words[i + 1][index2] {
                index1 = words[i].index(after: index1)
                index2 = words[i + 1].index(after: index2)
            }
            if index1 == endIndex1 {
                continue
            } else {
                if index1 != endIndex1 && index2 == endIndex2 {
                    return false
                } else {
                    if !(dic[words[i][index1]]?.contains(words[i + 1][index2]))! {
                        return false
                    }
                }
            }
        }
        return true
    }
}