//https://leetcode.com/problems/lemonade-change/
class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var remainder = 0
        var billsCount: [Int: Int] = [5:0,10:0,20:0]
        for bill in bills {
            if remainder < bill - 5 {
                return false
            }
            switch bill {
            case 5:
                billsCount[5] = billsCount[5]! + 1
            case 10:
                if billsCount[5]! < 0 {
                    return false
                }
                billsCount[5] = billsCount[5]! - 1
                billsCount[10] = billsCount[10]! + 1
            case 20:
                if billsCount[10]! > 0 {
                    if billsCount[5]! < 1 {
                        return false
                    } else {
                        billsCount[10] = billsCount[10]! - 1
                        billsCount[5] = billsCount[5]! - 1
                    }
                } else if billsCount[5]! > 2 {
                    billsCount[5] = billsCount[5]! - 3
                } else {
                    return false
                }
                billsCount[20] = billsCount[20]! + 1
            default:
                break
            }
            remainder += 5
        }
        return true
    }
}