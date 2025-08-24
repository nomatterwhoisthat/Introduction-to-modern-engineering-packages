import numpy as np
def bridgy(y1, y2):
    # Сетка значений x для вычисления расстояния между функциями
    x_values = np.linspace(0, 100, 1000)
    
    # Вычисление расстояния между функциями для каждого значения x
    bridge_heights = y2(x_values) - y1(x_values)
    
    # Найти x, где расстояние между функциями минимально
    best_x_index = np.argmin(bridge_heights)
    best_x = x_values[best_x_index]
    
    # Вернуть x-координаты точек на берегах реки
    return (best_x, y1(best_x)), (best_x, y2(best_x))

# Пример: задаем на вход две функции
def y1(x):
    return  2 * x

def y2(x):
    return 2 ** x

point1, point2 = bridgy(y1, y2)
print("Координаты точки на первом берегу:", point1)
print("Координаты точки на втором берегу:", point2)
