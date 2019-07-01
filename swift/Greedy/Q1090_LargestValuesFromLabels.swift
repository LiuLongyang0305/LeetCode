//https://leetcode.com/problems/largest-values-from-labels/
class Solution {
    struct ValueWithLabel: Comparable {
        var value: Int
        var label: Int
        
        static func <(first: ValueWithLabel, second: ValueWithLabel) -> Bool {
            return first.value < second.value
        }
        static func >(first: ValueWithLabel, second: ValueWithLabel) -> Bool {
            return first.value > second.value
        }
        static func ==(first: ValueWithLabel, second: ValueWithLabel) -> Bool {
            return first.value == second.value
        }
    }
    
    func largestValsFromLabels(_ values: [Int], _ labels: [Int], _ num_wanted: Int, _ use_limit: Int) -> Int {
        var ans = 0
        var data = Array<ValueWithLabel>()
        for i in 0..<values.count {
            data.append(Solution.ValueWithLabel(value: values[i], label: labels[i]))
        }
        data = data.sorted(by: > )
        var labelCount = Dictionary<Int,Int>()
        var choosedValueNumber = 0
        for ele in data {
            if nil == labelCount[ele.label] {
                labelCount[ele.label] = 1
            } else {
                labelCount[ele.label] = labelCount[ele.label]! + 1
            }
            if labelCount[ele.label]! <= use_limit {
                ans += ele.value
                choosedValueNumber += 1
            }
            if choosedValueNumber == num_wanted {
                break
            }
        }
        return ans
    }
}
