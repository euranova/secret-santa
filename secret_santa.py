"""
Secret Santa Generators that tell every participant
in a group for whom to buy a gift.
"""
import random
import sys

def santa(l):
    shuffled = random.sample(l, len(l))
    rotated = shuffled[1:] + shuffled[:1]
    return zip(shuffled, rotated)

if __name__ == '__main__':
    path = './people.txt'
    people = open(path, 'r').read().split('\n')
    people = list(filter(None, people))

    if len(people) < 2:
        print('You need to enter at least two names!')
        sys.exit()

    for _from, to in santa(people):
        print(f'{_from} -> {to}')
