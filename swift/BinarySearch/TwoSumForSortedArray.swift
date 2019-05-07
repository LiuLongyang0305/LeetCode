class Q167_Solution {
    var numbers : [Int] = []
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        self.numbers = numbers
        var result = [Int]()
        for i in 0...(numbers.count / 2 + 1) {
            if let index = findTarget(target: target - numbers[i],start:1) {
                result.append(i + 1)
                result.append(index + 1)
                return result
            }
        }
        return result
    }
    private func findTarget(target: Int,start: Int) -> Int? {
        let length = self.numbers.count
        guard target >= numbers[0] && target <= numbers[length - 1] else {
            return nil
        }
        var left = start
        var right = length - 1
        while left < right {
            let middle = (left + right) / 2
            if numbers[middle] == target {
                return middle
            } else if numbers[middle] > target {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        if left == right {
            if numbers[left] == target {
                return left
            }
        }
        return nil
    }
}