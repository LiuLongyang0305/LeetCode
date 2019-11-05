//https://leetcode.com/problems/open-the-lock/
class Solution {
    let  charToNumber: [Character:Int] = ["0":0,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9]
    func openLock(_ deadends: [String], _ target: String) -> Int {
        let deadendsSet = Set<[Int]>(deadends.map({ (str) -> [Int] in
            return  str.map{charToNumber[$0]!}
        }))
        var nextNumbers = Array<Array<Int>>(repeating: Array<Int>(), count: 10)
        for i in 0...9 {
            nextNumbers[i].append(i == 0 ?  9 : i - 1 )
            nextNumbers[i].append(i == 9 ? 1 : i + 1 )
        }
        
        func createNextLevelNumbers(current number: [Int]) -> [[Int]] {
            var ans = Array<Array<Int>>(repeating: number, count: 8)
            for i in 0...3 {
                for j in 0...1 {
                    ans[i * 2 + j][i] = nextNumbers[number[i]][j]
                }
            }
            return ans
        }
        var visited = Set<[Int]>()
        let startNumer = [0,0,0,0]
        guard !deadendsSet.contains(startNumer) else {
            return -1
        }
        let targetNumber = target.map{charToNumber[$0]!}
        visited.insert(startNumer)
        var nodes = Array<[Int]>()
        nodes.append(startNumer)
        var depth = 0
        while !nodes.isEmpty {
            let length = nodes.count
            depth += 1
            for _ in 0..<length {
                let number = nodes.removeFirst()
                let nextLevelNumbers = createNextLevelNumbers(current: number)
                for next in nextLevelNumbers {
                    if next == targetNumber {
                        return depth
                    }
                    if !deadendsSet.contains(next) && !visited.contains(next){
                        visited.insert(next)
                        nodes.append(next)
                    }
                }
            }
        }
        return -1
    }
}