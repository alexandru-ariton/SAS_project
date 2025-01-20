import pandas as pd



# CustomerID: Identificator unic pentru fiecare client.
# ProductID: Identificator unic pentru fiecare produs.
# Quantity: Numărul de unități achiziționate pentru un anumit produs.
# Price: Prețul unitar al produsului.
# StoreLocation: Locația unde a avut loc tranzacția.
# ProductCategory: Categoria din care face parte produsul.
# DiscountApplied: Procentul de reducere aplicat produsului.
# TotalAmount: Suma totală plătită pentru tranzacție



# 1. Importare date din fisier csv folosind pandas
# Exercitiul 1

df=pd.read_csv('./DATE/Retail_Transaction_Dataset.csv', index_col=0)
# cu index_col am setat ca 'customer_id' sa fie indexul data frame-ului
pd.set_option('display.max_rows', 50)
pd.set_option('display.max_columns', 6)
#print(df)


produse=list(df['ProductID'])


# Exercitiul 2

# Sa se creeze o lista cu toate locatiile magazinelor si sa se ordoneze alfabetic
locatii=list(df['StoreLocation'])
locatii.sort()
#print(locatii)


# Exercitiul 3

# Pe baza listei de produse sa se afle cantitatea totala vanduta din fiecare produs
cantitate_vanduta={}
for l in produse:
    cantitate_vanduta[l]=produse.count(l)
#print(cantitate_vanduta)



# Exercitiul 4

# Sa se determine determine numarul total de produse vandute folosindu-ne de dictionarul creat mai sus.

numar_total_produse=0
for key in cantitate_vanduta:
    numar_total_produse +=cantitate_vanduta[key]

#print("Numarul total de produse vandute este de: "+str(numar_total_produse))



# Exercitiul 5

# Sa se creeze un dictionar care are ca si cheie categoria produsului iar ca si valoare totalul amount-ul platit de client pe tranzactii

tranzactii_categorie=df.groupby("ProductCategory").sum()["TotalAmount"].to_dict()
#print(tranzactii_categorie)
total=0
for key in tranzactii_categorie:
    total+=tranzactii_categorie[key]
#print("Total "+str(total))




# Exercitiul 6
#
# Sa se aplice o reducere produselor:
# - disscount-ul care ii este deja atribuit daca pretul este pana in 40 euro
# - 20% daca pretul este intre 40-50 euro
# - 30% daca pretul este peste 50 euro

def reducere( pret, disscount):
    if pret<=40:
        if pret-disscount*pret < 0:
            return pret
        else:
            return pret-disscount*pret
    elif pret>40 and pret<=50:
        return pret-0.20*pret
    elif pret>50:
        return pret-0.30*pret
    else:
        return pret



# Aplicare functie:

# for i in df.itertuples():
#     print('Preț inițial:', i.Price)
#     print('Preț redus:', reducere(i.Price, i.DiscountApplied), '\n')




# Exercitiul 7

# Se va afisa DA daca produsul are pretul >35 pentru a primi reducere in caz contrar NU
# Am creat doua liste pentru a putea accesa mai usor valorile din respectivele coloane

# lista_coloane=list(df)
# produsele=df[lista_coloane[0]]
# prices=df[lista_coloane[2]]
# for index, row in df.iterrows():
#     produs = row[lista_coloane[0]]
#     price = row[lista_coloane[2]]
#     if price is not None and float(price) > 35:
#         print(f"Produsul: {produs} cu pretul: {price} reducere: DA")
#     elif price is not None:
#         print(f"Produsul: {produs} cu pretul: {price} reducere: NU")
#     else:
#         print(f"Pretul pentru produsul: {produs} nu este disponibil.")



# Exercitiul 8

#Sa se afiseze doar randurile care au ca si modalitate de plata 'Credit Card' si au disscount-ul < 15

#print(df.loc[(df['PaymentMethod']=='Credit Card')&(df['DiscountApplied']<15)])




# Exercitul 9

# Sa se stearga clientii care au cumparat produsele care au pretul<20
# Am retinut in variabila rows_to_delete index-urile randurilor care au pretul <20 iar cu functia .drop() am sters randurile precizand axis=0 care indica ca vom sterge randuri

rows_to_delete=df.loc[df['Price'] < 20].index.values
df=df.drop(rows_to_delete,axis=0)
#print(df)





# Exercitiul 10

# Sa se calculeze pretul mediu pentru fiecare produs

# print('Prețul mediu de vânzare pentru fiecare produs: \n')
df_pret_mediu=df.groupby('ProductID')['Price'].mean()
# print(df_pret_mediu)




# Exercitiul 11

# Creare raport:cantitatea de produse vandute din fiecare tip de la fiecare categorie


# print("Numarul de produse vandute din fiecare tip organizate in functie de categorie")
raport=df.groupby(['ProductCategory','ProductID'])['ProductID'].count()
# print(raport)



# Exercitiul 12

# Sa se afiseze pretul minim si maxim pentru fiecare produs

prices_max_min=df.groupby(['ProductID']).agg({'Price':[min,max]})
# print("Pretul minim si maxim pentru fiecare produs:")
# print(prices_max_min)




# Exercitiul 13

# Se va face un grafic de tip bar pentru produsele ale caror pret>30 euro.

# import matplotlib.pyplot as plt

# df[df['Price']>30].plot(kind='bar')
# plt.xlabel('Produs')
# plt.ylabel('Pret')
# plt.show()
