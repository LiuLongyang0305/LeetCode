
// https://leetcode.com/problems/stickers-to-spell-word/
extension Sequence where Element == Character {
    var counter:[Character:Int] {
        var ans = [Character:Int]()
        self.forEach { ans.updateValue((ans[$0] ?? 0) + 1, forKey: $0)}
        return ans
    }
}
extension Dictionary where Key == Character, Value == Int {
    func sub(other counter: [Character:Int]) -> [Character:Int] {
        var ans = self
        for (key,val) in self {
            if let v2 = counter[key] {
                if v2 >= val {
                    ans.removeValue(forKey: key)
                } else {
                    ans.updateValue(val - v2, forKey: key)
                }
            }
        }
        return ans
    }
}
class Solution1 {
    func minStickers(_ stickers: [String], _ target: String) -> Int {
        
        var stickersChars = Set<Character>()
        stickers.forEach {$0.forEach {stickersChars.insert($0)}}
        let targetSet = Set<Character>(target)
        guard targetSet.isSubset(of: stickersChars) else {
            return -1
        }
        
        var usefulCounters = [[Character:Int]]()
        stickers.forEach { (sticker) in
            if !targetSet.intersection(Set<Character>(sticker)).isEmpty {
                usefulCounters.append(sticker.counter)
            }
        }
        let targetCounter = target.counter
        
        var wordsCount = 0
        var visited = Set<[Character:Int]>()
        visited.insert(targetCounter)
        var queue = [[Character:Int]]()
        queue.append(targetCounter)
        while !queue.isEmpty {
            wordsCount += 1
            var nextLevel = [[Character:Int]]()
            for counter in queue {
                
                for wordCounter in usefulCounters {
                    let ans = counter.sub(other: wordCounter)
                    if ans.isEmpty {
                        return wordsCount
                    } else if !visited.contains(ans) {
                        visited.insert(ans)
                        nextLevel.append(ans)
                    }
                }
            }
            queue = nextLevel
        }
        return -1
    }
}

class Solution {
    func minStickers(_ stickers: [String], _ target: String) -> Int {
        var targetArr = [Int](repeating: 0, count: 26)
        let tArr = Array(target)
        for c in tArr{
            let k = Int(c.asciiValue! - 97)
            targetArr[k] += 1
        }
        var stickersArr = [[Int]](repeating: [Int](repeating: 0, count: 26), count: stickers.count)
        for i in 0..<stickers.count{
            let sticker = stickers[i]
            let sArr = Array(sticker)
            for c in sArr{
                let k = Int(c.asciiValue! - 97)
                if targetArr[k] != 0 {
                    stickersArr[i][k] += 1
                }
            }
        }
        var map = [String:Int]()
        map[""] = 0
        var res = -1
        res = next(&map, target, stickersArr)
        return res
    }
    
    func next(_ map : inout [String:Int] , _ target : String , _ stickersArr : [[Int]]) -> Int{
        if map[target] != nil {
            return map[target]!
        }
        var res = Int.max
        let stringArr = Array(target)
        let k = Int(stringArr[0].asciiValue! - 97)
        var targetArr = [Int](repeating: 0, count: 26)
        for c in stringArr{
            let k = Int(c.asciiValue! - 97)
            targetArr[k] += 1
        }
        for stickerArr in stickersArr{
            if stickerArr[k] == 0 {
                continue
            }
            var str = ""
            for i in 0..<26{
                if targetArr[i] > stickerArr[i]{
                    str += String(repeating: Character(UnicodeScalar(i + 97)!), count: targetArr[i] - stickerArr[i])
                }
            }
            let r = next(&map,str,stickersArr)
            if r >= 0 {
                res = min(r + 1,res)
            }
        }
        if res == Int.max{
            res = -1
        }
        map[target] = res
        return res
    }
}



//Solution3
typealias StringInfo = (counter: [Int], mask: Int)
extension String {
    var info: StringInfo {
        var ans = [Int](repeating: 0, count: 26)
        var mask = 0
        for ch in self {
            let idx = Int(ch.asciiValue! - 97)
            ans[idx] += 1
            mask |= (1 << idx)
        }
        return (ans,mask)
    }
    
}
class Solution {
    private var memo = [[Int]:Int]()
    private var stickerInfos = [StringInfo]()
    func minStickers(_ stickers: [String], _ target: String) -> Int {
        let targetInfo = target.info
        var stickerInfos = [StringInfo]()
        var totalMask = 0
        for sticker in stickers {
            var info = sticker.info
            info.mask &= targetInfo.mask
            guard info.mask != 0 else {
                continue
            }
            for idx in 0...25 {
                if info.mask & (1 << idx) == 0 {
                    info.counter[idx] == 0
                }
            }
            stickerInfos.append(info)
            totalMask |= info.mask
            
        }
        guard totalMask == targetInfo.mask else {
            return -1
        }
        
        self.memo = [:]
        self.stickerInfos = stickerInfos
        
        return dfs(info: targetInfo )
    }
    
    private func dfs(info: StringInfo) -> Int {
        guard info.mask > 0 else {
            return 0
        }
        guard nil == memo[info.counter] else {
            return memo[info.counter]!
        }
        var cnt = Int.max
        var targetMask = -1
        for bit in 0...25 {
            if info.mask & (1 << bit) != 0 {
                targetMask = (1 << bit)
                break
            }
        }
        for (counter,mask) in self.stickerInfos {
            guard mask & targetMask != 0 else {
                continue
            }
            let temp = info.mask & mask
            var curCounter = info.counter
            for idx in 0...25 {
                if temp & (1 << idx) != 0 {
                    curCounter[idx] = max(0, info.counter[idx] - counter[idx])
                }
            }
            var curMask = 0
            for idx in 0...25 {
                if curCounter[idx] > 0 {
                    curMask |= (1 << idx)
                }
            }
            let v = 1 + dfs(info: (curCounter,curMask))
            if v < cnt {
                cnt = v
            }
        }
        memo[info.counter] = cnt
        return cnt
    }
}