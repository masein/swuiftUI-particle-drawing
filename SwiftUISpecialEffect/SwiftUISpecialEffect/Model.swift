//
//  Model.swift
//  SwiftUISpecialEffect
//
//  Created by Arsh on 11/15/22.
//
import SwiftUI

struct Particle: Hashable {
    let x: Double
    let y: Double
    let creationDate = Date.now.timeIntervalSinceReferenceDate
    let hue: Double
}

class ParticleSystem {
    let image = Image(systemName: "circle")
    var particles = Set<Particle>()
    var center = UnitPoint.center
    var hue = 0.0
    func update(date: TimeInterval) {
        let deathDate = date - 1

        for particle in particles {
            if particle.creationDate < deathDate {
                particles.remove(particle)
            }
        }
        let newParticle = Particle(x: center.x, y: center.y, hue: hue)
        particles.insert(newParticle)
        hue += 0.01
        if hue > 1 { hue -= 1 }
    }
}
