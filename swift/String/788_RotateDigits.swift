class Q788_Solution {
    let rotateEqual : Set<Int> = [0,1,8]
    let rotateNotEqual : Set<Int>  = [2,5,6,9]
    let rotateInvalid :  Set<Int> = [3,4,7]
    func rotatedDigits(_ N: Int) -> Int {
        var count = 0
        for i in 1...N {
            if isGoodNumber(i) {
                count += 1
            }
        }
        return count
    }
    private func isGoodNumber(_ number: Int) -> Bool {
        var temp = number
        var digitSet : Set<Int> = Set<Int>()
        while temp > 0 {
            let digit = temp % 10
            if rotateInvalid.contains(digit) {
                return false
            } else {
                digitSet.insert(digit)
            }
            temp /= 10
        }
        return !digitSet.intersection(rotateNotEqual).isEmpty
    }
}