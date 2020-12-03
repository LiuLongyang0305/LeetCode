// https://leetcode-cn.com/problems/three-in-one-lcci/
class TripleInOne {
    private var stack: [Int]
    private var pointers: Array<Int>
    private var stackSize: Int
    init(_ stackSize: Int) {
        stack = Array<Int>(repeating: Int.max, count: stackSize * 3)
        pointers = [0,stackSize, 2 * stackSize]
        self.stackSize = stackSize
    }
    
    func push(_ stackNum: Int, _ value: Int) {
        guard pointers[stackNum] < (stackNum + 1) * stackSize else {
            return
        }
        stack[pointers[stackNum]] = value
        pointers[stackNum] += 1
    }
    
    func pop(_ stackNum: Int) -> Int {
        guard pointers[stackNum] > stackNum * stackSize else {
            return -1
        }
        pointers[stackNum] -= 1
        let a = stack[pointers[stackNum]]
        stack[pointers[stackNum]] = Int.max
        return a
    }
    
    func peek(_ stackNum: Int) -> Int {

        guard pointers[stackNum] > stackNum * stackSize else {
            return -1
        }
        return stack[pointers[stackNum] - 1]
    }
    
    func isEmpty(_ stackNum: Int) -> Bool {
        return pointers[stackNum] == stackNum * stackSize
    }
}


/**
 * Your TripleInOne object will be instantiated and called as such:
 * let obj = TripleInOne(stackSize)
 * obj.push(stackNum, value)
 * let ret_2: Int = obj.pop(stackNum)
 * let ret_3: Int = obj.peek(stackNum)
 * let ret_4: Bool = obj.isEmpty(stackNum)
 */