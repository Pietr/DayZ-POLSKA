


itemTXD = engineLoadTXD ("1-5/doz.txd");
engineImportTXD (itemTXD, 2387);
itemDFF = engineLoadDFF ("1-5/doz.dff", 2387);
engineReplaceModel (itemDFF, 2387);

itemTXD = engineLoadTXD ("1-5/canopen.txd");
engineImportTXD (itemTXD, 321);
itemDFF = engineLoadDFF ("1-5/canopen.dff", 321);
engineReplaceModel (itemDFF, 321);

