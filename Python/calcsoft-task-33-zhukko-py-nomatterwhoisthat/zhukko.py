import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

def zhukko(L, v):
    # Функция для вычисления производных (скоростей)
    def system(t, z):
        x1, y1, x2, y2, x3, y3, x4, y4 = z
        
        dx1dt = v * (x2 - x1) / np.hypot(x2 - x1, y2 - y1)
        dy1dt = v * (y2 - y1) / np.hypot(x2 - x1, y2 - y1)
        
        dx2dt = v * (x3 - x2) / np.hypot(x3 - x2, y3 - y2)
        dy2dt = v * (y3 - y2) / np.hypot(x3 - x2, y3 - y2)
        
        dx3dt = v * (x4 - x3) / np.hypot(x4 - x3, y4 - y3)
        dy3dt = v * (y4 - y3) / np.hypot(x4 - x3, y4 - y3)
        
        dx4dt = v * (x1 - x4) / np.hypot(x1 - x4, y1 - y4)
        dy4dt = v * (y1 - y4) / np.hypot(x1 - x4, y1 - y4)
        
        return [dx1dt, dy1dt, dx2dt, dy2dt, dx3dt, dy3dt, dx4dt, dy4dt]
    
    # Начальные условия
    initial_conditions = [0, 0, L, 0, L, L, 0, L]
    t_span = (0, L / v)  # Примерный временной промежуток для схождения к центру
    t_eval = np.linspace(*t_span, 1000)  # Временные точки для оценки
    
    # Решение системы ОДУ
    solution = solve_ivp(system, t_span, initial_conditions, t_eval=t_eval, method='RK45')
    
    x1, y1, x2, y2, x3, y3, x4, y4 = solution.y
    
    # Построение траекторий
    plt.plot(x1, y1, label='Таракан 1')
    plt.plot(x2, y2, label='Таракан 2')
    plt.plot(x3, y3, label='Таракан 3')
    plt.plot(x4, y4, label='Таракан 4')
    
    plt.scatter([0, L, L, 0], [0, 0, L, L], color='black')
    plt.scatter([L/2], [L/2], color='red', zorder=5)  # Центр квадрата
    plt.xlim(-0.1 * L, 1.1 * L)
    plt.ylim(-0.1 * L, 1.1 * L)
    plt.gca().set_aspect('equal', adjustable='box')
    plt.legend()
    plt.title('Траектории движения тараканов')
    plt.xlabel('x')
    plt.ylabel('y')
    plt.grid()
    plt.show()

# Пример использования
#L = 10  # длина стороны комнаты
#v = 1   # скорость движения тараканов
#zhukko(L, v)

#Если скорость каждого таракана изменяется пропорционально пройденному пути, 
# то это приведет к изменению закона движения каждого таракана.
# В частности, скорость будет зависеть от расстояния, пройденного каждым тараканом от его начальной позиции. 
# Это приведет к тому, что тараканы будут двигаться быстрее, когда они ближе к своим соседям, и медленнее, 
# когда они находятся дальше от них.

