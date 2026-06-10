// -----------------
// Cover
// -----------------
#set page(
  margin: (top: 22mm, bottom: 22mm, left: 18mm, right: 18mm),
  columns: 1,
  background: none,
  numbering: none,
)

#place(center, dy: 80mm)[
  #set text(size: 22pt, weight: "bold")
  #align(center)[Signals and Systems Notes]
]

#place(bottom + center, dy: -10mm)[
  #set text(size: 12pt, weight: "regular")
  #align(center)[基于米兰理工大学（Politecnico di Milano）\ 2026 Spring《Signals and Systems》课程]

  #v(0.8em)
  #set text(size: 11pt)
  #align(center)[作者：#link("https://github.com/worldedge1933/signals-and-systems-notes")[\@worldedge1933]]

  #v(0.6em)
  #align(center)[2026-06-10]
]


#pagebreak()

// -----------------
// Table of contents
// -----------------
#set page(
  margin: (top: 22mm, bottom: 22mm, left: 18mm, right: 18mm),
  columns: 1,
  background: none,
  numbering: none,
)

#set text(size: 18pt, weight: "bold")
#align(center)[目录]

#v(1.2em)
#set text(size: 11pt, weight: "regular")
#show outline.entry.where(level: 1): set block(above: 2em, below: 1.2em)
#outline(depth: 2)

#pagebreak()

// -----------------
// Main document
// -----------------
#set page(
  margin: (top: 18mm, bottom: 18mm, left: 10mm, right: 10mm),
  columns: 2,
)

#set page(background: context {
  // 正文区域宽度（不含左右页边距）
  let textw = page.width - page.margin.left - page.margin.right
  // gutter 的中线刚好在正文区域的 50% 处（两栏对称时）
  let x = page.margin.left + 0.5 * textw

  // 竖线从正文顶部到正文底部（不含上下页边距）
  let y = page.margin.top
  let h = page.height - page.margin.top - page.margin.bottom

  place(
    top + left,
    dx: x,
    dy: y,
    line(length: h, angle: 90deg, stroke: 0.5pt),
  )
})
#counter(page).update(1)
#set page(
  numbering: "1",
  number-align: center + bottom,
)


#set text(size: 10.5pt)
#set par(justify: true, leading: 0.65em)

#show heading.where(level: 1): set block(below: 2em, above: 2em)
#show heading.where(level: 2): set block(below: 1.5em, above: 2em)
#show heading.where(level: 3): set block(below: 1.3em)

#show heading.where(level: 1): set text(fill: red)
#show heading.where(level: 2): set text(fill: blue, font: "Microsoft YaHei")
#show heading.where(level: 3): set text(weight: "regular")

#show heading.where(level: 1): it => [
  #colbreak(weak: true)
  #it
]

#let note(body) = [
  #text(fill: gray)[注：#body]
]


= Chapter 1: Introduction to Signals

本章内容不做系统整理，只做部分提醒

== 1.1 High-order impulses

$
  integral_(- infinity)^(infinity) delta^((k)) (t) f(t) dif t = (-1)^k f^((k))(0), forall k > 0
$

使用分部积分推导以证明上式

$
  integral_(- infinity)^(infinity) delta^' (t) f(t) dif t = delta(t) f(t) |_(- infinity)^(infinity) - integral_(- infinity)^(infinity) delta(t) f^' (t) dif t = - f^' (0)
$

== 1.2 Caveats on $delta(t)$

$delta(t)$ 只有部分运算是有意义的

$[delta(t)]^2$, $delta(t^2)$ 都是无意义的

= Chapter 2: Introduction to Systems

本章内容不做系统整理，只做部分提醒

= Chapter 3: Time domain analysis of continuous-time systems

== 3.1 System described by differential equations

线性时不变（linear time-invariant, LTI）系统往往可以写成线性（linear）常微分方程（ordinary differential equation, ODE）形式

$
    & d^n y(t) / d t^n + a_(n-1) d^(n-1) y(t) / d t^(n-1) + dots + a_1 d y(t) / d t + a_0 y(t) \
  = & b_m d^m x(t) / d t^m + dots + b_1 d x(t) / d t + b_0 x(t)
$

#note[有限维系统才可以，延迟系统是无限维的。]

或使用算子 $D$，写成多项式

$
    & (D^n + a_(n-1) D^(n-1) + dots + a_1 D + a_0) y(t) \
  = & (b_m D^m + b_(m-1) D^(m-1) + dots + b_1 D + b_0) x(t)
$

$
  Q(D) y(t) = P(D) x(t)
$

== 3.2 线性（linear）常微分方程（ordinary differential equation, ODE）的解

解通常由两部分组成，从数学角度有：

$
  y(t) = y_h (t) + y_p (t)
$

$y_h (t)$ 是齐次解，$y_p (t)$ 是特解。

从系统角度有：

$
  y(t) = y_"ZIR" (t) + y_"ZSR" (t)
$

$y_"ZIR" (t)$ 是 zero-input response。

$y_"ZSR" (t)$ 是 zero-state response，两种视角本质是相同的。

== 3.3 Zero-Input Response

为求解齐次方程，令 $x(t) = 0$，得齐次方程

$
  (D^n + a_(n-1) D^(n-1) + dots + a_1 D + a_0) y_"ZIR" (t) = 0
$

令 $y(t) = C e^(lambda t)$，代入上式化简得特征方程（characteristic equation）

$
  lambda^n + a_(n-1) lambda^(n-1) + dots + a_1 lambda + a_0 = 0
$

上式等价于多项式 $Q(lambda) = 0$

由基本的代数定理，我们知道有

$
  Q(lambda) = (lambda - lambda_1)(lambda - lambda_2) dots (lambda - lambda_n)
$

于是有

$
  y_"ZIR" (t) = sum_(k=1)^n C_k e^(lambda_k t)
$

仍需要来自条件的 $n$ 个等式求解 $C_n$

$Q(lambda)$：特征方程（characteristic equation）

$lambda_k$：特征根（characteristic root），自然频率（natural frequency）

$e^(lambda_k t)$：特征模态（characteristic mode）、自然模态（natural mode），决定系统的表现

== 3.4 特征根（characteristic root）重根

如果某个根是 $r$ 重根，例如

$
  (D - lambda)^r y_"ZIR" (t) = 0
$

有
$
  y_"ZIR" (t) = (C_1 + C_2 t + dots + C_r t^(r-1)) e^(lambda t)
$

对于 $[(D - lambda)^r (D - lambda_(r+1)) dots (D - lambda_n)] y_"ZIR" (t) = 0$

有

$
    & y_"ZIR" (t) \
  = & (C_1 + C_2 t + dots + C_r t^(r-1)) e^(lambda t) + C_(r+1) e^(lambda_(r+1) t) + dots + C_n e^(lambda_n t)
$

== 3.5 复特征根（characteristic root）

对于实系统，复数根必定以共轭的方式成对出现

== 3.6 Zero-State Response

ZSR 可看做 $x(t)$ 与系统冲激响应函数（impulse response）的卷积（convolution）。

== 3.7 求解系统函数（system function） $h(t)$

一般系统方程有

$
  Q(D) y(t) = P(D) x(t), quad n >= m
$

$n$ 是 $y$ 的阶，$m$ 是 $x$ 的阶，$n$ 同时也是系统的阶

若 $m > n$，系统非因果（noncausal）

系统函数（system function）有

$
  h(t) = [P(D) y_h (t)] u(t)
$

$u(t)$ 是单位阶梯函数（unit step function）

$y_h (t)$ 是特征模态（characteristic mode）的线性（linear）组合

$
  y_h (t) = sum_(k=1)^n A_k e^(lambda_k t)
$

此处 $y_h (t)$ 的系数 $A_k$ 由以下条件决定

$
  y_h^(n-1)(0) = 1, quad y_h (0) = y_h^' (0) = y_h^'' (0) = dots = y_h^(n-2) (0) = 0
$

== 3.8 卷积（convolution）的性质（部分）

1. if, $x(t) = x_1(t) * x_2(t)$

  then $x_1(t - T_1) * x_2(t - T_2) = x(t - T_1 - T_2)$

2. $x(t) * delta(t) = x(t)$

== 3.9 LTIC 系统的总响应

$
  "total response" = sum_(k=1)^n C_k e^(lambda_k t) + x(t) * h(t)
$

#note[有重根时零输入（input）响应形式还要改变]

== 3.10 LTIC 对正弦的响应

$
  x(t) = A cos(2 pi f t + theta)
$

$
  y(t) = |H(f)| dot A cos(2 pi f t + theta + angle H(f))
$

其中

$
  cases(
    H_c(f) = integral_(-infinity)^infinity h(tau) cos(2 pi f tau) dif tau,
    H_s(f) = integral_(-infinity)^infinity h(tau) sin(2 pi f tau) dif tau,
  )
$

$
  cases(
    |H(f)| = sqrt(H_c^2 + H_s^2),
    angle H(f) = arctan(- H_s / H_c)
  )
$

== 3.11 LTIC 对复指的响应

$
  x(t) = e^(s t)
$

$
  y(t) = e^(s t) H(s)
$

== 3.12 求 $H(s)$

对一个 LTIC 系统，其 LCCODE 有：

$
    & (D^n + a_(n-1) D^(n-1) + dots + a_1 D + a_0) y(t) \
  = & (b_m D^m + b_(m-1) D^(m-1) + dots + b_1 D + b_0) x(t)
$

不妨令输入（input）为 $x(t) = e^(s t)$，代入 3.11 中的结果，得到

$
    & (s^n + a_(n-1) s^(n-1) + dots + a_1 s + a_0) H(s) e^(s t) \
  = & (b_m s^m + b_(m-1) s^(m-1) + dots + b_1 s + b_0) e^(s t)
$

$
  H(s) = (b_m s^m + b_(m-1) s^(m-1) + dots + b_1 s + b_0) / (s^n + a_(n-1) s^(n-1) + dots + a_1 s + a_0)
$

= Chapter 4: Signal space representation by Fourier Series

== 4.1 信号空间

1. 信号的内积投影公式（本节积分均为定积分）

我们假设有一函数 $x(t)$，用它缩放 $c x(t)$ 去逼近我们的信号 $f(t)$：

$
  f(t) approx c x(t)
$

定义误差：

$
  e(t) = f(t) - c x(t)
$

对误差采用能量判据

$
  E_e = integral e^2(t) dif t = integral [f(t) - c x(t)]^2 dif t
$

特其对 $c$ 求导

$
  d E_e / d c = - 2 integral f(t) x(t) dif t + 2 c integral x^2(t) dif t
$

令其 $= 0$，有

$
  c = (integral f(t) x(t) dif t) / (integral x^2(t) dif t) = 1 / E_x integral f(t) x(t) dif t
$

