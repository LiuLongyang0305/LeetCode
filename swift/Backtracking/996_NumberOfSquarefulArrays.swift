//https://leetcode.com/problems/number-of-squareful-arrays/
class Solution {
    
    func numSquarefulPerms(_ A: [Int]) -> Int {
        var ans = 0
        var set = Set<[Int]>()
        var map = [Int:Set<Int>]()
        for i in 0..<(A.count - 1) {
            for j in (i + 1)..<A.count {
                if isSqureNumber(A[i] + A[j]) {
                    if nil == map[i] {
                        map[i] = []
                    }
                    if nil == map[j] {
                        map[j] = []
                    }
                    map[i]?.insert(j)
                    map[j]?.insert(i)
                }
            }
        }
        
        func backtracking(_ currentArr: inout [Int], _ visited: inout [Bool],_ lastIndex: Int) {
            guard currentArr.count < A.count else {
                if !set.contains(currentArr) {
                    ans += 1
                    set.insert(currentArr)
                }
                return
            }
            if let indices = map[lastIndex] {
                var temp = Set<Int>()
                for index in indices {
                    if !visited[index] && !temp.contains(A[index]){
                        temp.insert(A[index])
                        visited[index] = true
                        currentArr.append(A[index])
                        backtracking(&currentArr, &visited, index)
                        visited[index] = false
                        currentArr.removeLast()
                    }
                }
            }
        }
        var currentArr = [Int]()
        var visited = Array<Bool>(repeating: false, count: A.count)
        var beginings = Set<Int>()
        for i in 0..<A.count {
            if !beginings.contains(A[i]) {
                beginings.insert(A[i])
                currentArr.append(A[i])
                visited[i] = true
                backtracking(&currentArr, &visited,i)
                currentArr.removeLast()
                visited[i] = false
            }
        }
        return ans
    }
    
    private func isSqureNumber(_  num: Int) -> Bool {
        let sq = Int(sqrt(Double(num)))
        return sq * sq == num
    }
}