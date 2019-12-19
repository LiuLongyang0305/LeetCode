//https://leetcode.com/problems/knight-dialer/

```swift
 class Solution {
    private let MOD = 1_000_000_007
    private let dx = [2,2,-2,-2,1,1,-1,-1]
    private let dy = [-1,1,-1,1,2,-2,2,-2]
    
    func knightDialer(_ N: Int) -> Int {
        guard N > 1 else {
            return 10
        }
        
        func  valid(_ x:Int ,_ y: Int) -> Bool {
            guard x != 3 else {
                return y == 1
            }
            return x >= 0 && x < 3 && y >= 0 && y < 3
        }
        var ans = 0
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 1, count: 3), count: 4)
        dp[3][0] =  0
        dp[3][2] = 0
        for _ in 2...N {
            var dp2 = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: 3), count: 4)
            for x in 0..<4 {
                for y in 0..<3 {
                    for index in 0..<8 {
                        let nextX = x + dx[index]
                        let nextY = y + dy[index]
                        if valid(nextX, nextY)  {
                            dp2[nextX][nextY] = (dp2[nextX][nextY] + dp[x][y]) % MOD
                        }
                    }
                }
            }
            dp = dp2
        }
        for row in dp {
            for num in row {
                ans = (ans  + num) %  MOD
            }
        }
        return ans
    }
 }
```

/*
本题的特点：状态简单，可以直接推算出来：

1. 如果要想位于数字0的位置，那么上一个状态一定位于数字4或者6.
2. 如果要想位于数字1的位置，那么上一个状态一定位于数字8或者6.
3. 如果要想位于数字2的位置，那么上一个状态一定位于数字7或者9.
4. 如果要想位于数字3的位置，那么上一个状态一定位于数字4或者8.
5. 如果要想位于数字4的位置，那么上一个状态一定位于数字3或者9或者0.
6. 只要不是第一步，则不会落到5的位置。
7. 如果要想位于数字6的位置，那么上一个状态一定位于数字1或者7或者0.
8. 如果要想位于数字7的位置，那么上一个状态一定位于数字2或者6.
9. 如果要想位于数字8的位置，那么上一个状态一定位于数字1或者3.
10. 如果要想位于数字9的位置，那么上一个状态一定位于数字4或者2.
*/

```swift
 class Solution {
    private let MOD = 1_000_000_007
    func knightDialer(_ N: Int) -> Int {
        guard N > 1 else {
            return 10
        }
        var last = (1,1,1,1,1,1,1,1,1,1)
        for _ in 2...N {
            last = ((last.4 + last.6) % MOD,(last.6 + last.8) % MOD,(last.7 + last.9) % MOD,(last.4 + last.8) % MOD,(last.3 + last.9  + last.0) % MOD,0,(last.1 + last.7 + last.0) % MOD, (last.6 + last.2) % MOD,(last.1 + last.3) % MOD,(last.2 + last.4) % MOD)
        }
        return (last.0 + last.1 + last.2  + last.3 + last.4 +  last.5 + last.6 + last.7 + last.8 + last.9 ) % MOD
    }
 }
```