于是 $c x(t)$ 就是 $f(t)$ 在 $x(t)$ 方向上的投影

2. 推广到复数函数

对复数有：

$
  |a + b|^2 = (a + b)(a^* + b^*) = |a|^2 + |b|^2 + a^* b + a b^*
$

于是有：

$
  E_e = & integral |f(t)|^2 dif t + c^2 integral |x(t)|^2 dif t \
        & - c^* integral f^*(t) x(t) dif t - c integral f(t) x^*(t) dif t \
      = & integral |f(t)|^2 dif t - abs(1 / sqrt(E_x) integral f(t) x^*(t) dif t)^2 \
        & + c^2 E_x^2 + abs(1 / sqrt(E_x) integral f(t) x^*(t) dif t)^2 \
        & - c^* integral f^*(t) x(t) dif t - c integral f(t) x^*(t) dif t \
      = & integral |f(t)|^2 dif t - abs(1 / sqrt(E_x) integral f(t) x^*(t) dif t)^2 \
        & + abs(c sqrt(E_x) - 1 / sqrt(E_x) integral f(t) x^*(t) dif t)^2
$

#note[$c$ 并不保证为实数]

于是：

$
  c = 1 / E_x integral f(t) x^*(t) dif t
$

== 4.2 正交（orthogonal）性

如果有 $integral x(t) y^*(t) = 0$，则称这两个信号是正交（orthogonal）的。

并有：

$
  z(t) = x(t) + y(t) ==> E_z = E_x + E_y
$

== 4.3 相关性（相似程度）

correlation 定义为

$
  C_n = 1 / sqrt(E_f E_x) integral_(-infinity)^infinity f(t) x^*(t) dif t
$

注意，信号的 correlation 是有方向的，也即 $f(t)$ 和 $x(t)$ 交换后结果不同

== 4.4 互相关

互相关是对其中一个信号做时移，检验此后的两个信号的相关性

$
  psi_"fg" (t) eq.delta integral_(-infinity)^infinity f(tau) g^*(tau - t) dif tau
$

如果 $g$ 也是 $f$，则是自相关

互相关还能写作以下形式

$
  psi_"fg" (t) eq.delta f(t) * g^*(-t)
$

== 4.5 正交基（orthogonal basis）变换与广义傅里叶级数（generalized Fourier series）

假设我们有 $N$ 个两两正交（orthogonal）的信号 $x_n (t)$，用它们去近似 $f(t)$

$
  f(t) approx c_1 x_1(t) + dots + c_N x_N(t) = sum_(n=1)^N c_n x_n(t)
$

误差为：

$
  e(t) = f(t) - sum_(n=1)^N c_n x_n(t)
$

为了最小化 $E_e$，不难得到

$
  c_n = 1 / E_n integral_(-infinity)^infinity f(t) x_n (t) dif t
$

由正交（orthogonal）性有

$
  E_e = E_f - sum_(n=1)^N c_n^2 E_n
$

如果当 $N -> infinity$ 时，$E_e -> 0$，也即

$
  f(t) = sum_(n=1)^infinity c_n x_n(t)
$

则称 ${x_n (t)}$ 是一组完备基

且这种方式被称为广义傅里叶级数（generalized Fourier series）

这里的相等是 $L_2$ 范式上的相同，可以接受有限个点上不同

此外还有帕塞瓦尔定理：

$
  integral_(t_1)^(t_2) f^2(t) dif t = sum_(n=1)^infinity c_n^2 E_n
$

$
  E_n = integral_(t_1)^(t_2) x_n^2(t) dif t
$

== 4.6 三角 Fourier 级数

已知以下一组正交基（orthogonal basis）

$
  { & 1, cos omega_0 t, cos 2 omega_0 t, dots, cos n omega_0 t, dots; \
    & sin omega_0 t, sin 2 omega_0 t, dots, sin n omega_0 t, dots}, quad n = 1, 2, dots
$

于是有

$
  f(t) = & a_0 + sum_(n=1)^infinity a_n cos(n omega_0 t) + sum_(n=1)^infinity b_n sin(n omega_0 t) \
       = & a_0 + sum_(n=1)^infinity sqrt(a_n^2 + b_n^2) cos(n omega_0 t + tan^(-1)(- b_n / a_n))
$

注意，这组基只能表示对应周期的周期函数，因为其正交（orthogonal）性只在完整周期上成立，无法扩展到 $(-infinity, +infinity)$，相对地，$e^(j omega t)$ 的正交（orthogonal）性是可以推广到 $(-infinity, +infinity)$ 的

有限区间也可用，因为可以周期延拓成周期函数

== 4.7 Fourier series

正交基（orthogonal basis）：${e^(j n omega_0 t)}$，$n = 0, plus.minus 1, plus.minus 2, dots$

$
  f(t) = sum_(n=-infinity)^infinity D_n e^(j n omega_0 t)
$

$
  D_n = & 1 / T_0 integral_(T_0) f(t) (e^(j n omega_0 t))^* dif t \
      = & 1 / T_0 integral_(T_0) f(t) e^(- j n omega_0 t) dif t
$

负频率不是新的物理频率，而是复指数表示中旋转方向的不同

== 4.8 帕塞瓦尔定理

1. 三角

$
  f(t) = C_0 + sum_(n=0)^infinity C_n cos(n omega_0 t + theta_n)
$

$
  P_f = C_0^2 + 1 / 2 sum_(n=1)^infinity C_n^2
$

2. 指数

$
  f(t) = sum_(n=-infinity)^infinity D_n e^(j n omega_0 t)
$

$
  P_f = sum_(n=-infinity)^infinity |D_n|^2
$

注意这里是功率而非能量

== 4.9 LTIC 系统对复指数响应

$
  s = j n omega_0, x(t) = e^(s t)
$

$
  y(t) = h(t) * e^(s t) = e^(s t) integral_(-infinity)^infinity h(tau) e^(- s tau) dif tau = H(s) e^(s t)
$

由傅里叶理论，一般函数均可映射为复指数信号的和

$
  x(t) = sum_(n=-infinity)^infinity D_n e^(j n omega_0 t)
$

$
  y(t) = h(t) * x(t) = sum_(n=-infinity)^infinity D_n H(j n omega_0) e^(j n omega_0 t)
$

== 4.10 Fourier series 的存在性

Dirichlet 条件

弱：绝对可积。保证存在，但不保证正逆变换（inverse transform）后一致

强：极值和不连续点的个数有限

= Chapter 5: Fourier transform

== 5.1 The Fourier transform

$
  F(omega) = integral_(-infinity)^infinity f(t) e^(- j omega t) dif t
$

$
  f(t) = 1 / (2 pi) integral_(-infinity)^infinity F(omega) e^(j omega t) dif omega
$

#note[$1/(2 pi)$ 的系数其实在哪个式子里都可以，属于定义问题]

== 5.2 存在条件

依然有强弱 Dirichlet 条件。

但弱条件变成充分不必要条件

== 5.3 傅里叶变换（Fourier transform）的性质（部分）

1. Scaling

$
  f(a t) <=> 1 / abs(a) F(omega / a)
$

2. Time reversal

$
  f(-t) <=> F(-omega)
$

3. Time shifting

$
  f(t - t_0) <=> F(omega) e^(- j omega t_0)
$

4. frequency shifting

$
  f(t) e^(j omega_0 t) <=> F(omega - omega_0)
$

由此还可以延伸得到

$
  f(t) cos omega_0 t <=> 1 / 2 [F(omega - omega_0) + F(omega + omega_0)]
$

5. Convolution theorem

$
  f_1(t) * f_2(t) <=> F_1(omega) dot F_2(omega)
$

$
  f_1(t) dot f_2(t) <=> 1 / (2 pi) F_1(omega) * F_2(omega)
$

6. Time differentiation

$
  (d^n f(t)) / (d t^n) <=> (j omega)^n F(omega)
$

7. Time integration

$
  integral_(-infinity)^t f(tau) dif tau <=> F(omega) / (j omega) + pi F(0) delta(omega)
$

8. Complex conjugation

$
  f^*(t) <=> F^*(-omega)
$

== 5.4 Ideal filter

设计一个理想滤波器（filter），可以先设计其幅度响应，然后再整体乘上一个延时相位响应因子

如一个低通滤波

#figure(
  image("Media/Chapter 5/5.4.png", width: 60%),
)

$
  H(omega) = text("rect")(omega / (2 W)) e^(- j omega t_d)
$

得到其时域响应
#figure(
  image("Media/Chapter 5/5.4.2.png", width: 60%),
)
$
  h(t) = W / pi sinc[W (t - t_d)]
$

不难注意到，该时域响应是非因果（noncausal），IIR，因此在使用时我们需要截断成因果（causal） FIR。

截断意味着丢弃信息。自然我们希望丢弃的值都比较接近 0。这也是为什么我们需要人为引入时延，把时域的峰值从原点移开。

== 5.5 Parseval's theorem

$
  E_f = integral_(-infinity)^infinity |f(t)|^2 dif t = 1 / (2 pi) integral_(-infinity)^infinity |F(omega)|^2 dif omega
$

== 5.6 自相关函数（autocorrelation function）与傅里叶变换（Fourier transform）

自相关函数（autocorrelation function）有

$
  psi_f(t) = integral_(-infinity)^infinity f(tau) f^*(tau - t) dif tau = f(t) * f^*(-t)
$

其傅里叶变换（Fourier transform）有

$
  cal(F) {psi_f(omega)} = F(omega) dot F^*(omega) = |F(omega)|^2
$

即一个信号的自相关函数（autocorrelation function）的傅里叶变换（Fourier transform）是其功率谱（power spectrum）

= Chapter 6: Laplace transform

傅里叶变换（Fourier transform）对无穷能量信号或不稳定（unstable）系统不适用。为了解决这一问题，我们将信号基底扩展为 $e^(s t)$，其中 $s = sigma + j omega$，得到 Laplace 变换

== 6.1 Laplace 变换公式

$
  F(s) = cal(L) {f(t)} = integral_(-infinity)^infinity f(t) e^(- s t) dif t
$

$
  f(t)= cal(L)^(-1) {F(s)} = 1 / (2 pi j) integral_(c - j infinity)^(c + j infinity) F(s) e^(s t) dif s
$

#note[逆变换（inverse transform）的积分路径是复平面 $sigma = c$ 的一条直线]

对 LTIC 系统的 Laplace 变换，依然有

$
  Y(s) = F(s) H(s)
$

== 6.2 单边（unilateral） Laplace

双边（bilateral） Laplace 时，如果不指定收敛域（region of convergence, ROC），逆变换（inverse transform）不唯一。

考虑到工程实践往往只处理因果（causal）信号，因此定义单边（unilateral） Laplace 变换：

$
  F(s) eq.delta integral_(0^-)^infinity f(t) e^(- s t) dif t
$

