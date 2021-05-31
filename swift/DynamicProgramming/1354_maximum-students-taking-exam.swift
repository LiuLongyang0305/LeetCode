// https://leetcode.com/problems/maximum-students-taking-exam/
class Solution {
    private var memo = [Int:Int]()
    private var seats = [[Character]]()
    private var M  = 0
    private var N = 0
    //状态--->学生人数
    private var stateToStudentNumbers = [Int]()
    //8个座位时，每行的可能状态：保证不相邻
    private var possibleSatesOfEachRow = [Int]()
    //上一层状态确定时，当前层状态可能选项
    private var lastLevelStateToCurrentLevelstate = [Int:Set<Int>]()
    init() {
        self.stateToStudentNumbers = (0...255).map({ countOnes(of: $0)})
        self.possibleSatesOfEachRow = (0...255).filter({ check($0)})
        self.lastLevelStateToCurrentLevelstate = caculatePossibleAdjentStates()
    }
    func maxStudents(_ seats: [[Character]]) -> Int {
        
        self.seats = seats
        self.M = seats.count
        self.N = seats[0].count
        self.memo = [:]
        let curPossibleStatesOfEachRow = self.possibleSatesOfEachRow.filter { $0 < (1 << N)}
        
        var possibleStateOfSpecificRow = [[Int]]()
        
        (0..<M).forEach { row in
            possibleStateOfSpecificRow.append(curPossibleStatesOfEachRow.filter({ state in
                checkBrokenSeats(row, state)
            }))
        }
        

        return dfs(0, 0, possibleStateOfSpecificRow) ?? 0
    }
    
    //保证左右不相邻
    private func check(_ state: Int) -> Bool {
        for bit in 0...7 {
            guard (state & (1 << bit)) * (state & (1 << (bit + 1))) == 0 else {
                return false
            }
        }
        return true
    }
    //保证损坏的座位没有人
    private func checkBrokenSeats(_ row: Int, _ state: Int) -> Bool {
        for col in 0..<N {
            guard state & (1 << col) == 0 || self.seats[row][col] != "#" else {
                return false
            }
        }
        return true
    }
    
    private func caculatePossibleAdjentStates() -> [Int:Set<Int>] {
        
        //(r,c)位置有考生，则(r + 1,c - 1)和(r + 1, c + 1)位置上不能有考生。
        func checkInternal(lastLevelState: Int, currentLevelState: Int) -> Bool {
            guard lastLevelState != currentLevelState else {
                return true
            }
            for bit in 0...7 {
                guard  lastLevelState & (1 << bit) != 0 else {
                    continue
                }
                guard bit - 1 < 0 || currentLevelState & 1 << (bit - 1) == 0 else {
                    return false
                }
                guard bit + 1 > 7 ||  currentLevelState & 1 << (bit + 1) == 0 else {
                    return false
                }
            }
            
            return true
        }
        
        var ans = [Int:Set<Int>]()
        //枚举上一层的状态
        for ls in self.possibleSatesOfEachRow {
            var temp = Set<Int>()
            for cs in self.possibleSatesOfEachRow {
                if checkInternal(lastLevelState: ls, currentLevelState: cs) {
                    temp.insert(cs)
                }
            }
            ans[ls] = temp
        }
        return ans
        
    }
    private func countOnes(of num: Int) -> Int {
        return (0...7).reduce(0) { $0 + (num & (1 << $1) == 0 ? 0 : 1)}
    }
    
    private func dfs(_ lastLevelState: Int, _ row: Int, _ possibleStatesOfSpecificRow: [[Int]]) -> Int? {
        guard row < M  else {
            return 0
        }
        let key = row << 16 | lastLevelState
        guard nil == memo[key] else {
            return memo[key]! == -1 ? nil : memo[key]
        }
        var curMaxStudengtsNumber: Int? = nil
        guard let nextLevelPossibleStates = self.lastLevelStateToCurrentLevelstate[lastLevelState] else {
            return nil
        }

        for s in possibleStatesOfSpecificRow[row] {
            guard nextLevelPossibleStates.contains(s) else {
                continue
            }
            if let v = dfs(s, row + 1, possibleStatesOfSpecificRow) {
                curMaxStudengtsNumber = max(curMaxStudengtsNumber ?? 0, v + self.stateToStudentNumbers[s])
            }
        }
        guard let v = curMaxStudengtsNumber else {
            return nil
        }
        defer {
            memo[key] = curMaxStudengtsNumber ?? -1
        }
        return v
    }
}