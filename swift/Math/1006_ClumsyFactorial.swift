//https://leetcode.com/problems/clumsy-factorial/
class Solution1 {
    enum Operation {
        case multiply
        case divide
        case add
        case subtract
        
        mutating func next()  {
            switch self {
            case .subtract:
                self = .multiply
            case .multiply:
                self = .divide
            case .divide:
                self = .add
            case .add:
                self = .subtract
            }
        }
    }
    func clumsy(_ N: Int) -> Int {
        var original: Operation = .subtract
        var temp = N
        var arr = [Int]()
        arr.append(temp)
        temp -= 1
        while temp > 0 {
            original.next()
            switch original {
            case .subtract:
                arr.append(-temp)
            case .multiply:
                arr.append(arr.removeLast() * temp)
            case .divide:
                arr.append(arr.removeLast() / temp)
            case .add:
                arr.append(temp)
            }
            temp -= 1
        }
        return arr.reduce(0) { $0 + $1}
    }
}

class Solution {
    func clumsy(_ N: Int) -> Int {
        if N == 1 {
            return 1
        } else if N == 2 {
            return 2
        } else if N == 3 {
            return 6
        } else if N == 4 {
            return 7
        } else {
            let arr = [1,2,2,-1]
            return N + arr[N % 4]
        }
    }
}