逆变换（inverse transform）的公式不变

== 6.3 Laplace 变换的收敛（convergence）性

#note[我们此处讨论的是单边（unilateral）变换]

$
  F(s) = & integral_(0^-)^infinity f(t) e^(- s t) dif t \
       = & integral_(0^-)^infinity [f(t) e^(- sigma t)] e^(- j omega t) dif t
$

因为 $|e^(j omega)| = 1$，其收敛（convergence）性等价于

$
  integral_(0^-)^infinity |f(t) e^(- sigma t)| dif t < infinity
$

也即，存在 $M$，使得

$
  |f(t)| <= M e^(sigma t)
$

#note[如 $e^(t^2)$ 是不存在 Laplace 变换的]

稳定（stable）系统：收敛域（region of convergence, ROC）包含虚轴

因果（causal）系统：收敛域（region of convergence, ROC）为分界线的右半平面（分界线任意）

视无穷远边极点（pole），相当于收敛域（region of convergence, ROC）夹在两个相邻极点（pole）之间

== 6.4 与 Fourier 变换的联系

若 Fourier 变换存在，则可以直接将傅里叶变换（Fourier transform）结果中的 $j omega$ 替换为 $s$

== 6.5 有理 Laplace 函数的逆 Laplace

有理函数的定义为

$
  X(s) = (s^M + b_(M-1) s^(M-1) + dots + b_1 s + b_0) / (a_N s^N + a_(N-1) s^(N-1) + dots + a_1 s + a_0)
$

或记为

$
  X(s) = K (product_(m=1)^M (s + z_m)) / (product_(n=1)^N (s + p_n))
$

我们目标是将其分解为形如 $s^a$，$1/(s+b)$，$1/(s+c)^2$ 的线性（linear）组合，之后根据变换表（transform table）得到原函数

1. $M < N$ 且无重复极点（pole）

$
  X = sum_(n=1)^N A_n / (s + p_n), quad A_n = [(s + p_n) X(s)]|_(s = p_n)
$

2. $M > N$，无重复极点（pole）

先做长除法，再转到 1。

3. 有重极点（pole）

$
  1 / (s + a)^k
$

可展开为

$
  A_1 / (s + a) + A_2 / (s + a)^2 + dots + A_k / (s + a)^k
$

== 6.6 Laplace 函数的性质

Laplace 与 Fourier 有许多相似的性质，在此我们不再列出那些形式一样的性质，只列出那些有所不同的。

1. Time reversal

双边（bilateral）：

$
  x(-t) <=> X(-s)
$

若 $X(s)$ 的收敛域（region of convergence, ROC）为 $sigma_1 < text("Re")(s) < sigma_2$，则 $X(-s)$ 的收敛域（region of convergence, ROC）为 $-sigma_2 < text("Re")(s) < -sigma_1$。

2. Time differentiation

双边（bilateral）：

$
  (d x(t)) / (d t) <=> s X(s)
$

单边（unilateral）：

$
  (d x(t)) / (d t) <=> s X(s) - x(0^-)
$

3. Frequency differentiation

双边（bilateral）：

$
  t x(t) <=> - (d X(s)) / (d s)
$

单边（unilateral）：

$
  t x(t) <=> - (d X(s)) / (d s)
$

4. Time integration

双边（bilateral）：

$
  integral_(-infinity)^t x(tau) dif tau <=> X(s) / s
$

单边（unilateral）：

$
  integral_(0^-)^t x(tau) dif tau <=> X(s) / s
$

5. Frequency integration

双边（bilateral）：

$
  x(t) / t <=> integral_s^infinity X(z) dif z
$

单边（unilateral）：

$
  x(t) / t <=> integral_s^infinity X(z) dif z
$

6. Frequency-convolution

双边（bilateral）：

$
  x_1(t) x_2(t) <=> 1 / (2 pi j) X_1(s) * X_2(s)
$

单边（unilateral）：

$
  x_1(t) x_2(t) <=> 1 / (2 pi j) X_1(s) * X_2(s)
$


== 6.7 Solution of ODEs: total response

使用 Laplace 变换能求解 ODE。下面我们使用一个例子来进行说明。

求解：

$
  (D^2 + 5 D + 6) y(t) = (D + 1) f(t)
$

其中 $f(t) = e^(-4 t) u(t)$ and $y(0^-) = 2, y^' (0^-) = 1$

将其全部转为 $s$ 域

$
  D y(t) <=> s Y(s) - y(0^-) = s Y(s) - 2
$

$
  D^2 y(t) <=> s^2 Y(s) - s y(0^-) - y^' (0^-) = s^2 Y(s) - 2 s - 1
$

$
  F(s) = 1 / (s + 4)
$

$
  D f(t) = s F(s) - f(0^-) = s / (s + 4)
$

代入整理即可得

$
  Y(s) = (2 s^2 + 10 s + 45) / ((s^2 + 5 s + 6)(s + 4))
$

转回时域即得

$
  y(t) = (13 / 2 e^(-2 t) - 3 e^(-3 t) - 3 / 2 e^(-4 t)) u(t)
$

== 6.8 The transfer function

在 $s$ 域下，传递函数（transfer function）可写成以下形式

$
  H(s) eq.delta Y(s) / F(s) = P(s) / Q(s) = (b_n s^n + b_(n-1) s^(n-1) + dots + b_1 s + b_0) / (s^n + a_(n-1) s^(n-1) + dots + a_1 s + a_0)
$

分母 = 0 是系统的特征方程（characteristic equation）

$
  Q(s) = 0 => s = p_i
$

这些 $p_i$ 是系统的极点（pole），决定了系统的特征响应 $e^(p_i t)$

连续系统的稳定（stable）条件：

- 所有极点（pole）的实部 $< 0$

== 6.9 Laplace 视角下的零输入（input）响应和零状态响应

在 6.7 中，把输入（input）置 0 即得到 0 输入（input）响应

把初始状态置 0 即得到 0 状态响应

= Chapter 7: Frequency response and analog filters

== 7.1 Frequency response of LTIC systems

我们已知 LTIC 系统的频率响应（frequency response）可以有以下几种表示形式

$
  e^(s t) => H(s) e^(s t)
$

$
  e^(j w t) => H(j w) e^(j w t)
$

$
  cos(w t) => Re{H(j w) e^(j w t)} = abs(H(j w)) cos[w t + angle H(j w)]
$

== 7.2 Ideal delay system

$
  H(s) = e^(-s T)
$

是一个理想延时系统

因为其有

$
  abs(H(j w)) = 1 quad angle H(j w) = Phi(j w) = - w T
$

定义

$
  - (d phi(j w)) / (d w) eq.delta T_g = T
$

为群延迟

== 7.3 Ideal differentiator

$
  H(s) = s ; quad H(j w) = j w = w e^((j pi) / 2)
$

相移是常数，幅度响应随 $w$ 增大而增大

== 7.4 Ideal integrator

$
  H(s) = 1 / s ; quad H(j w) = 1 / (j w) = 1 / w e^(- (j pi) / 2)
$

相移是常数，幅度响应随 $w$ 增大而减小

#figure(
  image("Media/Chapter 7/Ideal Filter.png", width: 100%),
)

== 7.5 Steady-state response and transient response

现在我们讨论系统对于一个因果（causal）复指数信号的响应

$
  x(t) = e^(j w t) u(t) <=> X(s) = 1 / (s - j w)
$

于是输出（output）有

$
  Y(s) = X(s) H(s) = X(s) P(s) / Q(s) = 1 / (s - j w) dot P(s) / (product_(i = 1)^N (s - lambda_i))
$

根据代数理论

$
  Y(s) = sum_(i = 1)^N A_i / (s - lambda_i) + H(j w) / (s - j w)
$

$
  <=> y(t) = sum_(i = 1)^N A_i e^(lambda_i t) u(t) + H(j w) e^(j w t) u(t)
$

$y(t)$ 的第一项是瞬态响应，对于稳定（stable）后的系统应趋近于 0

第二项是稳态响应。在 $t >= 0$ 时与非因果（noncausal）稳态响应一致

== 7.6 Effect of poles and zeros on the frequency response

$
  abs(H(j w)) = "到所有零点（zero）距离的乘积" / "到所有极点（pole）距离的乘积"
$

极点（pole）带来峰，零点（zero）带来凹

假设极（零）点为 $- alpha + j w_0$

$w_0$ 决定了峰位置

$alpha$ 决定了峰有多尖

稳定（stable）系统极点（pole）必须位于左半平面（虚轴分界）

== 7.7 使用极点（pole）和零点（zero）设计滤波器（filter）

略

== 7.8 Butterworth filters

$n$ 阶 Butterworth 的频率响应（frequency response）为

$
  abs(H(j w)) = 1 / sqrt(1 + (w / w_c)^(2 n))
$

在 $w_c$ 处，幅度响应为 $1 / sqrt(2)$，功率为 $1 / 2 = -3 "dB"$

所以 $w_c$ 又称半功率或负 3 dB 频率

下文为计算方便，我们使用归一化（normalization）的频率：$w / w_c -> w$

$
  abs(overline(H)(j w))^2 = 1 / (1 + w^(2 n))
$

直接使用 $s$ 替换 $j w$ 得

$
  abs(overline(H)(s))^2 = 1 / (1 + (s / j)^(2 n))
$

极点（pole）满足

$
  1 + (s / j)^(2 n) = 0
$

$
  => s = e^((j pi) / (2 n) (2 k + n - 1)), quad k = 1, 2, 3, dots, 2 n
$

极点（pole）在单位圆上

实际上，

$
  abs(overline(H)(s))^2 = overline(H)(s) overline(H)(-s)
$

所以我们前面得到的极点（pole）是关于虚轴镜像叠加后的。由于稳定（stable）系统极点（pole）只能在左半平面，所以以上结果只取左半平面的即得到 Butterworth 的极点（pole）

#figure(
  image("Media/Chapter 7/Butterworth.png", width: 100%),
)

Butterworth 的系统函数（system function）为

$
  overline(H)(s) = 1 / (s^n + a_(n-1) s^(n-1) + dots + a_1 s + 1)
$

非归一化（normalization）有

$
  H(s) = overline(H)(s / w_c)
$

- 根据指标设计参数

现在我们希望通带边界为 $w_p$，增益为 $G_p$

阻带边界为 $w_s$，增益为 $G_s$

得到

$
  G_p = -10 log_10 [1 + (w_p / w_c)^(2 n)]
$

$
  G_s = -10 log_10 [1 + (w_s / w_c)^(2 n)]
$

解得

$
  n = 1 / 2 dot (log_10(10^(-G_s / 10) - 1) / (10^(-G_p / 10) - 1)) / (log_10 (w_s / w_p))
$

$
  w_c = w_p / [10^(-G_p / 10) - 1]^(1 / (2 n)) = w_s / [10^(-G_s / 10) - 1]^(1 / (2 n))
