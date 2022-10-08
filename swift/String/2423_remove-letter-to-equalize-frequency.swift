// https://leetcode.com/problems/remove-letter-to-equalize-frequency/
class Solution {
    func equalFrequency(_ word: String) -> Bool {
        var  counter = [Character:Int]()
        for ch in word {
            counter[ch,default: 0] += 1
        }
        let existedChars = [Character](counter.keys)
        for ch in existedChars {
            counter[ch,default: 0] -= 1
            // print(counter)
            var maxCnt = Int.min
            var minCnt = Int.max
            for (_,cnt) in counter {
                guard cnt != 0 else {continue}
                minCnt = min(cnt, minCnt)
                maxCnt = max(maxCnt, cnt)  
            }
            guard maxCnt != minCnt else {return true}
            counter[ch,default: 0] += 1
        }
        return false
    }
}