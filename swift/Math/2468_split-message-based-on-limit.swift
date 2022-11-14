// https://leetcode.com/problems/split-message-based-on-limit/
class Solution {
    func splitMessage(_ message: String, _ limit: Int) -> [String] {

        let N = message.count
        //枚举分段数
        for segments in 1...N {
            if get(segments, limit) >= N {
                return buildSplitParts(segments, message,limit)
            }
        }
        return []
    }


    //计算可以容纳的字符数
    private func get(_ segments: Int,_ limit: Int) -> Int {

        let len = "\(segments)".count
        var res = (limit - 3 - len) * segments

        //1...k占用字符数相关：
        //1位数 9个
        //2位数 90个
        //3位数900个
        var s = 0
        var i = 1
        var t = 9
        while i < len {
            res -= i * t
            s += t
            i += 1
            t *= 10
        }
        res -= len * (segments - s)
        return res
    }
    // 构造答案
    private func buildSplitParts(_ segments: Int,_ message:String,_ limit: Int) -> [String] {
        var ans = [String]()
        var nextIdx = message.startIndex
        let denominatorStr = "\(segments)"
        let denominatorStrCnt = denominatorStr.count
        let solidLength = denominatorStrCnt + 3

        var idx = 1
        while idx < segments {
            let t = limit - "\(idx)".count - solidLength
            let endIdx = message.index(nextIdx, offsetBy: t - 1)
            ans.append("\(message[nextIdx...endIdx])<\(idx)/\(denominatorStr)>")
            idx += 1
            nextIdx = message.index(after: endIdx)
        }

        ans.append("\(message[nextIdx...])<\(denominatorStr)/\(denominatorStr)>")

        return ans
    }
}