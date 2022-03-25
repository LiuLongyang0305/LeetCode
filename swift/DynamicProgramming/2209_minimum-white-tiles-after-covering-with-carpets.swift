// https://leetcode.com/problems/minimum-white-tiles-after-covering-with-carpets/
class Solution {
   func minimumWhiteTiles(_ floor: String, _ numCarpets: Int, _ carpetLen: Int) -> Int {
       let N = floor.count
       guard numCarpets * carpetLen < N else { return 0}
       var preffix = [0]
       
       floor.forEach {  preffix.append(preffix.last! + ($0 == "0" ? 0 : 1))}
       guard preffix.last! != 0 else {return 0}
       guard carpetLen > 1 else {
           return max(0, preffix.last! - numCarpets)
       }
       let floorChars = [Character](floor)
       
       
       var memo = [[Int]](repeating: [Int](repeating: -1, count: numCarpets + 5), count: N + 5 )
       
       
       func dfs(_ idx: Int, _ remainCarpets: Int) -> Int {
           guard remainCarpets > 0 else {
               return preffix.last! - preffix[idx]
           }
           
           let remainBricks = N - idx
           guard remainCarpets * carpetLen < remainBricks else {
               return 0
           }
           guard -1 == memo[idx][remainCarpets] else {
              return  memo[idx][remainCarpets]
           }
           let currentTitle = floorChars[idx] == "0" ? 0 : 1
           let ans =  min(currentTitle + dfs(idx + 1, remainCarpets),dfs(idx + carpetLen, remainCarpets - 1))
           memo[idx][remainCarpets] = ans
           return ans
       }
       return dfs(0, numCarpets)
   }
}
