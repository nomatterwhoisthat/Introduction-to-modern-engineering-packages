import numpy as np
import matplotlib.pyplot as plt

def madcoc(x0, y0, z0, a, phi, V):
     
    # Проверка, находится ли начальная точка внутри конуса
    if x0**2 + y0**2 > z0**2 / a**2:
        print("Ошибка: Начальная точка находится вне конуса.")
        return
    # Конвертация угла в радианы
    phi = np.radians(phi)
    
    # Начальные условия
    r0 = np.sqrt(x0**2 + y0**2)
    h0 = z0
    theta0 = np.arctan2(y0, x0)
        
    # Время достижения вершины
    t_max = h0 / (V * np.sin(phi))
    
    # Шаги времени
    t = np.linspace(0, t_max, 1000)
    
    # Радиус и угол для каждого шага
    z = h0 - V * np.sin(phi) * t
    r = z / np.tan(phi)
    theta = theta0 + V * np.cos(phi) * t / r0
    
    # Вычисление координат для траектории
    x = r * np.cos(theta)
    y = r * np.sin(theta)
    
    # Создание 3D графика
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    
    # Параметризация поверхности конуса для визуализации
    theta_cone = np.linspace(0, 2 * np.pi, 100)
    r_cone = np.linspace(0, r0, 100)
    T_cone, R_cone = np.meshgrid(theta_cone, r_cone)
    X_cone = R_cone * np.cos(T_cone)
    Y_cone = R_cone * np.sin(T_cone)
    Z_cone = np.sqrt(a**2 * (X_cone**2 + Y_cone**2))
    
    # Визуализация поверхности конуса
    ax.plot_surface(X_cone, Y_cone, Z_cone, alpha=0.3, color='cyan', edgecolor='none')
    
    # Визуализация траектории таракана
    ax.plot(x, y, z, color='red', label='Trajectory')
    ax.scatter([x0], [y0], [z0], color='blue', label='Start Point (x0, y0, z0)')
    ax.text(x0, y0, z0, f'({x0:.2f}, {y0:.2f}, {z0:.2f})', color='blue')
    ax.scatter([0], [0], [0], color='black', label='Apex')
    
    # Настройка осей и легенды
    ax.set_xlabel('X')
    ax.set_ylabel('Y')
    ax.set_zlabel('Z')
    ax.legend()
    ax.set_title("Trajectory of the Cockroach on the Cone")
    
    plt.show()

# Пример использования функции с заданными значениями
madcoc(1, 0, 1, 1, 45, 1)
