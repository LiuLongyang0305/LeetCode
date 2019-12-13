//https://leetcode.com/problems/shopping-offers/
// BFS
class Solution {
    private struct Offer {
        var items: [Int]
        var price: Int
        func nextNeeds(needs: [Int]) -> [Int]? {
            guard needs.count == items.count else {
                return nil
            }
            var ans = needs
            for i in 0..<needs.count {
                if needs[i] < items[i] {
                    return nil
                }
                ans[i] -= items[i]
            }
            return ans
        }
    }
    private struct State:Equatable, Hashable {
        var needs: [Int]
        var totalCost: Int
        var isLastState:  Bool {
            return needs.reduce(0) { $0 + $1} == 0
        }
    }
    func shoppingOffers(_ price: [Int], _ special: [[Int]], _ needs: [Int]) -> Int {
        var offers = special.map {Solution.Offer(items: Array<Int>($0[0..<($0.count - 1)]), price: $0.last!)}
        var toDelete = [Int]()
        for index in 0..<offers.count {
            if offers[index].nextNeeds(needs: needs) == nil {
                toDelete.append(index)
            }
        }
        for index in toDelete.reversed() {
            offers.remove(at: index)
        }
        //        print("\(special.count)  \(offers.count)")
        let itemsCount = price.count
        for i in 0..<itemsCount {
            var items = Array<Int>(repeating: 0, count: itemsCount)
            items[i] = 1
            offers.append(Solution.Offer(items: items, price: price[i]))
        }
        
        var states = [State]()
        let startState = Solution.State(needs: needs, totalCost: 0)
        guard !startState.isLastState else {
            return 0
        }
        var cost  = Int.max
        states.append(startState)
        var visited = Set<State>()
        visited.insert(startState)
        while !states.isEmpty {
            let length = states.count
            for _ in 0..<length {
                let currentState = states.removeFirst()
                if currentState.totalCost < cost {
                    for offer in offers {
                        if let needs = offer.nextNeeds(needs: currentState.needs) {
                            let nextState = Solution.State(needs: needs, totalCost: currentState.totalCost + offer.price)
                            
                            if !visited.contains(nextState) && nextState.totalCost < cost {
                                visited.insert(nextState)
                                if nextState.isLastState {
                                    cost = min(cost, nextState.totalCost)
                                } else {
                                    states.append(nextState)
                                }
                            }
                        }
                    }
                }
            }
        }
        return cost
    }
 }

//DFS
 class Solution {
    private struct Offer {
        var items: [Int]
        var price: Int
        func nextNeeds(needs: [Int]) -> [Int]? {
            guard needs.count == items.count else {
                return nil
            }
            var ans = needs
            for i in 0..<needs.count {
                if needs[i] < items[i] {
                    return nil
                }
                ans[i] -= items[i]
            }
            return ans
        }
    }
    private struct State:Equatable, Hashable {
        var needs: [Int]
        var totalCost: Int
        var isLastState:  Bool {
            return needs.reduce(0) { $0 + $1} == 0
        }
    }
    private var offers = [Offer]()
    private var minCost = Int.max
    private var visited = Set<State>()
    
    func shoppingOffers(_ price: [Int], _ special: [[Int]], _ needs: [Int]) -> Int {
        offers = special.map {Solution.Offer(items: Array<Int>($0[0..<($0.count - 1)]), price: $0.last!)}
        var toDelete = [Int]()
        for index in 0..<offers.count {
            if offers[index].nextNeeds(needs: needs) == nil {
                toDelete.append(index)
            }
        }
        for index in toDelete.reversed() {
            offers.remove(at: index)
        }
        let itemsCount = price.count
        for i in 0..<itemsCount {
            var items = Array<Int>(repeating: 0, count: itemsCount)
            items[i] = 1
            offers.append(Solution.Offer(items: items, price: price[i]))
        }
        let startState = Solution.State(needs: needs, totalCost: 0)
        guard !startState.isLastState else {
            return 0
        }
        offers.sort { (offer1, offer2) -> Bool in
            offer1.price < offer2.price
        }
        var visited = Set<State>()
        visited.insert(startState)
        recursion(current: startState)
        return minCost
    }
    private func recursion(current: State) {
        guard current.totalCost < minCost else {
            return
        }
        for offer in offers {
            if let nextNeeds = offer.nextNeeds(needs: current.needs) {
                let nextState =  State(needs: nextNeeds, totalCost: current.totalCost + offer.price)
                if !visited.contains(nextState) {
                    visited.insert(nextState)
                    guard !nextState.isLastState else {
                        minCost = min(minCost,nextState.totalCost)
                        return
                    }
                    guard nextState.totalCost < minCost else {
                        return
                    }
                    recursion(current: nextState)
                }
            }
        }
    }
 }