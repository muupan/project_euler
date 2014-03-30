import random

BOARD = ['GO', 'A1', 'CC1', 'A2', 'T1', 'R1', 'B1', 'CH1', 'B2', 'B3',
         'JAIL', 'C1', 'U1', 'C2', 'C3', 'R2', 'D1', 'CC2', 'D2', 'D3',
         'FP', 'E1', 'CH2', 'E2', 'E3', 'R3', 'F1', 'F2', 'U2', 'F3',
         'G2J', 'G1', 'G2', 'CC3', 'G3', 'R4', 'CH3', 'H1', 'T2', 'H2']
assert len(BOARD) == 40

class Monopoly(object):
    def __init__(self):
        self.goto('GO')
        self.consecutive_double_count = 0

    def roll(self, die):
        die1 = die()
        die2 = die()
        # print "dice:", die1, die2
        if die1 == die2:
            if self.consecutive_double_count == 2:
                # print "go to JAIL by 3 consecutive doubles"
                self.goto('JAIL')
                self.consecutive_double_count = 0
                return BOARD[self.pos]
            else:
                self.consecutive_double_count += 1
        else:
            self.consecutive_double_count = 0
        self.advance(die1 + die2)
        return BOARD[self.pos]

    def advance(self, steps):
        # print "advance by ", steps, " steps from ", BOARD[self.pos]
        self.pos += steps
        while self.pos > 39:
            self.pos -= 40
        # print "advanced to ", BOARD[self.pos]
        if BOARD[self.pos] == 'G2J':
            # print "go to JAIL"
            self.goto('JAIL')
        elif BOARD[self.pos].startswith('CC'):
            self.draw_cc()
        elif BOARD[self.pos].startswith('CH'):
            self.draw_ch()

    def draw_cc(self):
        r = random.randint(1, 16)
        # print "draw CC:", r
        if r == 1:
            self.goto('GO')
        elif r == 2:
            self.goto('JAIL')

    def goto(self, square):
        self.pos = BOARD.index(square)

    def goto_next(self, square_type):
        self.pos += 1
        while not BOARD[self.pos].startswith(square_type):
            self.pos += 1
            while self.pos > 39:
                self.pos -= 40

    def draw_ch(self):
        r = random.randint(1, 16)
        # print "draw CH:", r
        if r == 1:
            self.goto('GO')
        elif r == 2:
            self.goto('JAIL')
        elif r == 3:
            self.goto('C1')
        elif r == 4:
            self.goto('E3')
        elif r == 5:
            self.goto('H2')
        elif r == 6:
            self.goto('R1')
        elif r == 7:
            self.goto_next('R')
        elif r == 8:
            self.goto_next('R')
        elif r == 9:
            self.goto_next('U')
        elif r == 10:
            self.pos -= 3
            if self.pos < 0:
                self.pos += 40

monopoly = Monopoly()
six_sided_die = lambda: random.randint(1, 6)
four_sided_die = lambda: random.randint(1, 4)

stat = {}
for square in BOARD:
    stat[square] = 0
for i in xrange(1000000):
     # square = monopoly.roll(six_sided_die)
     square = monopoly.roll(four_sided_die)
     stat[square] += 1

print sorted([(k, BOARD.index(k), v) for k, v in stat.iteritems()], key=lambda x: x[2])
