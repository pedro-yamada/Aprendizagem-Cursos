from itertools import chain, combinations

def powerset(list_name):
    s = list(list_name)
    return chain.from_iterable(combinations(s, r) for r in range(1,len(s)+1))

combinacoes = []
A = range(0,8)

for x in powerset(A):
    combinacoes.append(x)
print(len(A))
print(len(combinacoes))