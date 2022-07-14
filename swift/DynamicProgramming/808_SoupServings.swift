//https://leetcode.com/problems/soup-servings/ 
class Solution {
    func soupServings(_ N: Int) -> Double {
        guard N != 0 else {
            return 0.5
        }
        guard N < 5000 else {
            return 1.0
        }
        let soupVolume = Int(ceil(Double(N) / 25))

        var probability  = Array<Array<Double>>(repeating: Array<Double>(repeating: 0, count: soupVolume + 1), count: soupVolume + 1)
        probability[0][0] =  0.5
        for i in 1...soupVolume {
            probability[0][i] = 1
        }
        for soupAVolume in 1...soupVolume {
            let remainSoupA: [Int] = [soupAVolume - 4 > 0 ? soupAVolume - 4 : 0,soupAVolume - 3 > 0 ? soupAVolume - 3 : 0,soupAVolume - 2 > 0 ? soupAVolume - 2 : 0,soupAVolume - 1 > 0 ? soupAVolume - 1 : 0]
            for soupBVolume in 1...soupVolume {
                let remainSoupB = [soupBVolume,soupBVolume - 1 > 0 ?  soupBVolume - 1 : 0,soupBVolume - 2 > 0 ?  soupBVolume - 2 : 0,soupBVolume - 3 > 0 ?  soupBVolume - 3 : 0]
                
                probability[soupAVolume][soupBVolume] = 0.25  * (probability[remainSoupA[0]][remainSoupB[0]] + probability[remainSoupA[1]][remainSoupB[1]] + probability[remainSoupA[2]][remainSoupB[2]]  + probability[remainSoupA[3]][remainSoupB[3]])
            }
        }
        return probability[soupVolume][soupVolume]
    }
 }



 class Solution {
    private let err = 1e-7
    func soupServings(_ n: Int) -> Double {

        guard n <= 4450 else {return 1.0}
        let N = Int(ceil(Double(n) / 25.0))
        var memo = [Int:Double]()
        func dfs(_ soupA:Int, _ soupB:Int) -> Double {
            guard soupA > 0 else {
                return soupB == 0 ? 0.5 : 1.0
            }
            guard soupB > 0 else {return 0}
            let key = soupA << 30 | soupB
            if let v = memo[key] {
                return v
            }
            let ans = 0.25 * (dfs(max(soupA - 4,0), soupB) + dfs(max(soupA - 3,0), max(soupB - 1,0)) + dfs(max(soupA - 2,0), max(soupB - 2,0)) + dfs(max(soupA - 1,0), max(soupB - 3,0)))
            memo[key] = ans
            return ans
        }

        return dfs(N, N)
    }
}