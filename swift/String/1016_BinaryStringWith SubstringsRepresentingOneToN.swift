//https://leetcode.com/problems/binary-string-with-substrings-representing-1-to-n/
class Solution {
    func queryString(_ S: String, _ N: Int) -> Bool {
        let  length = min(65, S.count + 1,intToString(N).count + 1)
        var intToStrings = Array<Set<String>>(repeating: Set<String>(), count: length)
        let chars = [Character](S)
        for i in 1..<length {
            let maxCount = Int(pow(2.0, Double(i)))
            var j =  i
            var k = 0
            while j <= S.count && intToStrings[i].count < maxCount {
                intToStrings[i].insert(String(chars[k..<j]))
                j += 1
                k += 1
            }
        }
        for i in 1...N {
            let str = intToString(i)
            if str.count >= length {
                return false
            }
            if !intToStrings[str.count].contains(str)  {
                return false
            }
        }
        return true
    }
    func intToString(_ number: Int) -> String  {
        var ans = ""
        var i = number
        while i > 0 {
            let ch: Character = i &  1 == 0 ? "0" : "1"
            ans.insert(ch, at: ans.startIndex)
            i >>= 1
        }
        return ans
    }
}