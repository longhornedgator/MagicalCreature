// Lakshmi C
/*
 Part 1: Creating Structs
 Define a Creature struct with the following properties:

 name (String)
 description (String)
 isGood (Bool)
 magicPower (Int)
 Create at least three different creature structs that conform to the Creature struct (e.g., Unicorn, Dragon, Phoenix). Initialize instances of each creature struct with different values for their properties.
 */

struct Creature {
    let name: String
    let description: String
    let isGood: Bool
    let magicPower: Int
    
    // Part 2: Computed property using fibonacciAbility
    var ability: String {
        let fibPower = fibonacciAbility(magicPower)
        return "\(name)'s special ability has a Fibonacci power level of \(fibPower)!"
        }
    
    
    // Part 4: Mythical Creature Interactions
    func interactWith(_ other: Creature) -> String {
        switch (self.isGood, other.isGood) {
        case (true, true):
            return "\(self.name) and \(other.name), both good, form a magical alliance!"
        case (true, false):
            return "\(self.name), being good, bravely confronts the evil \(other.name)!"
        case (false, true):
            return "\(self.name), being evil, schemes against the good \(other.name)!"
        case (false, false):
            return "\(self.name) and \(other.name), both evil, plot together for chaos!"
        }
        }
}

let Unicorn = Creature(name: "Unicorn", description: "I am a Unicorn", isGood: false, magicPower: 5)
let Dragon = Creature(name: "Dragon", description: "I am a Dragon", isGood: false, magicPower: 8)
let Phoenix = Creature(name: "Phoenix", description: "I am a Phoenix", isGood: true, magicPower: 3)


/*
 
 Part 2: Fibonacci Creature Abilities
 Write a function called fibonacciAbility that takes in an Int parameter n and returns the nth number in the Fibonacci sequence.

 Add a computed property called ability to the Creature struct that incorporates the fibonacciAbility function and describes the creature’s special ability based on its magicPower.
 
 */


func fibonacciAbility(_ n: Int ) -> Int{
  
        if n<=0{
            return 0
        }
        
        if n==1{
            return 1
        }
    
    var prev = 0
    var current = 1
        
    for _ in 2...n{
        let next = prev + current
        prev = current
        current = next
    }
    return current
}


print(Unicorn.ability)
print(Dragon.ability)
print(Phoenix.ability)

/*
 Part 3: The Mythical Creature
 Create an array called creatureCatalog that holds all the creature instances.
 Write a function called describeCreature that takes the creature array as a parameter and prints out a description of each creature in the creature, including their special abilities from Part 2.
 */


var creatureCatalog: [Creature] = [Unicorn, Dragon, Phoenix]

func describeCreature(_ creatures: [Creature]) {
    for creature in creatures {
        print("Name: \(creature.name)")
        print("Description: \(creature.description)")
        print("Is good: \(creature.isGood)")
        print("Magic power: \(creature.magicPower)")
    }
}

describeCreature(creatureCatalog)


/*
 Part 4: Mythical Creature Interactions
 Add a function called interactWith to the Creature struct that takes another Creature instance as a parameter.
 Inside the interactWith function, use a switch statement to check the isGood property of both creatures and perform a different action based on their alignments (good vs. evil).
 Update the describeCreature function to call the interactWith function for each pair of creatures in the creature, and print out the result of their interaction.
 */

// Part 4: Creature Interactions

Unicorn.interactWith(Dragon)

Dragon.interactWith(Phoenix)

// Part 3 & 4: Updated describeCreature function
func describeCreatureUpdated(_ creatures: [Creature]) {
    print("Mythical Creature Catalog:")
    print("------------------------")
    for creature in creatures {
        print("Name: \(creature.name)")
        print("Description: \(creature.description)")
        print("Is good: \(creature.isGood)")
        print("Magic power: \(creature.magicPower)")
    }
    
    // Part 4: Creature Interactions
    print("Creature Interactions:")
    print("------------------------")
    for i in 0..<creatures.count {
        for j in 0..<creatures.count {
            if i != j { // Avoid self-interaction
                let creature1 = creatures[i]
                let creature2 = creatures[j]
                print(creature1.interactWith(creature2))
            }
        }
    }
    print("------------------------")
}

describeCreatureUpdated(creatureCatalog)
