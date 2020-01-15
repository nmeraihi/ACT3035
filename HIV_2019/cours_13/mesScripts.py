def stripCol(df, elem1, elem2):
    """Ceci est une fonction qui pêrmet de nettoyer l;es nom de colnnes"""
    maliste3=[]
    for i in list(df.columns):
        toto=i.replace(elem1, "")
        toto=toto.replace(elem2, "")
        maliste3.append(toto)
    df.columns=maliste3
    return(df)