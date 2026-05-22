    //https://leetcode.com/problems/count-caesar-cipher-pairs/
extension Character {
     func distanceK(_ dis: UInt8) -> Character {
        let t = self.asciiValue! + dis
        return Character.init(Unicode.Scalar.init(t >= 123 ? (t - 26) : t))
    }
}
    class Solution {
        let nextChracterAValue: UInt8 = 123
        func countPairs(_ words: [String]) -> Int {
            var sb = 0
            var cnt = [String:Int]()
            for str in words {
                let t = convert(str)
                sb += cnt[t] ?? 0
                cnt[t,default: 0] += 1
            }
            return sb
        }

        private func convert(_ str: String) -> String {
            guard let f = str.first, f != "a" else {return str}
            let deltaDis = nextChracterAValue - f.asciiValue!
            let sb = String(str.map({ $0.distanceK(deltaDis)}))
            // print(" d = \(deltaDis)  \(str)  -->  \(sb)")
            return sb
        }
    }
