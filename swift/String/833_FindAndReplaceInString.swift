//https://leetcode.com/problems/find-and-replace-in-string/
class Solution {
    func findReplaceString(_ S: String, _ indexes: [Int], _ sources: [String], _ targets: [String]) -> String {
        var temp = S
        var  indexesCopy = indexes
        for i in 0..<indexesCopy.count {
            
            let  index = indexesCopy[i]
            let length = sources[i].count
            if  index + length > temp.count {
                continue
            }
            let from = temp.index(temp.startIndex, offsetBy: index)
            let to = temp.index(from, offsetBy: length)
            if String(temp[from..<to]) == sources[i] {
                let subrange = Range<String.Index>(uncheckedBounds: (lower: from, upper: to))
                temp.replaceSubrange(subrange, with: targets[i])
                let deltaIndex = targets[i].count - length
                if deltaIndex != 0 {
                    for j in (i + 1)..<indexesCopy.count {
                        if indexesCopy[j] >= index {
                            indexesCopy[j] += deltaIndex
                        }
                    }
                }
                
            }
        }
        return temp
    }
}


class Solution2 {
    func findReplaceString(_ S: String, _ indexes: [Int], _ sources: [String], _ targets: [String]) -> String {
        var temp = S
        var operations = [(index: Int, source: String, target: String)]()
        for i in 0..<indexes.count {
            operations.append((indexes[i],sources[i],targets[i]))
        }
        operations.sort { (ope1, ope2) -> Bool in
            ope1.index > ope2.index
        }
        for operation in operations {
            let length = operation.source.count
            if operation.index + length > temp.count {
                continue
            }
            let from = temp.index(temp.startIndex, offsetBy: operation.index)
            let to = temp.index(from, offsetBy: length)
            if String(temp[from..<to]) == operation.source {
                temp.replaceSubrange(Range<String.Index>(uncheckedBounds: (lower: from, upper: to)), with: operation.target)
            }
        }
        return temp
    }
}



