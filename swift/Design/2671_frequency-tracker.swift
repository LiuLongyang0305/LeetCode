//https://leetcode.com/problems/frequency-tracker/
class FrequencyTracker {

    var numToFrequency = [Int:Int]()
    var frencyToNumsCnt = [Int:Int]()
    init() {

    }

    func add(_ number: Int) {

        // print("before add:")
        // print(numToFrequency)
        // print(frencyToNumsCnt)
        if let frequancy = numToFrequency[number] {
            numToFrequency[number] = frequancy + 1
            frencyToNumsCnt[frequancy,default: 0] -= 1
            if let v = frencyToNumsCnt[frequancy ], v == 0 {
                frencyToNumsCnt.removeValue(forKey: frequancy)
            }
            frencyToNumsCnt[frequancy + 1, default: 0] += 1
        } else {
            numToFrequency[number] = 1
            frencyToNumsCnt[1,default: 0] += 1
        }

        // print("num = \(number), after add:")
        // print(numToFrequency)
        // print(frencyToNumsCnt)
    }

    func deleteOne(_ number: Int) {
        // print("before delete:")
        // print(numToFrequency)
        // print(frencyToNumsCnt)
        if let  cnt = numToFrequency[number], cnt >= 1 {
            if cnt == 1 {
                numToFrequency.removeValue(forKey: number)
            } else {
                numToFrequency[number] = cnt - 1
            }
            frencyToNumsCnt[cnt - 1,default:0] += 1
            if let cnt2 = frencyToNumsCnt[cnt],cnt2 >= 1 {
                if cnt2 == 1 {
                    frencyToNumsCnt.removeValue(forKey: cnt)
                } else {
                    frencyToNumsCnt[cnt] = cnt2 - 1
                }
            }
        }
        // print("num = \(number), after delate:")
        // print(numToFrequency)
        // print(frencyToNumsCnt)
    }

    func hasFrequency(_ frequency: Int) -> Bool {
        return nil !=  frencyToNumsCnt[frequency]
    }
}

