// https://leetcode.com/problems/decremental-string-concatenation/
class Solution1 {
    struct Info: Hashable {
        var first:Character
        var last: Character
    }
    func minimizeConcatenatedLength(_ words: [String]) -> Int {
        var counter = [Info:Int]()
        counter[Info(first: words[0].first!, last: words[0].last!)] = words[0].count
        for word in words.dropFirst() {
            let (f,l) = (word.first!, word.last!)
            var newCounter = [Info:Int]()
            for (info,lenngth) in counter {
                //str + last
                var newInfo = Info(first: f, last: info.last)
                var newLength = lenngth + word.count - (l == info.first ? 1 : 0)
                if let curLength = newCounter[newInfo] {
                    newCounter[newInfo] = min(curLength,newLength)
                } else {
                    newCounter[newInfo,default: 0] = newLength
                }
                //last + str
                newInfo = Info(first: info.first, last: l)
                newLength = lenngth + word.count - (f == info.last ? 1 : 0)
                if let curLength = newCounter[newInfo] {
                    newCounter[newInfo] = min(curLength,newLength)
                } else {
                    newCounter[newInfo,default: 0] = newLength
                }
            }
            counter = newCounter
        }
        return counter.values.min() ?? 0
    }
}


class Solution {

    func minimizeConcatenatedLength(_ words: [String]) -> Int {


        let N = words.count
        var memo = [String:Int]()
        func dfs(_ cur: Int, _ lastStrFirstChar: Character, _ lastStrLastChar: Character) -> Int {
            guard cur < N else {return 0}
            let key = "\(cur)_\(lastStrFirstChar)_\(lastStrLastChar)"
            if let v = memo[key] {
                return v
            }
            var ans = 1_000_000_007
            let (f,l,length) = (words[cur].first!, words[cur].last!,words[cur].count)
            //str + last
            ans = min(ans, length - (l == lastStrFirstChar ? 1 : 0) + dfs(cur + 1, f, lastStrLastChar))
            //last + str
            ans = min(ans, length - (f == lastStrLastChar ? 1 : 0) + dfs(cur + 1, lastStrFirstChar, l))
            memo[key] = ans
            return ans
        }

        return   words[0].count +  dfs(1, words[0].first!, words[0].last!)
    }
}
