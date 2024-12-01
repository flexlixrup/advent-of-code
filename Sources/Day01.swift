import Algorithms

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String
  var list1: [Int] = []
  var list2: [Int] = []
  init(data: String) {
    self.data = data
    let pairs: [Substring] = data.split(separator: "\n")
    for pair in pairs {
      let num1 = Int(pair.split(separator: "   ")[0])!
      let num2 = Int(pair.split(separator: "   ")[1])!
      list1.append(num1)
      list2.append(num2)
    }
    list1.sort(by: <)
    list2.sort(by: <)
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    var distances: [Int] = []
    for (idx, list1Entry) in list1.enumerated() {
      let list2Entry = list2[idx]
      distances.append(
        max(list1Entry, list2Entry) - min(list1Entry, list2Entry)
      )
    }
    return distances.reduce(0, +)
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    var similarityScore = 0
    for entry in list1 {
      let countInList2 = list2.filter {
        $0 == entry
      }.count
      similarityScore += entry * countInList2
    }
    
    return similarityScore
  }
}
