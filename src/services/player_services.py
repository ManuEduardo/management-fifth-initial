from sqlalchemy.orm import Session

from src import models, schemas


def get_player(db: Session, player_id: int):
    return db.query(models.Player).filter(models.Player.id == player_id).first()


def post_player(db: Session, new_player: schemas.NewPlayer):
    db_player = models.Player(name=new_player.name,
                              position_id=new_player.position,
                              team_id=new_player.team,
                              age=new_player.age,
                              avegare_points=new_player.avegare_points,
                              tshirt_number=new_player.tshirt_number)
    db.add(db_player)   
    db.commit()
    db.refresh(db_player)
    return db_player

def get_players_tshirt(db: Session, player_tshirt: int):
    return db.query(models.Player).filter(models.Player.tshirt_number == player_tshirt).all()

# Mod
def get_players_position(db: Session, player_position: int):
    return db.query(models.Player).filter(models.Player.position_id == player_position).all()

# Mod 2
def get_player_data(player: models.Player) -> dict:
    return {
        "id": player.id,
        "name": player.name,
        "age": player.age,
        "avegare_points": player.avegare_points,
        "tshirt_number": player.tshirt_number,
        "position": {
            "id": player.position.id,
            "name": player.position.name,
            "description": player.position.description,
        },
        "team": {
            "id": player.team.id,
            "name": player.team.name,
            "description": player.team.description,
        }
    }

def del_player(db: Session, player_id: int):
    player = db.query(models.Player).filter(models.Player.id == player_id).first()
    
    player_data = get_player_data(player)

    db.delete(player)
    db.commit()
    return schemas.Player(**player_data)  # Crear una instancia de schemas.Player y devolverla

# Mod 3
def update_player(db: Session, updated_player: schemas.Player):

    db_player = get_player(db, updated_player.id)

    if db_player is None:
        return None

    db_player.name = updated_player.name
    db_player.age = updated_player.age
    db_player.avegare_points = updated_player.avegare_points
    db_player.tshirt_number = updated_player.tshirt_number
    db_player.position_id = updated_player.position.id
    db_player.team_id = updated_player.team.id

    db.commit()
    db.refresh(db_player)

    return db_player