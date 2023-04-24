## Анализ прочности каркаса металлопластиковой трубы с дефектами

Здесь представлен небольшой обзор научно-исследовательской работы на тему "Анализ прочности каркаса металлопластиковой трубы с дефектами"

[полная версия работы](https://github.com/KatlinBulycheva/bachelor-thesis/blob/master/%D0%92%D0%9A%D0%A0.pdf)

### Объект исследования

В проекте анализируется армированная металлополимерная труба (или коротко МПТ). Конструкция представляет собой комбинацию решетчатого стального каркаса и полимерной матрицы, защищающую каркас от агрессивных сред.

<img
  src="./images/example-2.jpg"
  alt="Фото трубы"
  width='55%'>
<img
  src="./images/example-1.jpg"
  alt="Фото укладки труб"
  width='42.5%'>

МПТ объединяют в себе лучшие характеристики привычных нам стальных и пластиковых труб и славятся обширной областью применения. По большей части такие трубы применяются в нефтяной и химической промышленности.

### Методика анализа МПТ

Данная схема иллюстрирует методику анализа технического состояния трубопровода, согласно которой сначала проводится неразрушающий контроль.

<p align="center">
<image
  src="./images/scheme.png"
  alt="Методика анализа МПТ"
  width='60%'>
</p>

Иными словами, в полевых условиях выполняется внутритрубная диагностика с помощью магнитных и ультразвуковых дефектоскопов. После, полученные диагностические параметры используются для построения механической модели трубы. Механическая модель позволяет преобразовать диагностическую информацию в механические показатели несущей способности, например, в коэффициент запаса прочности, который применяется для оценки прочности и прогноза ресурса.

Однако точный прогноз возможен только при наличии представления о критическом состоянии конструкции. Поэтому здесь большую роль играет критерий браковки, который может быть установлен с помощью модельных расчетов, либо в сочетании с определенными экспериментальными данными.

### Цель работы

При постановке цели были сформулированы следующие подзадачи: 

1.	Построение модели каркаса в системе ANSYS и в дополнение оцифровка документации МПТ в системе Siemens NX.

<p align="center">
    <img src="./images/model-nx.png"
         alt="Модель в SiemensNX"
         width='40%'>
</p>
<p align="center"><em>Модель в SiemensNX</em></p>

2.	Анализ напряженно-деформированного состояния при отсутствии и при наличии дефектов. Что такое дефекты? Это типы разрушения каркаса, которые могут быть в виде локальных дефектов (обрывы проволок) и в виде распределенных дефектов (потеря сечения проволоки из-за коррозионного износа). 
3.	Построение диаграммы предельной кривой.

### Расчет каркаса без дефектов

Анализ механического состояния начался с каркаса без дефектов.

**Расчетная модель и деформации**

<img src="./images/model-ansys.jpg"
  alt="Модель в Ansys"
  width='50%'><img src="./images/strain-diagram-normal.jpg"
  alt="Деформированная труба без дефектов"
  width='49.97%'>

На рисунке *слева* представлена конечно-элементная (КЭ) модель в виде сегмента, так как каркас без дефектов симметричен. Давление 2 МПа задавалось эквивалентными сосредоточенными усилиями в местах контактной сварки. В качестве условных закреплений выбрана заделка, ограничивающая 120 мм длины трубы. 

На рисунке *справа* показана эпюра деформирования в цилиндрической системе координат. 

**Продольные и изгибные напряжения**

<img src="./images/stress-axial-normal.jpg"
  alt="Эпюра нормальных напряжений"
  width='50%'><img src="./images/stress-bend-normal.jpg"
  alt="Эпюра изгибных напряжений"
  width='49.77%'>

Осевые напряжения (рисунок *слева*) образуются в кольцевых проволоках и отсутствуют в продольных. Это означает, что спираль каркаса воспринимает основную нагрузку и работает на растяжение – сжатие. 

А вот продольные проволоки работаю на изгиб (рисунок *справа*). При этом характер напряжений имеет вид краевого эффекта, длина которого по аналитическим расчетам составляет, примерно, 40 мм. На рисунке *справа* видно, что длина затухания затрагивает 7-8 ячеек, что как раз соответствует 40 мм.

<p align='center'>
  <img src="https://quicklatex.com/cache3/1c/ql_36c18d536fecc61e68c4cd6c4188821c_l3.png"
  alt="Фактический запас прочности"
  width='30%'>
</p>

Так как напряжения краевого эффекта затухают быстро, то при оценке прочности изгибными напряжениями можно пренебречь. Таким образом, механический показатель составил 3.8, что означает выполнение условия прочности.

### Обрывы кольцевых проволок

Далее проведен расчет каркаса с учетом дефектов. 

Как было показано ранее, основную нагрузку от давления испытывает спиральная арматура. Поэтому, можно предположить, что в случае, например, гидроудара возможен обрыв в кольцевой проволоке. Варьируя число обрывов, был исследован характер перемещений и распределение напряжений. 

**Деформации и перемещения**

<img src="./images/wires-break.jpg"
  alt="Девормации обрыва проволок">

Выше на рисунке представлены вид деформирования в предкритичном состоянии (1 обрыв) и критичном (3 обрыва). В первом случае расхождение проволок составляет пол миллиметра, а во втором расхождение увеличилось, примерно, на 20%.

**Продольные напряжения**

<img src="./images/stress-axial-1break.jpg"
  alt="Эпюра продольных напряжений при одном обрыве"
  width='50%'><img src="./images/stress-axial-3break.jpg"
  alt="Эпюра продольных напряжений при трех обрывах"
  width='49.7%'>

На эпюрах продольных напряжений видно, что область дефекта является концентратором напряжений, и максимальные значения сосредоточены на соседних окружных проволоках от места обрыва. 

**Изгибные напряжения**

<img src="./images/stress-bend-1break.jpg"
  alt="Эпюра изгибных напряжений при одном обрыве"
  width='50%'><img src="./images/stress-bend-3break.jpg"
  alt="Эпюра изгибных напряжений при трех обрывах"
  width='49.67%'>

По характеру и численным значениям изгибных напряжений можно сказать, что при вычислении запаса прочности пренебречь этими напряжениями уже не удастся и их необходимо учитывать в расчете.

**Изменение несущей способности МПТ**

<img src="./images/diagram-break.jpg"
  alt="Диаграмма запаса прочности при обрывах"
  width='60%'> <img src="./images/avalanche-destruction.jpg"
  alt="Пример лавинообразного разрушшения"
  width='35.2%'>

Для наглядного представления того, как влияет количество обрывов на коэффициент запаса прочности, была построена диаграмма, связывающая эти факторы. На рисунке *слева* видно, что 3 обрыва – это критичный фактор. И при последующих обрывах в трубе может образоваться магистральная трещина, как на рисунке *справа*.

### Потеря сечения проволоки. Коррозия

Далее в каркасе была учтена потеря сечения проволок вследствие коррозии.

<img src="./images/diameter-reduction.jpg"
  alt="Изменнение сечений проволок">

Модельно это было осуществлено как уменьшение площади сечения проволоки, используя нижепредставленную формулу. 

<p align='center'>
  <img src="https://quicklatex.com/cache3/88/ql_9097de3785bcfcf5ee234c66c2d2de88_l3.png"
  alt="Потеря сечения"
  width='20%'>
</p>

**Напряженно-деформированное состояние**

<img src="./images/stress-axial-corrosion.jpg"
  alt="Эпюра продольных напряжений"
  width='50%'><img src="./images/stress-bend-corrosion.jpg"
  alt="Эпюра изгибных напряжений"
  width='50%'>

Напряженно-деформированное состояние аналогично случаю каркаса без дефектов. Естественно, что в зоне с распространившейся коррозией, будут потенциально опасные сечения конструкции.

**Изменение несущей способности МПТ**

Варьируя процент потери сечения, построена следующая диаграмма изменения несущей способности. 

<p align='center'>
<img src="./images/diagram-corrosion.jpg"
  alt="Диаграмма запаса прочности при коррозии"
  width='60%'>
</p>

Здесь видно, что критическое состояние наступает при 40-50%. Однако в действительности, коррозия настолько сильно не повреждает арматуру. Обычно встречаются дефекты до 20% максимум. Таким образом, коррозионный износ не столь существенен для МПТ по сравнению с обрывами проволок.

### Предельная кривая. Диагностика

Обобщая полученные результаты, построена предельная кривая МПТ, которая показывает допустимые и недопустимые комбинации дефектов в трубе. 

<p align='center'>
<img src="./images/limit-curve.jpg"
  alt="Предельная кривая"
  width='60%'>
</p>

Важно отметить, что данная кривая может быть использована на практике, а именно при оперативном диагностировании армированных труб для оценки их текущего состояния и суждения о возможности дальнейшей эксплуатации.

<img src="./images/diagnostics.jpg"
  alt="Диагностика труб"
  width='48%'> <img src="./images/magnetic-method.jpg"
  alt="Магнитный метод"
  width='50.5%'>

В основном диагностика проводится магнитным методом. В трубу запускается дефектоскоп (рисунок *слева*), который в потоке перекачиваемой жидкости намагничивает каркас и в случае обрыва, фиксирует скачек магнитного поля (рисунок *справа*), что подразумевает наличие дефекта.

### Заключение и выводы
1. Смоделирована конечно-элементная модель в системе ANSYS.
2. Выполнен анализ влияния потери сечения и локальных дефектов на потерю прочности.
3. Построена предельная кривая и сформулированы критерии браковки МПТ.