$

实际运用时，$n$ 向上取整

== 7.10 Chebyshev 低通

$
  abs(H(w))^2 = 1 / (1 + epsilon^2 V_n^2 (w / w_c)), quad V_n (x) = cos(n cos^(-1) x)
$

$epsilon$ 决定波动大小，$epsilon$ 小，波动小

通带内有等幅波动，但下降比 Butterworth 陡

极点（pole）在椭圆上

== 7.11 Elliptic 低通

$
  abs(H(w))^2 = 1 / (1 + epsilon^2 R_n^2 (xi, w / w_c))
$

$R_n$ 是 $n$ 阶 elliptic rational function

$xi$ 是 selectivity factor

通带和阻带都是等幅波动

== 7.12 从低通原型设计滤波器（filter）

$H_p (s)$ 是低通原型

$T(s)$ 是频域映射函数

$
  H(s) = H_p (T(s))
$

是目标

1. 高通

$
  T(s) = w_p / s
$

2. 带通

$
  T(s) = (s^2 + w_(p_1) w_(p_2)) / ((w_(p_2) - w_(p_1)) s)
$

3. 带阻

$
  T(s) = ((w_(p_2) - w_(p_1)) s) / (s^2 + w_(p_1) w_(p_2))
$

= Chapter 8: Sampling of continuous-time signals

本章不做总结

= Chapter 9: Discrete-time signals and systems

== 9.1 离散时间信号

离散时间信号可以从连续信号采样（sampling）的视角得到

$
  x(n) = x_a (n T)
$

或者从冲激（impulse）信号集合的角度得到

$
  x(n) = sum_(k = -oo)^oo a_k delta(n - k)
$

或

$
  x(n) = sum_(k = -oo)^oo x(k) delta(n - k)
$

== 9.2 离散周期信号

$exists N != 0$, s.t. $x(n) = x(n + N)$, $forall n$

离散视角会带来一些额外讨论

以三角函数为例

$
  x(n) = cos(w n)
$

若要

$
  cos(w n) = cos(w (n + N))
$

有 $w N = 2 k pi$，$=> w = (2 k pi) / N$

而 $N$ 只能取到整数，因此限制了频率的取值

== 9.3 Moving average systems

$
  y(n) = 1 / (M_1 + M_2 + 1) sum_(k = -M_1)^(M_2) x(n - k)
$

== 9.4 线性时不变（linear time-invariant, LTI）系统的卷积（convolution）形式推导

$cal(H)$ 表示经过一个系统

$
  y(n) = & cal(H){sum_(k = -oo)^oo x(k) delta(n - k)} \
       = & sum_(k = -oo)^oo cal(H){x(k) delta(n - k)} \
       = & sum_(k = -oo)^oo x(k) cal(H){delta(n - k)} \
       = & sum_(k = -oo)^oo x(k) h(n - k)
$

== 9.5 稳定（stable）性

离散系统 BIBD 的一个充分条件是

$
  sum_(n = -oo)^oo abs(h(n)) < oo
$

== 9.6 常系数差分方程（difference equation）

Advance 形式

$
    & a_N y(n + N) + a_(N - 1) y(n + N - 1) + dots + a_0 y(n) \
  = & b_M x(n + M) + b_(M - 1) x(n + M - 1) + dots + b_0 x(n)
$

因果（causal）系统的必要条件是 $M <= N$

在 $M = N$ 的条件下，也可以写成 Delay 形式

$
    & a_N y(n) + dots + a_1 y(n - N + 1) + a_0 y(n - N) \
  = & b_N x(n) + dots + b_1 x(n - N + 1) + b_0 x(n - N)
$

为求解响应，也可以使用以下递推形式

$
  y(n) = & -a_(N - 1) y(n - 1) - a_(N - 2) y(n - 2) - dots - a_0 y(n - N) \
         & + b_N x(n) + b_(N - 1) x(n - 1) + dots + b_0 x(n - N)
$

需要 $N$ 个提前的输出（output）值作为初始状态条件

为简便书写，有时也使用 $E$ 算子

$
  E^k x(n) eq.delta x(n + k)
$

== 9.7 LTID 系统的零输入（input）响应

离散系统的响应同样可以分为零输入（input）响应和零状态响应

1. 零输入（input）响应问题

可以转换为求解

$
  Q(E) y_0 (n) = 0
$

猜解为 $y_0(n) = C r^n$ 的形式，于是有

$
  E^N y_0(n) = C r^n r^(N)
$

代入化简为

$
  C (r^N + a_(N - 1) r^(N - 1) + dots + a_1 r + a_0)
  dot r^(-N) = 0
$

$
  (r - r_1) (r - r_2) dots (r - r_N) = 0
$

$
  => y_0(n) = C_1 r_1^n + C_2 r_2^n + dots
  + C_N r_N^n
$

如果存在重根，如

$
  Q(r) = (r - r_1)^r (r - r_(r + 1))
  dot (r - r_(r + 2)) dots (r - r_N)
$

$
  => y_0(n) = & (C_1 + C_2 n + C_3 n^2 + dots + C_r n^(r - 1)) r_1^n \
              & + C_(r + 1) r_(r + 1)^n + C_(r + 2) r_(r + 2)^n + dots + C_N r_N^n
$

== 9.8 LTID 的冲激响应（impulse response）

LTID 的冲激响应（impulse response）的闭式解有以下形式

$
  h(n) = b_0 / a_0 delta(n) + y_N(n) u(n)
$

其中，$y_N(n)$ 是零输入（input）响应时的模态的线性（linear）组合

用递推方式求出前 $n$ 个值后，就可以得到线性（linear）组合的系数

== 9.9 LTID 的总响应

$
  "total response" = sum_(k = 1)^N C_k r_k^n + f(n) * h(n)
$

第一项是零输入（input）响应，第二项是零状态响应

= Chapter 10 Frequency domain representation

== 10.1 频域表示

系统的频域表示可以定义为对单位复指数输入（input）的响应幅度

当 $x = e^(j w n)$ 时

$
  y(n) = & sum_(k = -oo)^oo h(k) x(n - k) \
       = & sum_(k = -oo)^oo h(k) e^(j w (n - k)) \
       = & e^(j w n) [sum_(k = -oo)^oo h(k) e^(-j w k)]
$

于是

$
  H(e^(j w)) = sum_(k = -oo)^oo h(k) e^(-j w k)
$

对于离散系统，我们注意到

$
  H(e^(j (w + 2 pi))) = & sum_(k = -oo)^oo h(k) e^(-j (w + 2 pi) k) \
                      = & sum_(k = -oo)^oo h(k) e^(-j w k) e^(-j 2 pi k) \
                      = & sum_(k = -oo)^oo h(k) e^(-j w k) \
                      = & H(e^(j w))
$

== 10.2 理想时延系统的响应

$
  H(e^(j w)) = sum_(k = -oo)^oo delta(k - n_d) e^(-j w k) = e^(-j w n_d)
$

$
  abs(H(e^(j w))) = 1
$

$
  Theta(w) = -w n_d
$

== 10.3 离散时间傅里叶变换（discrete-time Fourier transform, DTFT）

$
  X(e^(j w)) = sum_(n = -oo)^oo x(n) e^(-j w n)
$

$
  x(n) = 1 / (2 pi) integral_(-pi)^pi X(e^(j w)) e^(j w n) dif w
$

跟连续时间对比可以看出，正变换从积分变成了求和，而逆变换（inverse transform）的积分上下限变为定值。

#note[连续的为

$
  X(j Omega) = integral_(-oo)^oo x(t) e^(-j Omega t) dif t
$

$
  x(t) = 1 / (2 pi) integral_(-oo)^oo X(j Omega) e^(j Omega t) dif Omega
$
]
DTFT 存在的一个充分条件是原信号绝对可和，即

$
  sum_(n = -oo)^oo abs(x(n)) < oo
$

不过这不是必要条件

== 10.4 DTFT 的性质（部分）

1. 时延

$
  x(n + l) <=> e^(j w l) X(e^(j w))
$

2. 乘复指数

$
  e^(j w_0 n) x(n) <=> X(e^(j (w - w_0)))
$

3. 复微分

$
  n x(n) <=> -j (dif X(e^(j w))) / (dif w)
$

4. 帕塞瓦尔定理

$
  sum_(n = -oo)^oo x_1(n) x_2^ast (n) = 1 / (2 pi) integral_(-pi)^pi X_1(e^(j w)) X_2^ast (e^(j w)) dif w
$

$
  sum_(n = -oo)^oo abs(x(n))^2 = 1 / (2 pi) integral_(-pi)^pi abs(X(e^(j w)))^2 dif w
$

5. Complex conjugation

$
  x^ast (n) <=> X^ast (e^(-j w))
$

注：等价于 $X^ast ((e^(j w))^ast)$

6. 对称性

对于实信号有

$
  X(e^(j w)) = X^ast (e^(-j w))
$

= Chapter 11 Discrete Fourier transform

离散时间傅里叶变换（discrete-time Fourier transform, DTFT）和离散傅里叶变换（discrete Fourier transform, DFT）是两件事

== 11.1 离散傅里叶变换（discrete Fourier transform, DFT）

离散傅里叶变换（discrete Fourier transform, DFT）可以视作对离散时间傅里叶变换（discrete-time Fourier transform, DTFT）的采样（sampling）

$
  X^' (e^(j w)) = X(e^(j w)) sum_(k = -oo)^oo delta(w - (2 pi) / N k)
$

做逆变换（inverse transform）回去

$
  "DTFT"^(-1) { X^' (e^(j w)) } = N / (2 pi) sum_(p = -oo)^oo x(n - N p)
$

得到的是原函数周期延拓叠加的函数，发生了时域混叠（aliasing）

但是如果原函数只在 $N$ 点区间有值，则虽然会发生周期延拓，但不存在混叠（aliasing）。

以下给出 DFT 的定义

$
  X(k) eq.delta sum_(n = 0)^(N - 1) x(n) e^(-j (2 pi k n) / N), " for " 0 <= k <= N - 1
$

$
  x(n) = 1 / N sum_(k = 0)^(N - 1) X(k) e^(j (2 pi k n) / N), " for " 0 <= n <= N - 1
$

== 11.2 DFT 性质（部分）

为便于后续讨论，我们先定义一个新记号

$
  X(k)_N eq.delta X(k mod N)
$

1. 循环卷积（convolution）

$
  sum_(l = 0)^(N - 1) x(l) h(n - l)_N <=> X(k) H(k)
$

2. 相关性

$
  sum_(l = 0)^(N - 1) x(l) h(n + l)_N <=> X(-k)_N H(k)
$

3. 帕塞瓦尔定理

$
  sum_(n = 0)^(N - 1) abs(x(n))^2 = 1 / N sum_(k = 0)^(N - 1) abs(X(k))^2
$

== 11.3 频域分辨率

不额外加窗情况下，两个正弦 $w_a, w_b$ 频谱分辨的条件为

$
  Delta w = abs(w_a - w_b) > 2 times (2 pi) / N
$

$(2 pi) / N$ 是一个 bin 宽度，2 倍的理由可以从下图看出

#figure(
  image("Media/Chapter 11/11.3-frequency-resolution.png", width: 92%),
)

