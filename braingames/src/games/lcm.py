import math
import random


def lcm(a, b, c):
    return abs(a * b * c) // math.gcd(a, b, c)


def generate_lcm_question():
    num1 = random.randint(1, 100)
    num2 = random.randint(1, 100)
    num3 = random.randint(1, 100)
    question = f"{num1} {num2} {num3}"
    correct_answer = str(lcm(num1, num2, num3))
    return question, correct_answer
