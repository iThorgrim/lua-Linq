## Linq Library 📊
The `Linq` library provides powerful tools for manipulating and querying data collections in a declarative manner. Inspired by the LINQ library from .NET, it enables complex operations on Lua tables with a simple and expressive API.

This guide will explain how to use this library, its advantages, and provide examples to help you integrate it into your projects.

### Features 🌟
- **Filtering**: Select elements based on predicates.
- **Projection**: Transform each element of a collection into a new form.
- **Sorting**: Sort elements by a specified key.
- **Multi-dimensional Collections**: Easily manipulate multi-dimensional tables.
- **Aggregation**: Compute aggregate values like sum, average, max, and min.
- **Grouping**: Group elements by a specified key.
- **Distinct**: Get unique elements based on a key.
- **Zipping**: Combine two collections into one.
- **Appending**: Add elements from one collection to another.
- **String Conversion**: Represent tables as strings for easy inspection.

### Advantages ✅
- **Simplicity**: Manipulate Lua tables with expressive and concise syntax.
- **Power**: Perform complex operations on data collections.
- **Flexibility**: Suitable for tables of any dimension.

### Usage 🚀

#### Creating a Linq Collection
To create a new Linq collection, use the `Linq` class with a data table.
```lua
local myCollection = Linq({1, 2, 3, 4, 5})
```

#### Filtering Data
To filter elements in a collection, use the `where` method.
```lua
local evenNumbers = myCollection:where(function(x) return x % 2 == 0 end)
```

#### Projecting Data
To transform elements in a collection, use the `select` method.
```lua
local squaredNumbers = myCollection:select(function(x) return x * x end)
```

#### Sorting Data
To sort elements in a collection, use the `orderBy` method.
```lua
local sortedNumbers = myCollection:orderBy(function(x) return -x end)
```

#### Manipulating Multi-dimensional Tables
##### Example with a 2D Table
```lua
local matrix2D = Linq({
    {1, 2},
    {3, 4},
    {5, 6}
})

-- Filter rows where the sum of elements is greater than 5
local filteredRows = matrix2D:where(function(row)
    return row[1] + row[2] > 5
end)

-- Project to get the first column
local firstColumn = matrix2D:select(function(row)
    return row[1]
end)
```
##### Example with a 3D Table
```lua
local matrix3D = Linq({
    {{1, 2}, {3, 4}},
    {{5, 6}, {7, 8}},
    {{9, 10}, {11, 12}}
})

-- Filter matrices where the first element of the first sub-table is odd
local filteredMatrices = matrix3D:where(function(matrix)
    return matrix[1][1] % 2 ~= 0
end)

-- Project to get elements of the second sub-table
local secondSubTables = matrix3D:select(function(matrix)
    return matrix[2]
end)
```

#### Aggregating Data
##### Sum Example
To compute the sum of elements in a collection, use the `sum` method.
```lua
local totalSum = myCollection:sum(function(x) return x end)
```
##### Average Example
To compute the average of elements in a collection, use the `average` method.
```lua
local averageValue = myCollection:average(function(x) return x end)
```
##### Maximum Example
To find the maximum value of elements in a collection, use the `max` method.
```lua
local maxValue = myCollection:max(function(x) return x end)
```
##### Minimum Example
To find the minimum value of elements in a collection, use the `min` method.
```lua
local minValue = myCollection:min(function(x) return x end)
```

#### Grouping Data
To group elements in a collection by a specified key, use the `groupBy` method.
```lua
local groupedByModulo = myCollection:groupBy(function(x) return x % 2 end)
```

#### Distinct Elements
To get unique elements in a collection, use the `distinct` method.
```lua
local distinctValues = Linq({1, 2, 2, 3, 4, 4, 5}):distinct(function(x) return x end)
```

#### Zipping Collections
To combine two collections into one, use the `zip` method.
```lua
local list1 = Linq({1, 2, 3})
local list2 = Linq({"a", "b", "c"})
local zipped = list1:zip(list2:toList(), function(x, y) return {x, y} end)
```

#### Appending Elements
To add elements from one collection to another, use the `append` method.
```lua
local appended = list1:append(list2:toList())
```

#### Converting to List
To convert a Linq collection to a normal Lua list, use the `toList` method.
```lua
local list = myCollection:toList()
```

#### Converting to String
To get a string representation of a Linq collection, use the `toString` method.
```lua
local stringRepresentation = myCollection:toString()
```

#### Contribution 🤝
Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.