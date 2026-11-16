// https://leetcode.cn/problems/find-longest-self-contained-substring/
class Solution {
    private typealias Triple = (l:Int,r:Int,cnt:Int)
    func maxSubstringLength(_ s: String) -> Int {
        let chToVal = s.map { Int($0.asciiValue! - 97)}
        let N = chToVal.count
        var memo = [Triple](repeating: (-1,-1,0), count: 26)
        var preffixCounter = [[Int]]()
        var counter = [Int](repeating: 0, count: 26)
        preffixCounter.append(counter)
        for (i,v) in chToVal.enumerated() {
            if memo[v].l == -1 {
                memo[v] = (i,i,1)
            } else {
                memo[v].r = i
                memo[v].cnt += 1
            }
            counter[v] += 1
            preffixCounter.append(counter)
        }

        func check(_ L:Int, _ R: Int) -> Bool {

            for v in 0..<26 {
                let (_,_,c) = memo[v]
                let curC = preffixCounter[R + 1][v] - preffixCounter[L][v]
                guard curC == 0 || curC == c else {return false}
            }
            return true
        }
        var possipleSplitIndices = [Int]()
        for i in 0..<26 {
            if memo[i].l != -1 {
                possipleSplitIndices.append(memo[i].l)
                possipleSplitIndices.append(memo[i].r)
            }
        }
        possipleSplitIndices.sort()


        let M = possipleSplitIndices.count
        var ans = -1
        for i in 0..<M {

            for j in stride(from: i + 1, to: M, by: 1) {
                let (l,r) = (possipleSplitIndices[i],possipleSplitIndices[j])
                //不是整个字符串
                guard l > 0 || r < (N - 1) else {continue}
                if check(l, r) {
                    ans = max(ans, r - l + 1)
                }
            }
        }
        return ans
    }
}
