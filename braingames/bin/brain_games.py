from braingames.src.cli import welcome_user
from braingames.src.engine import run_game
from braingames.src.games.lcm import generate_lcm_question
from braingames.src.games.progression import generate_geometric_progression


def main():
    name = welcome_user()

    print("Let's play LCM game!")
    run_game(generate_lcm_question, name)

    print("\nNow let's play Progression game!")
    run_game(generate_geometric_progression, name)


if __name__ == '__main__':
    main()