对于加窗后的一般情况

$
  Delta w > B_w = Q times (2 pi) / N
$

矩形窗 $Q = 2$

Hamming $Q = 4$

== 11.4 DFT 的矩阵表示

$
  overline(X) = overline(overline(S_N)) overline(x)
$

其中

$
  S_N (i, j) = e^(-j (2 pi i j) / N)
$

于是

$
  overline(x) = 1 / N overline(overline(S_N^H)) overline(X)
$

== 11.5 傅里叶全家桶

#figure(
  image("Media/Chapter 11/11.5-fourier-roadmap.png", width: 100%),
)

= Chapter 12: Efficient convolution using DFT

本章节无需整理

= Chapter 13 The z-transform

== 13.1 z-变换（z-transform）

z 变换（z-transform）的思想来源于给离散系统输入（input）信号 $x(n) = z^n$

$
  y(n) =& sum_(k = -oo)^oo x(n - k) h(k)\

  =& sum_(k = -oo)^oo z^(n - k) h(k)\

  =& z^n sum_(k = -oo)^oo h(k) z^(-k)
$

因此提取 z 变换（z-transform）为

$
  H(z) = sum_(k = -oo)^oo h(k) z^(-k)
$

DTFT 是 $z = e^(j w)$ 时的一种特殊情况

z 变换（z-transform）同样存在收敛域（region of convergence, ROC）问题，一般收敛域（region of convergence, ROC）为形如

$
  r_1 < abs(z) < r_2
$

并且有

$
  r_1 = lim_(n -> oo) abs(x(n + 1) / x(n))
$

$
  r_2 = lim_(n -> -oo) abs(x(n + 1) / x(n))
$

有些情况下，内环可能退化为零点（zero），外环可能趋近无限，如如果收敛域（region of convergence, ROC）包含 $r = 1$，则 DTFT 收敛（convergence）

== 13.2 有理 z 变换（rational z-transform）

有理 z 变换（rational z-transform）为以下形式

$
  X(z) = N(z) / D(z)
$

其中，$N$ 和 $D$ 都是多项式

$N(z)$ 的根为系统零点（zero），$D(z)$ 的根为系统极点（pole）。

极点（pole）决定了收敛域（region of convergence, ROC）

对于右侧（right-sided）单边（unilateral）序列，收敛域（region of convergence, ROC）在模最大的极点（pole）外

对于左侧（left-sided）单边（unilateral）序列，收敛域（region of convergence, ROC）在模最小的极点（pole）内

对于双边（bilateral）序列，收敛域（region of convergence, ROC）在两个极点（pole）之间

有限长序列往往只有原点一个极点（pole）

== 13.3 z-变换（z-transform）的逆变换（inverse transform）

z 变换（z-transform）的逆变换（inverse transform）的公式为

$
  x(n) = 1 / (2 pi j) integral.cont_C X(z) z^(n - 1) dif z
$

需要在复平面上进行路径积分，一般不用

常用的方法有以下三种

1. 查表法

2. 有理分式展开法

3. 幂级数展开

== 13.4 z 变换（z-transform）的性质（部分）

1. Time reversal

$
  x(-n) <=> X(z^(-1)), " ROC = " 1 / r_2 < abs(z) < 1 / r_1
$

2. Time shift

$
  x(n + l) <=> z^l X(z)
$

3. Multiplication by an exponential

$
  a^n x(n) <=> X(z / a)
$

4. Complex differentiation

$
  n x(n) <=> -z (dif X(z)) / (dif z)
$

5. Complex conjugation

$
  x^ast (n) <=> X^ast (z^ast)
$

6. 初值定理（initial value theorem）

如果 $x(n)$ 是右侧（right-sided）因果（causal）信号，则

$
  x(0) = lim_(z -> oo) X(z)
$

== 13.5 单边（unilateral） z 变换（z-transform）

定义为

$
  X_U (z) = sum_(n = 0)^oo x(n) z^(-n)
$

对于因果（causal）信号无区别。

但对于非因果（noncausal），有以下重要性质。

$
  x(n - m) <=> z^(-m) X_U (z) + sum_(k = 1)^m x(k - m - 1) z^(-k + 1)
$

这一性质可以用来解 ODE

= Chapter 14 An Introduction to LTI digital filters

== 14.1 z-变换（z-transform）回顾

差分系统的一般方程为

$
  sum_(i = 0)^N a_i y(n - i) - sum_(l = 0)^M b_l x(n - l) = 0
$

由 z 变换（z-transform）可以转为

$
  sum_(i = 0)^N a_i z^(-i) Y(z) - sum_(l = 0)^M b_l z^(-l) X(z) = 0
$

于是有

$
  H(z) = Y(z) / X(z) = (sum_(l = 0)^M b_l z^(-l)) / (sum_(i = 0)^N a_i z^(-i))
$

根据 $a_0$ 约分后可得

$
  H(z) = (sum_(l = 0)^M b_l z^(-l)) / (1 + sum_(i = 1)^N a_i z^(-i))
$

对于 FIR，$H(z)$ 退化为

$
  H(z) = sum_(l = 0)^M b_l z^(-l)
$

对于纯递归，退化为

$
  H(z) = 1 / (sum_(i = 0)^N a_i z^(-i))
$

== 14.2 极零点（pole-zero）分析

$H(z)$ 也可以写为

$
  H(z) = H_0 [(product_(i = 1)^M (1 - z_i z^(-1))) / (product_(i = 1)^N (1 - p_i z^(-1)))]
$

$
  = H_0 z^(N - M) [(product_(i = 1)^M (z - z_i)) / (product_(i = 1)^N (z - p_i))]
$

$z_i$ 为零点（zero），$p_i$ 为极点（pole）

== 14.3 因果（causal）性与稳定（stable）性分析

因果（causal）性要求 $h(n)$ 是右侧（right-sided）信号，ROC 在最外极点（pole）外侧

稳定（stable）性则要求 ROC 包括单位圆，也即

$
  sum_(n = -oo)^oo abs(h(n)) < oo
$

或

$
  sum_(n = -oo)^oo abs(h(n) z^(-n)) < oo " for " abs(z) = 1
$

因果（causal）性和稳定（stable）性并不等价，我们举一个例子来说明

$
  H(z) = 1 / ((1 - 1 / 2 z^(-1)) (1 - 2 z^(-1)))
$

ROC: $abs(z) > 2$，因果（causal）但不稳定（unstable）

$1 / 2 < abs(z) < 2$，稳定（stable）但非因果（noncausal）

$abs(z) < 1 / 2$，反因果（anticausal）且不稳定（unstable）

因果（causal）性的一个必要条件是零点（zero）数不超过极点（pole）数

如果一个系统即因果（causal）又稳定（stable），则其极点（pole）都在单位圆里且 ROC 在单位圆外

== 14.4 相延迟 / 群延迟

相延迟的定义为

$
  P(w) eq.delta - Theta(w) / w
$

其中 $Theta(w) eq.delta angle H(e^(j w))$

但是 $Theta(w)$ 需要先做 unwrapping 修正 $2 pi$ 跳变

群延迟的定义为

$
  D(w) = - (dif Theta(w)) / (dif w)
$

== 14.5 滤波器（filter）分类

1. 零相位滤波器（filter）

相位响应为 $0$，充要条件为实偶信号

$
  h(n) = h(-n)
$

因此因果（causal）系统不可能是零相位

2. 线性（linear）相位

$
  H(e^(j w)) = A(e^(j w)) e^(j (alpha w + beta))
$

其中 $A$ 是一个实值函数

$
  Theta(w) = alpha w + beta " for " A(e^(j w)) > 0
$

$
  Theta(w) = alpha w + beta + pi " for " A(e^(j w)) < 0
$

如果一个N阶 FIR 是对称的，就会得到线性（linear）相位

$
  h(n) = h(N - 1 - n)
$

3. 全通

要求

$
  abs(H(e^(j w))) = 1
$

且存在特性

$
  sum_(n = -oo)^oo abs(x(n) * h_("ap")(n))^2 = sum_(n = -oo)^oo abs(x(n))^2
$

全通的零极点（pole）为呈特殊镜像关系

全通的系统函数（system function）有以下形式

$
  H(z) = e^(j phi) z^(-k) (tilde(A)(z)) / A(z), quad k >= 0
$

其中

$
  A(z) = 1 + a_1 z^(-1) + a_2 z^(-2) + dots + a_N z^(-N)
$

$
  tilde(A)(z) =& z^(-N) A^ast (z^(-1))\

  =& a_N^ast + a_(N - 1)^ast z^(-1) + dots + a_1^ast z^(-N + 1) + z^(-N)
$

对于极点（pole） $z = p$，必存在零点（zero） $z = 1 / p^ast$

4. 最小相位滤波器（filter）

极点（pole）和零点（zero）都严格在单位圆内

因果（causal）条件下，其自身与逆系统都是稳定（stable）的

= Chapter 15 Digital filter design

== 15.1 双线性（linear）变换到 z 域

$s$ 域的传递函数（transfer function）看起来与 z 域极为相似，然而，$s$ 域的基向量为 $e^(s t)$，z 域为 $z^n$，$s$ 和 z 并不等价，因此不能直接把 $s$ 替换为 z

频域是 $s$ 域上的虚轴，是 z 域上的单位圆

需要使用双线性（linear）法进行映射转换：

$
  s = 2 / T (1 - z^(-1)) / (1 + z^(-1))
$

$
  z = (1 + T / 2 s) / (1 - T / 2 s)
$

== 15.2 冲激响应（impulse response）不变法

另一种从模拟到数字的方法是冲激（impulse）采样（sampling）法

$
  H_a (s) -> h_a (t) -> h_d (n) = h_a (n T) -> H_d (z)
$

然而这种方法会带来混叠（aliasing），因此最好适用于带限系统

== 15.3 IIR 设计：最小二乘法

用阶数低的全极点（pole） IIR 去近似一个目标冲激响应（impulse response）

目标：$L$ 长 $h_d (n)$，IIR：$N$ 阶，$N << L$

即

$
  H(z) = b_0 / (1 - sum_(i = 1)^N a_i z^(-i)) approx H_d(z) = sum_(k = 0)^(L - 1) h_d (k) z^(-k)
$

我们定义优化目标为

