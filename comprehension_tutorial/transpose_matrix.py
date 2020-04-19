# matrix = [[r * 3 + i for i in range(1, 4)] for r in range(4)]
# print(matrix)

row = []
for i in range(1, 4):
    items = []
    for r in range(4):
        items.append(r * 3 + 1)
    row.append(items)

print(row)