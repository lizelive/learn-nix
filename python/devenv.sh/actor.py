#!/usr/bin/env python3

from dataclasses import dataclass
from functools import singledispatch
@dataclass
class Damage:
    slashing: float = 0
    piercing: float = 0
    bludgeoning: float = 0
    poison: float = 0
    acid: float = 0
    fire: float = 0
    cold: float = 0
    radiant: float = 0
    necrotic: float = 0
    lightning: float = 0
    thunder: float = 0
    force: float = 0
    psychic: float = 0
    healing: float = 0
    curse: float = 0

    @singledispatch
    def __mul__(self, other):
        raise NotImplementedError

    @__mul__.register
    def mul_scaler(self, other: float):
        """Scalar multiplication of a damage vector"""
        return Damage(
            slashing=self.slashing * other,
            piercing=self.piercing * other,
            bludgeoning=self.bludgeoning * other,
            poison=self.poison * other,
            acid=self.acid * other,
            fire=self.fire * other,
            cold=self.cold * other,
            radiant=self.radiant * other,
            necrotic=self.necrotic * other,
            lightning=self.lightning * other,
            thunder=self.thunder * other,
            force=self.force * other,
            psychic=self.psychic * other,
            healing=self.healing * other,
            curse=self.curse * other,
        )

    @__mul__.register
    def mul_hadamard(self, other: Self):
        """Hadamard product of two damage vectors"""
        return Damage(
            slashing=self.slashing * other.slashing,
            piercing=self.piercing * other.piercing,
            bludgeoning=self.bludgeoning * other.bludgeoning,
            poison=self.poison * other.poison,
            acid=self.acid * other.acid,
            fire=self.fire * other.fire,
            cold=self.cold * other.cold,
            radiant=self.radiant * other.radiant,
            necrotic=self.necrotic * other.necrotic,
            lightning=self.lightning * other.lightning,
            thunder=self.thunder * other.thunder,
            force=self.force * other.force,
            psychic=self.psychic * other.psychic,
            healing=self.healing * other.healing,
            curse=self.curse * other.curse,
        )
    
    def dot(self, other: Damage):
        """Dot product of two damage vectors"""
        return (
            self.slashing * other.slashing
            + self.piercing * other.piercing
            + self.bludgeoning * other.bludgeoning
            + self.poison * other.poison
            + self.acid * other.acid
            + self.fire * other.fire
            + self.cold * other.cold
            + self.radiant * other.radiant
            + self.necrotic * other.necrotic
            + self.lightning * other.lightning
            + self.thunder * other.thunder
            + self.force * other.force
            + self.psychic * other.psychic
            + self.healing * other.healing
            + self.curse * other.curse
        )

def test_damage_dot():
    d1 = Damage(slashing=1, piercing=2, bludgeoning=3)
    d2 = Damage(slashing=4, piercing=5, bludgeoning=6)
    assert d1.dot(d2) == 32

def test_damge_mul():
    d1 = Damage(slashing=1, piercing=2, bludgeoning=3)
    d2 = Damage(slashing=4, piercing=5, bludgeoning=6)
    assert d1 * d2 == Damage(slashing=4, piercing=10, bludgeoning=18)
    assert d1 * 2 == Damage(slashing=2, piercing=4, bludgeoning=6)
    assert 2 * d1 == Damage(slashing=2, piercing=4, bludgeoning=6)

@dataclass
class Update:
    damage_brain: float = 0


@dataclass
class Player:
    name: str
    age: int
    race: str

    brain_health: float = 1
    oxygen: float = 1


def tests():
    test_damage_dot()
    test_damge_mul()

if __name__ == "__main__":
    tests()