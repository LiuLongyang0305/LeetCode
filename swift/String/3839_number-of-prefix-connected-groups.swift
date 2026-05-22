
    //https://leetcode.cn/problems/number-of-prefix-connected-groups/
    class Solution {
        func prefixConnected(_ words: [String], _ k: Int) -> Int {
            var map = [String:Int]()
            for word in words {
                guard word.count >= k else {continue}
                let preffix = String(word.prefix(k))
                map[preffix,default: 0] += 1
            }
            var sb = 0
            for (k,c) in map {
                if c >= 2 {
                    // print("\(k)  \(k.count) \(c) ")
                    sb += 1
                }
            }
            return sb
        }
    }
