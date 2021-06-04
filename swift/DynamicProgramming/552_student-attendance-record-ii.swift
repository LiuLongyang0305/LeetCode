// https://leetcode.com/problems/student-attendance-record-ii/
/**
 首先求解全部结果，后续查表。
 
 需要记录的状态变量：
   1. 是否已经出现过"A"，决定下一位是否可以放置"A"
   2. 上一个位置的字符以及上上个位置的字符，由此判定前面是否是"LL"，进而确定下一步是否可以放置"L"
 因此总共2 * 3 * 3 = 18种状态。用三维数组记录当前个状态满足条件的出勤记录数量。
 
 1. i: 0表示没有出现过"A"; 1表示没有出现过"A";
 2. j: 0表示上一个位置放置的是"A";1表示上一个位置放置的是"L";2表示上一个位置放置的是"P";
 3. k: 0表示上上一个位置放置的是"A";1表示上上一个位置放置的是"L";2表示上上一个位置放置的是"P";

 */


class Solution {
    private let MOD = 1000000007
    private  static var memo = Array<Int>(repeating: 0, count: 100005)
    init() {
        if Solution.memo[1] == 0 {
            Solution.memo[1] = 3
            Solution.memo[2] = 8
            caculate()
        }
    }
    func checkRecord(_ n: Int) -> Int {
        return Solution.memo[n]
    }
    
    private func caculate() {
        
        //第二个位置放置完成所有可能出现情况
        var counter = Array<Array<Array<Int>>>(repeating: Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: 3), count: 3), count: 2)
        counter[0][2][2] = 1
        counter[1][0][2] = 1
        counter[1][2][0] = 1
        counter[0][1][2] = 1
        counter[0][2][1] = 1
        counter[1][0][1] = 1
        counter[1][1][0] = 1
        counter[0][1][1] = 1
        
        //利用上次结果，循环求解
        var idx = 3
        while idx <= 100000 {
            var newCounter = Array<Array<Array<Int>>>(repeating: Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: 3), count: 3), count: 2)
            
            for i in 0...1 {
                for j in 0...2 {
                    for k in 0...2 {
                        if counter[i][j][k] != 0 {
                            //"A": 以前位置没有出现过"A"，即 i = 0
                            if i == 0 {
                                newCounter[1][k][0] += counter[i][j][k]
                            }
                            //"L": 前面两个位置放置的不是"LL"
                            if !(j == 1 && k == 1) {
                                newCounter[i][k][1] += counter[i][j][k]
                            }
                            //"P":任何情况都可以放置"P"
                            newCounter[i][k][2] +=  counter[i][j][k]
                        }
                    }
                }
            }
            var total = 0
            for i in 0...1 {
                for j in 0...2 {
                    for k in 0...2 {
                        let t = newCounter[i][j][k] % MOD
                        counter[i][j][k] = t
                        total += t
                    }
                    
                }
            }
            Solution.memo[idx] = total % MOD
            idx += 1
        }
    }
}

