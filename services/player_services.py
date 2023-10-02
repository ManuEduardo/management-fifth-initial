from sqlalchemy.orm import Session

import models

def get_player(db: Session, player_id: int):
    return db.query(models.Player).filter(models.Player.id == player_id).first()

def get_players_tshirt(db: Session, player_tshirt: int):
    return db.query(models.Player).filter(models.Player.tshirt_number == player_tshirt)