$
  V(z) =& H_d(z) / H(z)\

  =& 1 / b_0 H_d (z) [1 - sum_(i = 1)^N a_i z^(-i)]\
$

$
  b_0 v(n) = h_d (n) - sum_(i = 1)^N a_i h_d (n - i)
$

最为理想的情况下，$V(z) = 1$

$
  v(n) = delta(n)
$

考虑到 $h_d (n)$ 的因果（causal）性，显然有

$
  b_0 = h_d (0)
$

而对剩下的 $n$，则是希望 $v(n)$ 尽可能小

$
  { hat(a)_i }_(i = 1)^N = arg min_(a_1, dots, a_N) sum_(n = 1)^oo [v(n)]^2
$

最小二乘解可以通过下面方程得到

$
  sum_(i = 1)^N a_i r(k, i) = v(k, 0), quad k = 1, 2, dots, N
$

$
  r(k, i) = sum_(n = 1)^oo h_d (n - i) h_d (n - k)
$

#note[必然失去线性（linear）相位]

== 15.4 FIR 设计：窗函数法与频率采样（sampling）

无需设计原型滤波器（filter），直接从理想频域响应出发，转时域加窗

另一种方法是频率采样（sampling）

从理想频率响应（frequency response）转时域第一步是先在

$
  w_k = 2 pi k / M
$

上采样（sampling），用 IDFT 得到 FIR 系数

$
  H(k) eq.delta H_d (e^(j w)) |_w = 2 pi k / M
$

$
  h(n) = 1 / M sum_(k = 0)^(M - 1) H(k) e^(j (2 pi k n) / M), quad n = 0, dots, M - 1
$

不过要注意这种方法会造成时域上的混叠（aliasing）

$
  h(n) =& 1 / M sum_(k = 0)^(M - 1) H(k) e^(j (2 pi k n) / M)\

  =& 1 / M sum_(k = 0)^(M - 1) H_d (e^(j (2 pi k n) / M)) e^(j (2 pi k n) / M)\

  =& sum_(r = -oo)^oo h_d (n + r M)
$

这就是为什么从无限长缩短为了 $M$ 个

= Chapter 16 Multirate systems

== 16.1 Downsampling

$
  y(n) = x(n M), " 适用于整数 " M
$

在 z 域里有

$
  Y(z) =& sum_(n = -oo)^oo y(n) z^(-n) = sum_(n = -oo)^oo x(n M) z^(-n)\

  =& sum_(m = -oo)^oo x(m) [1 / M sum_(k = 0)^(M - 1) e^(j (2 pi k m) / M)] z^(-m / M)
$

方括号里的项为

$
  1 / M sum_(k = 0)^(M - 1) e^(j (2 pi k m) / M) = cases(
    1 & "if" m " is " M ,
    0 & "otherwise"
  )
$

因此 $Y(z)$ 可以重写为

$
  Y(z) =& 1 / M sum_(k = 0)^(M - 1) sum_(m = -oo)^oo x(m) [e^(-j (2 pi k) / M) z^(1 / M)]^(-m)\

  =& 1 / M sum_(k = 0)^(M - 1) X(e^(-j 2 pi k / M) z^(1 / M))
$

在频域下有

$
  Y(e^(j w)) = 1 / M sum_(k = 0)^(M - 1) X(e^(j (w - 2 pi k) / M))
$

$y(n)$ 的频谱是 $x(m)$ 的在 $x$ 轴上拉伸 $m$ 倍，再由 $2 pi$ 周期延拓，$y$ 轴缩短 $1 / m$

如果 $x(m)$ 没有带限至 $pi / M$，则频域有混叠（aliasing）

时域滤波加抽取式为

$
  y(n) = sum_(m = -oo)^oo x(m) h_d (n M - m)
$

#figure(
  image("Media/Chapter 16/Downsampling.png", width: 60%),
)

== 16.2 Upsampling

$L$ 倍上插值的过程是在每两个点之间插入 $L - 1$ 个0

$
  y(n) = cases(
    x(n / L) ", "  n = k L quad k in ZZ,
    0  ", otherwise"
  )
$

z 域为

$
  Y(z) =& sum_(n = -oo)^oo y(n) z^(-n)\

  =& sum_(k = -oo)^oo x((k L) / L) z^(-k L)\

  =& sum_(k = -oo)^oo x(k) (z^L)^(-k)\

  =& X(z^L)
$

频域为

$
  Y(e^(j w)) = X(e^(j w L))
$

#figure(
  image("Media/Chapter 16/Upsampling.png", width: 60%),
)

== 16.3 插值（Interpolation）

尽管不会发生混叠（aliasing），但上采样（sampling）依然改变了频谱，因此需要对上采样（sampling）的 $0$ 的位置进行插值

由于频谱在 $x$ 轴上被压缩 $L$ 倍，因此可以使用一个

$
  [-pi / L, pi / L]
$

的低通来解决这一问题，具体为

$
  H_i (e^(j w)) = cases(
    L ", " w in [-pi / L, pi / L] ,
    0 ", " "otherwise"
  )
$

$
  y(n) = sum_(k = -oo)^oo x(k) h_i (n - k L)
$

除了理想插值外还有线性（linear）插值、等阶保持等方法

== 16.4 有理分数采样（sampling）

如果进行有理分数 $L / M$ 的采样（sampling），流程为：

#figure(
  image("Media/Chapter 16/Down and Up.png", width: 100%),
)


$
  H(e^(j w)) = cases(
    L ", " abs(w) <= min{pi / L, pi / M} ,
    0 ", " "otherwise"
  )
$

= Chapter 17 Discrete time random signals

== 17.1 CDF & PDF

CDF: cumulative distribution function

累积分布函数

$
  F_x (alpha) = P{ x <= alpha }
$

$F_x (alpha)$ 是递增函数，且有 $0 <= F_x (alpha) <= 1$

PDF: probability density function

$
  f_x (alpha) = (dif F_x (alpha)) / (dif alpha)
$

显然有：

$
  F_x (alpha) = integral_(-oo)^alpha f_x (u) dif u
$

== 17.2 期望、均值与方差、统计矩

设 $g(x)$ 是关于随机变量 $x$ 的函数，求期望有

$
  E{ g(x) } eq.delta integral_(-oo)^oo g(alpha) f_x (alpha) dif alpha
$

如果我们令 $g(x) = x$，于是有

$
  mu_x = E{ x } = integral_(-oo)^oo alpha f_x (alpha) dif alpha
$

即随机变量本身的均值

$
  sigma_x^2 = E{ (x - mu_x)^2 }
$

$
  = integral_(-oo)^oo (alpha - mu_x)^2 f_x (alpha) dif alpha
$

$
  = E{ x^2 } - mu_x^2
$

$i$ 阶矩的定义如下

$
  E{ x^i } = integral_(-oo)^oo alpha^i f_x (alpha) dif alpha
$

一阶矩即均值

二阶矩即能量

$i$ 阶中心矩的定义如下

$
  E{ (x - mu_x)^i } = integral_(-oo)^oo (alpha - mu_x)^i f_x (alpha) dif alpha
$

== 17.3 联合分布变量

$
  F_(x, y) (alpha, beta) = P{ x <= alpha, y <= beta }
$

$
  f_(x, y) (alpha, beta) = (partial^2 F_(x, y) (alpha, beta)) / (partial alpha partial beta)
$

$i$ 阶矩和 $i$ 阶中心矩的定义扩展为

$
  E{ x^i y^j } = integral_(-oo)^oo integral_(-oo)^oo alpha^i beta^j f_(x, y) (alpha, beta) dif alpha dif beta
$

$
  &E{ (x - mu_x)^i (y - mu_y)^j } \
  =& integral_(-oo)^oo integral_(-oo)^oo (alpha - mu_x)^i (beta - mu_y)^j f_(x, y) (alpha, beta) dif alpha dif beta
$

但是多了两个变量

Correlation:

$
  r_(x y) = E{ x y }
$

Covariance:

$
  C_(x y) = E{ (x - mu_x) (y - mu_y) }
$

且 $x, y$ 可能符合以下性质

1. 独立性：Independency

如有：

$
  f_(x, y) (alpha, beta) = f_x (alpha) f_y (beta)
$

2. 不相关：Uncorrelatedness

如有：

$
  E{ x y } = E{ x } E{ y }
$

等价条件为 $r_(x y) = mu_x mu_y$ 或 $C_(x y) = 0$

3. 正交（orthogonal）性：orthogonal

如有：

$
  r_(x y) = 0
$

独立 $=>$不相关，但不相关 $!=>$ 独立

正交（orthogonal）不一定不相关

两个不相关的零均值变量一定正交（orthogonal）

== 17.4 随机变量序列

即序列 $x(n)$ 的每个值都是随机变量

#note[对不同 $n$，并不一定是同一个随机变量，所有 $n$ 可以有自己的 pdf
]

$
  F_(x(n)) (alpha) = P{ x(n) <= alpha }
$

对于序列，每个时刻都有其统计值

$
  mu_x(n) = E{ x(n) }
$

$
  sigma_(x(n))^2 = E{ [x(n) - mu_x(n)]^2 }
$

对于任意的两个时刻 $k$ 和 $l$，同样存在联合分布

$
  F_(x(k), x(l)) (alpha, beta) = P{ x(k) <= alpha, x(l) <= beta }
$

$
  f_(x(k), x(l)) (alpha, beta) = (partial^2 F_(x(k), x(l)) (alpha, beta)) / (partial alpha partial beta)
$

auto-correlation

$
  r_x(k, l) = E{ x(k) x(l) }
$

auto-covariance

$
  C_x(k, l) =& E{ [x(k) - mu_x(k)] [x(l) - mu_x(l)] }\
   =& r_x(k, l) - mu_x(k) mu_x(l)
$

== 17.5 独立同分布序列

一类重要的随机序列是独立同分布序列

同分布意味着：

$
  f_(x(n)) (alpha) = f_x (alpha)
$

独立意味着

$
  f_(x(n), x(m)) (alpha, beta) = f_(x(n)) (alpha) dot f_(x(m)) (beta)
$

== 17.6 平稳随机过程

一个随机过程如果统计特性不随时间变化就是平稳过程，即

$
  f_(x(n)) (alpha) = f_(x(n + k)) (alpha) quad forall k, n
$

一个弱化的版本是宽平稳（wide-sense stationary, WSS）

它不要求所有统计量一致，只要求以下关键两个

$
  E{ x(n) } = E{ x(n + k) } = mu_x quad forall k, n
$

$
  r_x(k, l) = r_x(k - l, 0) quad forall k, l
$

如果两个过程均为 WSS，且有

$
  r_(x y) (k, l) = r_(x y) (k - l, 0) quad forall k, l
$

就可称它们为 jointly WSS

由于平稳的特性，自/互相关，协方差等可以简化为单变量函数

对于平稳过程，有以下特性

