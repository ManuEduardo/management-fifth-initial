from pydantic import BaseModel

class ItemBase(BaseModel):
    id: int
    name: str


class Player(ItemBase):
    age: int
    avegare_points: float
    tshirt_number: int

    class Config:
        orm_mode = True


class Position(ItemBase):
    description: str
    players: list[Player] = []

    class Config:
        orm_mode = True


class Team(ItemBase):
    description: str
    players: list[Player] = []

    class Config:
        orm_mode = True 