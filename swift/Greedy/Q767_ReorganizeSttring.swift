//https://leetcode.com/problems/reorganize-string/
class Solution {
    func reorganizeString(_ S: String) -> String {
        
        var count = Dictionary<Character,Int>()
        for ele in S {
            if nil == count[ele] {
                count[ele] = 1
            } else {
                count[ele] = count[ele]! + 1
            }
        }
        let sortedCount =  count.sorted { (arg0, arg1) -> Bool in
            let (_, value1) = arg1
            let (_, value) = arg0
            return value1 < value
        }
        if sortedCount.first!.value > (S.count + 1) / 2 {
            return ""
        }
        var resultArray = Array<Character>(repeating: " ", count: S.count)
        var i = 0
        for (char,count) in sortedCount {
            for _ in 0..<count {
                resultArray[i] = char
                i += 2
                if i >= S.count {
                    i = 1
                }
            }
        }
        return String(resultArray)
    }
}
