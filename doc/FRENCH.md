## Bibliothèque Linq 📊
La bibliothèque `Linq` fournit des outils puissants pour manipuler et interroger des collections de données de manière déclarative. Inspirée de la bibliothèque LINQ de .NET, elle permet des opérations complexes sur les tables Lua avec une API simple et expressive.

Ce guide vous expliquera comment utiliser cette bibliothèque, ses avantages et fournira des exemples pour vous aider à l'intégrer dans vos projets.

### Fonctionnalités 🌟
- **Filtrage** : Sélectionnez des éléments basés sur des prédicats.
- **Projection** : Transformez chaque élément d'une collection en une nouvelle forme.
- **Tri** : Triez les éléments selon une clé spécifiée.
- **Collections multi-dimensionnelles** : Manipulez facilement des tables à plusieurs dimensions.
- **Agrégation** : Calculez des valeurs agrégées comme la somme, la moyenne, le maximum et le minimum.
- **Groupe** : Groupez les éléments par une clé spécifiée.
- **Distinct** : Obtenez des éléments uniques basés sur une clé.
- **Zipper** : Combinez deux collections en une seule.
- **Append** : Ajoutez des éléments d'une collection à une autre.
- **Conversion en chaîne** : Représentation des tables sous forme de chaîne pour une inspection facile.

### Avantages ✅
- **Simplicité** : Manipulez les tables Lua avec une syntaxe expressive et concise.
- **Puissance** : Effectuez des opérations complexes sur les collections de données.
- **Flexibilité** : Adapté pour les tables de toute dimension.

### Utilisation 🚀

#### Création d'une collection Linq
Pour créer une nouvelle collection Linq, utilisez la classe `Linq` avec une table de données.
```lua
local myCollection = Linq({1, 2, 3, 4, 5})
```

#### Filtrage des données
Pour filtrer les éléments d'une collection, utilisez la méthode `where`.
```lua
local evenNumbers = myCollection:where(function(x) return x % 2 == 0 end)
```

#### Projection des données
Pour transformer les éléments d'une collection, utilisez la méthode `select`.
```lua
local squaredNumbers = myCollection:select(function(x) return x * x end)
```

#### Tri des données
Pour trier les éléments d'une collection, utilisez la méthode `orderBy`.
```lua
local sortedNumbers = myCollection:orderBy(function(x) return -x end)
```

#### Manipulation de tables multi-dimensionnelles
##### Exemple avec une table 2D
```lua
local matrix2D = Linq({
    {1, 2},
    {3, 4},
    {5, 6}
})

-- Filtrer les lignes où la somme des éléments est supérieure à 5
local filteredRows = matrix2D:where(function(row)
    return row[1] + row[2] > 5
end)

-- Projeter pour obtenir la première colonne
local firstColumn = matrix2D:select(function(row)
    return row[1]
end)
```
##### Exemple avec une table 3D
```lua
local matrix3D = Linq({
    {{1, 2}, {3, 4}},
    {{5, 6}, {7, 8}},
    {{9, 10}, {11, 12}}
})

-- Filtrer les matrices où le premier élément de la première sous-table est impair
local filteredMatrices = matrix3D:where(function(matrix)
    return matrix[1][1] % 2 ~= 0
end)

-- Projeter pour obtenir les éléments de la deuxième sous-table
local secondSubTables = matrix3D:select(function(matrix)
    return matrix[2]
end)
```

#### Agrégation des données
##### Exemple de somme
Pour calculer la somme des éléments d'une collection, utilisez la méthode `sum`.
```lua
local totalSum = myCollection:sum(function(x) return x end)
```
##### Exemple de moyenne
Pour calculer la moyenne des éléments d'une collection, utilisez la méthode `average`.
```lua
local averageValue = myCollection:average(function(x) return x end)
```
##### Exemple de maximum
Pour trouver le maximum des éléments d'une collection, utilisez la méthode `max`.
```lua
local maxValue = myCollection:max(function(x) return x end)
```
##### Exemple de minimum
Pour trouver le minimum des éléments d'une collection, utilisez la méthode `min`.
```lua
local minValue = myCollection:min(function(x) return x end)
```

#### Grouper les données
Pour grouper les éléments d'une collection par une clé spécifiée, utilisez la méthode `groupBy`.
```lua
local groupedByModulo = myCollection:groupBy(function(x) return x % 2 end)
```

#### Éléments distincts
Pour obtenir des éléments uniques d'une collection, utilisez la méthode `distinct`.
```lua
local distinctValues = Linq({1, 2, 2, 3, 4, 4, 5}):distinct(function(x) return x end)
```

#### Zipper les collections
Pour combiner deux collections en une seule, utilisez la méthode `zip`.
```lua
local list1 = Linq({1, 2, 3})
local list2 = Linq({"a", "b", "c"})
local zipped = list1:zip(list2:toList(), function(x, y) return {x, y} end)
```

#### Ajouter des éléments
Pour ajouter des éléments d'une collection à une autre, utilisez la méthode `append`.
```lua
local appended = list1:append(list2:toList())
```

#### Conversion en liste
Pour convertir une collection Linq en une liste Lua normale, utilisez la méthode `toList`.
```lua
local list = myCollection:toList()
```

#### Conversion en chaîne
Pour obtenir une représentation sous forme de chaîne d'une collection Linq, utilisez la méthode `toString`.
```lua
local stringRepresentation = myCollection:toString()
```

#### Contribution 🤝
Les contributions sont les bienvenues ! Si vous trouvez des problèmes ou avez des suggestions d'améliorations, n'hésitez pas à ouvrir une issue ou soumettre une pull request.