1. 对称性：

$
  r_x(k) = r_x(-k)
$

2. 零延迟自相关 = 均方值

$
  r_x(0) = E{ [x(n)]^2 } > 0
$

3. 最大值：

$
  r_x(0) >= abs(r_x(k)) quad forall k
$

遍历性是一个同样有用的性质，其定义为：

我们定义时间平均：

$
  <x(n)> =& lim_(N -> oo) <x(n)>_N\

  =& lim_(N -> oo) 1 / (2 N + 1) sum_(n = -N)^N x(n)
$

遍历性意味着时间平均等于统计平均，即

$
  <x(n)> = E{ x(n) } = mu_x
$

$
  <x(n) x(n - k)> = E{ x(n) x(n - k) } = r_x(k)
$

#note[平稳性推不出遍历性]

== 17.7 WSS 的频域表示

对 WSS 的频域表示实际上是对 auto-correlation 和 auto-covariance 的频域表示

$
  R_x (e^(j w)) = sum_(k = -oo)^oo r_x(k) e^(-j w k)
$

$
  r_x(k) = 1 / (2 pi) integral_(-pi)^pi R_x (e^(j w)) e^(j w k) dif w
$

$
  C_x (e^(j w)) = sum_(k = -oo)^oo c_x (k) e^(-j w k)
$

$
  c_x (k) = 1 / (2 pi) integral_(-pi)^pi C_x (e^(j w)) e^(j w k) dif w
$

并且可以注意到有：

$
  r_x(0) = E{ [x(n)]^2 } = 1 / (2 pi) integral_(-pi)^pi R_x (e^(j w)) dif w
$

也即平均功率。

$
  c_x(0) = sigma_x^2 = 1 / (2 pi) integral_(-pi)^pi C_x (e^(j w)) dif w
$

定义功率谱（power spectrum）密度

$
  S_x (w) eq.delta R_x (e^(j w))
$

== 17.8 WSS 与 LTI

在这一节分我们探讨 WSS 经过 LTI 的输出（output）的 $y(n)$ 的性质

均值：

$
  E{ y(n) } =& E{ sum_(k = -oo)^oo x(n - k) h(k) }\

  =& sum_(k = -oo)^oo E{ x(n - k) } h(k)\

  =& E{ x(n) } sum_(k = -oo)^oo h(k)
$

注意到：

$
  H(1) = H(e^(j w)) |_(w = 0) = sum_(k = -oo)^oo h(k) e^(j 0 k) = sum_(k = -oo)^oo h(k)
$

即 $sum_(k = -oo)^oo h(k)$ 是系统的直流增益

也即

$
  mu_y = mu_x H(1)
$

且 $y(n)$ 也是 WSS，但在此我们略去证明

除此之外还有以下性质

$
  r_y(l) = r_x(l) * h(l) * h(-l)
$

$
  R_y (e^(j w)) =& R_x (e^(j w)) H(e^(j w)) H^ast (e^(j w))\

  =& R_x(e^(j w)) abs(H(e^(j w)))^2
$

= Chapter 18: Introduction to spectral estimation

谱估计（spectral estimation）主要关心如何从有限长度的随机信号数据中估计其功率谱密度（power spectral density, PSD）。

== 18.1 估计量的评价指标

记参数 $theta$ 的估计值为 $hat(theta)$。

1. 偏差（bias）

定义

$
  B(hat(theta)) = theta - E{hat(theta)}
$

若 $B(hat(theta)) = 0$，则称其为无偏（unbiased）估计；否则为有偏估计。

很多估计在有限样本下是有偏的，但当样本长度 $N -> oo$ 时满足

$
  lim_(N -> oo) B(hat(theta)) = 0
$

则称其为渐近无偏（asymptotically unbiased）。

2. 方差（variance）

定义

$
  "var"(hat(theta)) = E{[hat(theta) - E{hat(theta)}]^2}
$

对好的估计量，我们希望当 $N -> oo$ 时

$
  lim_(N -> oo) "var"(hat(theta)) = 0
$

3. 一致性（consistency）

一致性衡量当 $N -> oo$ 时，估计值是否能够收敛到真实值。

常见的刻画方式有两种。

依概率收敛：

$
  lim_(N -> oo) P{abs(hat(theta) - theta) > epsilon} = 0
$

均方误差（mean square error, MSE）收敛：

$
  "MSE" = lim_(N -> oo) E{[hat(theta) - theta]^2} = 0
$

并且有

$
  E{[hat(theta) - theta]^2} = "var"(hat(theta)) + [B(hat(theta))]^2
$

因此，如果一个估计量是渐近无偏的，且当 $N -> oo$ 时方差趋于 0，那么它是一致估计量。

== 18.2 功率谱密度 PSD

这里默认信号是宽平稳（wide-sense stationary, WSS）的。实际信号往往只在短时间内近似视为 WSS。

PSD 有两种常见定义方式。

1. 从自相关函数出发

由 Chapter 17 可知

$
  S_x (w) eq.delta sum_(k = -oo)^oo r_x (k) e^(-j w k)
$

其中

$
  r_x(k) eq.delta E{x(n) x^ast (n - k)}
$

$S_x (w)$ 即信号的 PSD。

2. 从信号本身出发

$
  S_x (w) = lim_(N -> oo) E{1 / N abs(sum_(n = 0)^(N - 1) x(n) e^(-j w n))^2}
$

也可以写为

$
  S_x (w) = lim_(N -> oo) E{1 / N abs(X_N(e^(j w)))^2}
$

其中 $X_N (e^(j w))$ 表示从原信号中截取有限长度片段后得到的 DTFT。

== 18.3 周期图法（Periodogram Method）

从 PSD 的第二个定义出发，若只取有限个已知数据，则可得到周期图估计

$
  hat(S)_x^(p)(w) = 1 / N abs(sum_(n = 0)^(N - 1) x(n) e^(-j w n))^2
$



== 18.4 相关图法（Correlogram Method）

从 PSD 的第一个定义出发，可以先对自相关函数做有限长度估计，再对其进行离散时间傅里叶变换，得到相关图法估计

$
  hat(S)_x^(c)(w) = sum_(k = -N + 1)^(N - 1) hat(r)_x (k) e^(-j w k)
$

其中自相关函数同样需要用有限数据估计，常见的估计方式有两种。

1. 无偏估计

当 $k >= 0$ 时

$
  hat(r)_x^U (k) = 1 / (N - k) sum_(n = k)^(N - 1) x(n) x^ast (n - k)
$

2. 有偏估计

当 $k >= 0$ 时

$
  hat(r)_x^B (k) = 1 / N sum_(n = k)^(N - 1) x(n) x^ast (n - k)
$

对于负延迟，可由共轭对称性得到

$
  hat(r)_x (-k) = hat(r)_x^ast (k)
$

若采用有偏自相关估计，则对应的相关图法结果与周期图法相同，即

$
  sum_(k = -N + 1)^(N - 1) hat(r)_x^B (k) e^(-j w k) = 1 / N abs(sum_(n = 0)^(N - 1) x(n) e^(-j w n))^2, quad forall w
$

#set page(background: context {
  let textw = page.width - page.margin.left - page.margin.right
  let x = page.margin.left + 0.5 * textw
  let y = page.margin.top
  let h = page.height - page.margin.top - page.margin.bottom

  place(
    top + left,
    dx: x,
    dy: y,
    line(length: h, angle: 90deg, stroke: 0.5pt),
  )
})


= Appendix A: 常用 Fourier 变换对

以下给出一组常用的 Fourier 变换（Fourier transform）对。

#table(
  columns: (1.2fr, 1.35fr, 0.75fr),
  align: (left, left, left),
  inset: 6pt,
  stroke: none,

  table.hline(stroke: 0.6pt),
  [*$f(t)$*], [*$F(omega)$*], [*条件*],
  table.hline(stroke: 0.4pt),

  [$e^(-a t) u(t)$], [$1 / (a + j omega)$], [$a > 0$],
  [$e^(a t) u(-t)$], [$1 / (a - j omega)$], [$a > 0$],
  [$e^(-a abs(t))$], [$2 a / (a^2 + omega^2)$], [$a > 0$],
  [$t e^(-a t) u(t)$], [$1 / (a + j omega)^2$], [$a > 0$],
  [$t^n e^(-a t) u(t)$], [$n! / (a + j omega)^(n + 1)$], [$a > 0, n in NN$],
  [$delta(t)$], [$1$], [-],
  [$1$], [$2 pi delta(omega)$], [-],
  [$e^(j omega_0 t)$], [$2 pi delta(omega - omega_0)$], [-],
  [$cos omega_0 t$], [$pi [delta(omega - omega_0) + delta(omega + omega_0)]$], [-],
  [$sin omega_0 t$], [$j pi [delta(omega + omega_0) - delta(omega - omega_0)]$], [-],
  [$cos(omega_0 t) u(t)$], [$pi / 2 [delta(omega - omega_0) + delta(omega + omega_0)] + (j omega) / (omega_0^2 - omega^2)$], [-],
  [$sin(omega_0 t) u(t)$], [$pi / (2 j) [delta(omega - omega_0) - delta(omega + omega_0)] + omega_0 / (omega_0^2 - omega^2)$], [-],
  [$e^(-a t) sin(omega_0 t) u(t)$], [$omega_0 / ((a + j omega)^2 + omega_0^2)$], [$a > 0$],
  [$e^(-a t) cos(omega_0 t) u(t)$], [$(a + j omega) / ((a + j omega)^2 + omega_0^2)$], [$a > 0$],
  [$text("rect")(t / tau)$], [$tau sinc(omega tau / 2)$], [-],
  [$W / pi sinc(W t)$], [$text("rect")(omega / (2 W))$], [$tau = 2 / W$],
  [$u(t)$], [$pi delta(omega) + 1 / (j omega)$], [-],
  [$"sgn" t$], [$2 / (j omega)$], [-],
  [$Delta(t / tau)$], [$tau / 2 sinc^2(omega tau / 4)$], [-],
  [$W / (2 pi) sinc^2(W t / 2)$], [$Delta(omega / (2 W))$], [-],
  [$sum_(n = -oo)^oo delta(t - n T)$], [$omega_0 sum_(n = -oo)^oo delta(omega - n omega_0)$], [$omega_0 = 2 pi / T$],
  [$e^(-t^2 / (2 sigma^2))$], [$sigma sqrt(2 pi) e^(-sigma^2 omega^2 / 2)$], [-],

  table.hline(stroke: 0.6pt),
)

= Appendix B: Fourier 变换性质汇总

以下总结常用的 Fourier 变换性质。设

$
  f(t) <=> F(omega), quad f_1(t) <=> F_1(omega), quad f_2(t) <=> F_2(omega)
$

