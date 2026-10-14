//https://leetcode.cn/problems/better-compression-of-string/
class Solution {
    func betterCompression(_ compressed: String) -> String {

        var copy = compressed
        var counter = [Character:Int]()
        while let f = copy.first, f.isLowercase {
            let f = copy.removeFirst()
            for l in stride(from: 5, through: 1, by: -1) {
                guard copy.count >= l else {continue}
                if let num = Int(copy.prefix(l)) {
                    counter[f,default: 0] += num
                    copy.removeFirst(l)
                    break
                }
            }

        }
        // print(counter)
        let sortedKeys = counter.keys.sorted()
        return sortedKeys.reduce("") {$0 + "\($1)\(counter[$1]!)"}
    }
}
