from re import X
import numpy as np

def stepFunction(soma):
    if soma >= 1:
        return 1
    else:
        return 0

def sigmoidFunction(soma):
    return 1 / ( 1 + np.exp(-soma) )

def tanhFunction(soma):
    return (np.exp(soma) - np.exp(-soma))/ (np.exp(soma) + np.exp(-soma))

def relu(soma):
    if soma >= 0:
        return soma
    else:
        return 0

def linear(soma):
    return soma

def softmax(X):
    ex = np.exp(X)
    return ex / ex.sum()

valor = 2.1
valores = [5, 2, 1.3]
print(
    'Valor: {}\n\nFunção step: {}\nFunção sigmoide: {}\nFunção Tangente Hiperbólica: {}\
        \nFunção Relu: {}\nFunção Linear: {}\nValores: {} -> Softmax: {}'.format(
        valor,
        stepFunction(valor),
        sigmoidFunction(valor),
        tanhFunction(valor),
        relu(valor),
        linear(valor),
        valores,
        softmax(valores)
))