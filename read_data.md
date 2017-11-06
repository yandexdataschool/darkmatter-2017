# Reading Data

архив с данными
https://cernbox.cern.ch/index.php/s/KdcvaDxND5J9zY2

в нем несколько файлов в формате root

```
mcdata_taue2.root
129294.48.1.1000.cp.root
129294.49.1.1000.cp.root
129294.50.1.1000.cp.root
129294.51.1.1000.cp.root
129294.52.1.1000.cp.root
129294.53.1.1000.cp.root
129294.54.1.1000.cp.root
129294.55.1.1000.cp.root
129294.56.1.1000.cp.root
129294.57.1.1000.cp.root
```

`mcdata_taue2` - сигнал (конфигурации треков, которые мы ищем)
и остальные - это пластины кирпичей с треками фона, от которого нужно научиться избавляться

формат нетривиальный - для работы с ним существует библиотека 'root' (https://root.cern.ch/, стандарт де-факто для физического анализа данных)

если у вас mac, то ставить лучше всего через brew (`brew install root`)

если Linux - то через conda (`conda install -c nlesc root`)

когда либа поставится, нужно убедиться что в питоне вы можете ее импортировать:
`import ROOT`

чтобы уберечь ноги от нечаянных ран, нужно поставить еще одну либу: https://github.com/scikit-hep/root_numpy

она ставится относительно просто 
`pip install --user root_numpy`
(http://scikit-hep.org/root_numpy/install.html)

и тогда для чтения треков одной из пластин будет достаточно использовать команду 

```
backtracks = root_numpy.root2array("129294.{p}.1.1000.cp.root".format(p=48), 
                                       treename="couples", 
                                       branches=["s.eX", "s.eY", "s.eZ",
                                                "s.eTX", "s.eTY",
                                                "s.eChi2"], step=1000)
```
чтение симулированных ливней:

```
mc = root_numpy.root2array(
                        "mcdata_taue2.root",
                        treename="Data",
                        branches=["Event_id", "ele_P",
                                   "BT_X", "BT_Y", "BT_Z",
                                   "BT_SX", "BT_SY",
                                   "ele_x", "ele_y", "ele_z", 
                                   "ele_sx", "ele_sy", 
                                   "chisquare"])
```