#table(
  columns: (1.05fr, 1.15fr, 1.2fr),
  align: (left, left, left),
  inset: 6pt,
  stroke: none,

  table.hline(stroke: 0.6pt),
  [*性质*], [*$f(t)$*], [*$F(omega)$*],
  table.hline(stroke: 0.4pt),

  [加法（addition）], [$f_1(t) + f_2(t)$], [$F_1(omega) + F_2(omega)$],
  [数乘（scalar multiplication）], [$k f(t)$], [$k F(omega)$],
  [对称性（symmetry）], [$F(t)$], [$2 pi f(-omega)$],
  [时间反转（time reversal）], [$f(-t)$], [$F(-omega)$],
  [共轭（complex conjugation）], [$f^ast (t)$], [$F^ast (-omega)$],
  [尺度变换（scaling）], [$f(a t)$], [$1 / abs(a) F(omega / a)$],
  [时移（time shift）], [$f(t - t_0)$], [$F(omega) e^(-j omega t_0)$],
  [频移（frequency shift）], [$f(t) e^(j omega_0 t)$], [$F(omega - omega_0)$],
  [时域卷积（time convolution）], [$f_1(t) * f_2(t)$], [$F_1(omega) F_2(omega)$],
  [频域卷积（frequency convolution）], [$f_1(t) f_2(t)$], [$1 / (2 pi) F_1(omega) * F_2(omega)$],
  [时域微分（time differentiation）], [$(dif^n f(t)) / (dif t^n)$], [$(j omega)^n F(omega)$],
  [时域积分（time integration）], [$integral_(-infinity)^t f(tau) dif tau$], [$F(omega) / (j omega) + pi F(0) delta(omega)$],

  table.hline(stroke: 0.6pt),
)

= Appendix C: 常用 Laplace 变换对

以下给出一组常用的 Laplace 变换（Laplace transform）对。这里默认讨论单边（unilateral） Laplace 变换，因此时域信号多数写成与 $u(t)$ 相乘的形式。

#table(
  columns: (1.2fr, 1.35fr, 0.75fr),
  align: (left, left, left),
  inset: 6pt,
  stroke: none,

  table.hline(stroke: 0.6pt),
  [*$f(t)$*], [*$F(s)$*], [*条件*],
  table.hline(stroke: 0.4pt),

  [$delta(t)$], [$1$], [-],
  [$u(t)$], [$1 / s$], [-],
  [$t u(t)$], [$1 / s^2$], [-],
  [$t^n u(t)$], [$n! / s^(n + 1)$], [$n in NN$],
  [$e^(lambda t) u(t)$], [$1 / (s - lambda)$], [-],
  [$t e^(lambda t) u(t)$], [$1 / (s - lambda)^2$], [-],
  [$t^n e^(lambda t) u(t)$], [$n! / (s - lambda)^(n + 1)$], [$n in NN$],
  [$cos(b t) u(t)$], [$s / (s^2 + b^2)$], [-],
  [$sin(b t) u(t)$], [$b / (s^2 + b^2)$], [-],
  [$e^(-a t) cos(b t) u(t)$], [$(s + a) / ((s + a)^2 + b^2)$], [-],
  [$e^(-a t) sin(b t) u(t)$], [$b / ((s + a)^2 + b^2)$], [-],
  [$r e^(-a t) cos(b t + theta) u(t)$], [$((r cos theta) s + (a r cos theta - b r sin theta)) / (s^2 + 2 a s + (a^2 + b^2))$], [-],
  [$r e^(-a t) cos(b t + theta) u(t)$], [$1 / 2 [r e^(j theta) / (s + a - j b) + r e^(-j theta) / (s + a + j b)]$], [-],

  table.hline(stroke: 0.6pt),
)

对于形如

$
  (A s + B) / (s^2 + 2 a s + c)
$

的二次分母项，若令

$
  b = sqrt(c - a^2)
$

则可以写成以下等价时域形式：

#table(
  columns: (1.45fr, 1.1fr),
  align: (left, left),
  inset: 6pt,
  stroke: none,

  table.hline(stroke: 0.6pt),
  [*$f(t)$*], [*$F(s)$*],
  table.hline(stroke: 0.4pt),

  [$r e^(-a t) cos(b t + theta) u(t)$], [$(A s + B) / (s^2 + 2 a s + c)$],
  [$e^(-a t) [A cos(b t) + (B - A a) / b sin(b t)] u(t)$], [$(A s + B) / (s^2 + 2 a s + c)$],

  table.hline(stroke: 0.6pt),
)

其中参数关系为

$
  r = sqrt((A^2 c + B^2 - 2 A B a) / (c - a^2))
$

$
  theta = arctan((A a - B) / (A sqrt(c - a^2)))
$

= Appendix D: Laplace 变换性质汇总

下表默认采用单边（unilateral） Laplace 变换的写法。

#table(
  columns: (1.05fr, 1.2fr, 1.35fr),
  align: (left, left, left),
  inset: 6pt,
  stroke: none,

  table.hline(stroke: 0.6pt),
  [*性质*], [*$f(t)$*], [*$F(s)$*],
  table.hline(stroke: 0.4pt),

  [加法（addition）], [$f_1(t) + f_2(t)$], [$F_1(s) + F_2(s)$],
  [数乘（scalar multiplication）], [$k f(t)$], [$k F(s)$],
  [时间反转（time reversal）], [$f(-t)$], [$F(-s), quad "bilateral"$],
  [时域微分（time differentiation）], [$(dif^n f(t)) / (dif t^n)$], [$s^n F(s) -\ sum_(k = 1)^n s^(n-k) f^((k - 1))(0^-)$],
  [时域积分（time integration）], [$integral_(-infinity)^t f(tau) dif tau$], [$1 / s F(s) + 1 / s integral_(-infinity)^(0^-) f(t) dif t$],
  [时移（time shift）], [$f(t - t_0) u(t - t_0)$], [$F(s) e^(-s t_0), quad t_0 >= 0$],
  [频移（frequency shift）], [$f(t) e^(s_0 t)$], [$F(s - s_0)$],
  [频域微分（frequency differentiation）], [$-t f(t)$], [$(dif F(s)) / (dif s)$],
  [频域积分（frequency integration）], [$f(t) / t$], [$integral_s^infinity F(z) dif z$],
  [尺度变换（scaling）], [$f(a t), quad a >= 0$], [$1 / a F(s / a)$],
  [时域卷积（time convolution）], [$f_1(t) * f_2(t)$], [$F_1(s) F_2(s)$],
  [频域卷积（frequency convolution）], [$f_1(t) f_2(t)$], [$1 / (2 pi j) F_1(s) * F_2(s)$],
  [初值定理（initial value theorem）], [$f(0^+)$], [$lim_(s -> infinity) s F(s), quad (N > M)$],
  [终值定理（final value theorem）], [$f(infinity)$], [$lim_(s -> 0) s F(s), \ ("poles of " s F(s) " in LHP")$],

  table.hline(stroke: 0.6pt),
)

#note[$u(0^-) = 0$]

= Appendix E: 常用 z 变换对

以下给出一组常用的 z 变换（z-transform）对，并同时列出对应的收敛域（region of convergence, ROC）。

#table(
  columns: (1.15fr, 1.5fr, 0.9fr),
  align: (left, left, left),
  inset: 6pt,
  stroke: none,

  table.hline(stroke: 0.6pt),
  [*$x(n)$*], [*$X(z)$*], [*收敛域*],
  table.hline(stroke: 0.4pt),

  [$delta(n)$], [$1$], [$z in CC$],
  [$u(n)$], [$z / (z - 1)$], [$abs(z) > 1$],
  [$(-a)^n u(n)$], [$z / (z + a)$], [$abs(z) > abs(a)$],
  [$-(-a)^n u(-n - 1)$], [$z / (z + a)$], [$abs(z) < abs(a)$],
  [$n u(n)$], [$z / (z - 1)^2$], [$abs(z) > 1$],
  [$n^2 u(n)$], [$z (z + 1) / (z - 1)^3$], [$abs(z) > 1$],
  [$e^(a n) u(n)$], [$z / (z - e^a)$], [$abs(z) > e^a$],
  [$cos(omega n) u(n)$], [$z (z - cos omega) / (z^2 - 2 z cos omega + 1)$], [$abs(z) > 1$],
  [$sin(omega n) u(n)$], [$z sin omega / (z^2 - 2 z cos omega + 1)$], [$abs(z) > 1$],
  [$(1 / n) u(n - 1)$], [$ln(z / (z - 1))$], [$abs(z) > 1$],
  [$sin(omega n + theta) u(n)$], [$(z^2 sin theta + z sin(omega - theta)) / (z^2 - 2 z cos omega + 1)$], [$abs(z) > 1$],
  [$e^(a n) cos(omega n) u(n)$], [$(z^2 - z e^a cos omega) / (z^2 - 2 z e^a cos omega + e^(2 a))$], [$abs(z) > e^a$],
  [$e^(a n) sin(omega n) u(n)$], [$z e^a sin omega / (z^2 - 2 z e^a cos omega + e^(2 a))$], [$abs(z) > e^a$],

  table.hline(stroke: 0.6pt),
)

= Appendix F: z 变换性质汇总

以下总结常用的 z 变换（z-transform）性质。设

$
  x(n) <=> X(z), quad x_1(n) <=> X_1(z), quad x_2(n) <=> X_2(z)
$

若 $X(z)$ 的收敛域（region of convergence, ROC）为 $r_1 < abs(z) < r_2$，则时间反转后的收敛域（region of convergence, ROC）变为 $1 / r_2 < abs(z) < 1 / r_1$。

#table(
  columns: (1.05fr, 1.15fr, 1.35fr),
  align: (left, left, left),
  inset: 6pt,
  stroke: none,

  table.hline(stroke: 0.6pt),
  [*性质*], [*$x(n)$*], [*$X(z)$*],
  table.hline(stroke: 0.4pt),

  [加法（addition）], [$x_1(n) + x_2(n)$], [$X_1(z) + X_2(z)$],
  [数乘（scalar multiplication）], [$k x(n)$], [$k X(z)$],
  [时间反转（time reversal）], [$x(-n)$], [$X(z^(-1))$],
  [时移（time shift）], [$x(n + l)$], [$z^l X(z)$],
  [指数加权（multiplication by an exponential）], [$a^n x(n)$], [$X(z / a)$],
  [复域微分（complex differentiation）], [$n x(n)$], [$-z (dif X(z)) / (dif z)$],
  [共轭（complex conjugation）], [$x^ast (n)$], [$X^ast (z^ast)$],
  [时域卷积（time convolution）], [$x_1(n) * x_2(n)$], [$X_1(z) X_2(z)$],
  [初值定理（initial value theorem）], [$x(0)$], [$lim_(z -> oo) X(z), quad "right-sided"$],

  table.hline(stroke: 0.6pt),
)
