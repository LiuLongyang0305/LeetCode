// https://leetcode.com/problems/maximum-good-people-based-on-statements/
class Solution {
    func maximumGood(_ statements: [[Int]]) -> Int {
        let N = statements.count
        var ans = 0
        let maxMask = 1 << N



        func check(_ curMask: Int) -> Bool {

            for i in 0..<N {
                guard curMask & (1 << i) != 0 else {continue}
                for j in 0..<N {
                    if statements[i][j] == 0 {
                        guard curMask & (1 << j) == 0 else {return false}
                    } else if statements[i][j] == 1 {
                        guard curMask & (1 << j) != 0 else {return false}
                    }
                }
            }

            return true
        }


        var mask = 0
        while mask < maxMask {
            let bitsCnt = mask.nonzeroBitCount
            if bitsCnt > ans && check(mask){
                ans = bitsCnt
            }
            mask += 1
        }


        return ans
    }
}