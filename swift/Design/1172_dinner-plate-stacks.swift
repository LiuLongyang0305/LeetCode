//  https://leetcode.com/problems/dinner-plate-stacks/
class DinnerPlates {
    private var values = [Int](repeating: Int.max, count: 200000 + 5)
    private var minAvailablePosition: Int = 0
    private var stackTopIdx = -1
    private let capacity: Int
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func push(_ val: Int) {
        // print(minAvailablePosition)
        values[minAvailablePosition] = val
        if minAvailablePosition > stackTopIdx {
            stackTopIdx = minAvailablePosition
        }
        while values[minAvailablePosition] != Int.max {
            minAvailablePosition += 1
        }
    }
    
    func pop() -> Int {
        
        while stackTopIdx >= 0 && values[stackTopIdx] == Int.max {
            stackTopIdx -= 1
        }
        
        guard stackTopIdx >= 0 else {
            return -1
        }
        
        let c = values[stackTopIdx]
        values[stackTopIdx] = Int.max
                
        if(stackTopIdx < minAvailablePosition) {
            minAvailablePosition = stackTopIdx
        }
        stackTopIdx -= 1
        return c
    }
    
    func popAtStack(_ index: Int) -> Int {
        var from = index * capacity
        var to = from + capacity - 1
        guard values[from] != Int.max else {
            return -1
        }
        while from < to {
            let mid = (from + to + 1) >> 1
            if values[mid] != Int.max {
                from = mid
            } else {
                to = mid - 1
            }
        }
        let c = values[from]
        values[from] = Int.max
        if from < minAvailablePosition {
            minAvailablePosition = from
        }
        return c
    }
}

/**
 * Your DinnerPlates object will be instantiated and called as such:
 * let obj = DinnerPlates(capacity)
 * obj.push(val)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.popAtStack(index)
 */