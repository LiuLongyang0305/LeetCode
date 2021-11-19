 // https://leetcode.com/problems/maximum-number-of-non-overlapping-substrings/
class Solution {
    struct IndexPair : Hashable{
        var left: Int
        var right: Int
    }
    typealias Info = (length: Int, total: Int )
    func maxNumOfSubstrings(_ s: String) -> [String] {
        
        //预处理每个字母的左右idx
        //以及前缀数组统计各个字符个数
        let sToInt = s.map { Int($0.asciiValue! - 97)}
        var preffix = [[Int]]()
        var counter = [Int](repeating: 0, count: 26)
        preffix.append(counter)
        var indices = [IndexPair](repeating: IndexPair(left: -1, right: -1), count: 26)
        for idx in 0..<s.count {
            counter[sToInt[idx]] += 1
            preffix.append(counter)
            let i = sToInt[idx]
            if -1 == indices[i].left {
                indices[i] = IndexPair(left: idx, right: idx)
            } else {
                indices[i].right = idx
            }
            
        }
        //扩展，使满足条件2
        var remainIndicesPairs = indices.filter { -1 != $0.left}
        while true {
            var newLevel = [IndexPair]()
            var flag = false
            for rp in remainIndicesPairs {
                let c1 = preffix[rp.left]
                let c2 = preffix[rp.right + 1]
                var np = rp
                for i in 0...25 {
                    if c2[i] > c1[i] {
                        np.left = min(np.left, indices[i].left)
                        np.right = max(np.right, indices[i].right)
                    }
                }
                if np.left != rp.left || np.right != rp.right {
                    flag = true
                }
                newLevel.append(np)
            }
            guard flag else {break}
            remainIndicesPairs = newLevel
        }
        //去重，扩展之后可能有重复；然后排序
        remainIndicesPairs = [IndexPair](Set<IndexPair>(remainIndicesPairs))
        remainIndicesPairs.sort { p1, p2 in
            p1.left < p2.left
        }
        //        print(remainIndicesPairs)
        //最长上升子序列类似算法
        let M = remainIndicesPairs.count
        var last = [Int](repeating: -1, count: M)
        let lengths = remainIndicesPairs.map { $0.right - $0.left + 1}
        var dp: [Info] = (0..<M).map { (1,lengths[$0])}
        var i = 1
        while i < M {
            var j = i - 1
            while j >= 0 {
                if remainIndicesPairs[i].left > remainIndicesPairs[j].right {
                    if dp[j].length + 1 > dp[i].length || (dp[j].length + 1 == dp[i].length && dp[j].total + lengths[i] < dp[i].total ) {
                        dp[i].length = dp[j].length + 1
                        dp[i].total = dp[j].total + lengths[i]
                        last[i] = j
                    }
                }
                j -= 1
            }
            i += 1
        }
        //        print(dp)
        var resIndex = 0
        for idx in 0..<M {
            if dp[idx].length > dp[resIndex].length || (dp[idx].length == dp[resIndex].length  && dp[idx].total < dp[resIndex].total) {
                resIndex = idx
            }
        }
        //根据last数组构造答案
        let chars = [Character](s)
        var ans = [String]()
        while -1 != resIndex {
            ans.append(String(chars[remainIndicesPairs[resIndex].left...remainIndicesPairs[resIndex].right]))
            resIndex = last[resIndex]
        }
        return ans
    }
}