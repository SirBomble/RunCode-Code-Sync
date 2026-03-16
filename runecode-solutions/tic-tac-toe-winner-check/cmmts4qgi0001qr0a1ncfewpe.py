board = [input().split() for _ in range(3)]

lines = []

# Rows
lines.extend(board)

# Columns
for c in range(3):
    lines.append([board[0][c], board[1][c], board[2][c]])

# Diagonals
lines.append([board[0][0], board[1][1], board[2][2]])
lines.append([board[0][2], board[1][1], board[2][0]])

winner = "None"

for line in lines:
    if line == ["X", "X", "X"]:
        winner = "X"
        break
    if line == ["O", "O", "O"]:
        winner = "O"
        break

print(winner)