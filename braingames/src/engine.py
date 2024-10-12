MAX_ROUNDS = 3


def run_game(game, name):
    print(f"Hello, {name}!")
    for _ in range(MAX_ROUNDS):
        question, correct_answer = game()
        print(f"Question: {question}")
        answer = input("Your answer: ")

        if answer == correct_answer:
            print("Correct!")
        else:
            print(f"'{answer}' is wrong answer ;(. "
                  f"Correct answer was '{correct_answer}'.")
            print(f"Let's try again, {name}!")
            return

    print(f"Congratulations, {name}!")
