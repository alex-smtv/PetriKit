import PetriKit
import Foundation // used for Graphviz

// Create a P/T-net pn composed of two places and two transitions
let p0 = PTPlace(named: "p0")
let p1 = PTPlace(named: "p1")

let t0 = PTTransition(
    named         : "t0",
    preconditions : [PTArc(place: p0)],
    postconditions: [PTArc(place: p1)])
let t1 = PTTransition(
    named         : "t1",
    preconditions : [PTArc(place: p1)],
    postconditions: [PTArc(place: p0)])

let pn = PTNet(places: [p0, p1], transitions: [t0, t1])

// Simulate the firing of a transition
let m = t0.fire(from: [p0: 1, p1: 1])
print("Result of t0 fire: \(m!)")

// Save to Graphviz file a random marking
try pn.saveAsDot(to: URL(fileURLWithPath: "pn.dot"), withMarking: [p0: 1, p1: 2])