import UIKit

// MARK: - Task 1
func isEven(_ number: Int) -> Bool {
    if number % 2 == 0 {
       return true
    }
    return false
}

print(isEven(8))


// MARK: - Task 2
func divide3(_ number: Int) -> Bool {
    if number % 3 == 0 {
        return true
    }
    return false
}

print(divide3(8))


// MARK: - Task 3
var myArray = [Int]()
for i in 1...100 {
    myArray.append(i)
}


// MARK: - Task 4
var lastIndexArray = myArray.count - 1

while lastIndexArray >= 0 {
    let value = myArray[lastIndexArray]
    
    if divide3(value) || isEven(value) {
        myArray.remove(at: lastIndexArray)
    }
    lastIndexArray -= 1
}

print(myArray)


// MARK: - Task 5
func fibonachy(arr: inout Array<Int>) {
    if arr.count == 0 {
        arr.append(0)
    } else if arr.count == 1 {
        arr.append(arr[0] + 1)
    } else {
        arr.append(arr[arr.count-2] + arr[arr.count-1])
    }
}

var arrayFib = [Int]()

for _ in 1...50 {
    fibonachy(arr: &arrayFib)
}

print(arrayFib)


// MARK: - Task 6
func sieve(_ resultArray: inout Array<Int>, lastIndex: Int) -> Int {
    /*
    Функция реализует решето Эратосфена для отбора простых чисел
     и возвращает количество найденных
    */
    for i in 2...lastIndex where i * i <= lastIndex {
        if resultArray[i] == 1 {
            var j = i * i
            while j <= lastIndex {
                resultArray[j] = 0
                j += i
            }
        }
    }
    
    return resultArray.filter({ $0 == 1}).count
}

func simpleNumber(_ n: Int) -> [Int] {
    /*
     Функция принимает количество элементов в массиве
     для простых чисел. Выбирает из заданного диапазона простые числа
     и если их не хватила для заданной размерности массива увеличивате диапазон в 2 раза и
     "просеивает" дальше до заполнения массива.
     Возвращает массив заданной размерности
     */
    var iterArray = [Int]()
    var resultArray = [Int]()
    
    for _ in 1...n {
        iterArray.append(1)
    }
    //0 и 1 не простое число - отсеиваем
    iterArray[0] = 0
    iterArray[1] = 0
    
    var countSimple = sieve(&iterArray, lastIndex: iterArray.count - 1)
    
    while countSimple < n {
        for _ in n...n * 2 {
            iterArray.append(1)
        }
        countSimple = sieve(&iterArray, lastIndex: iterArray.count - 1)
    }
    
    for i in 1...iterArray.count - 1 {
        if resultArray.count == n {
            break
        }
        
        if iterArray[i] == 1 {
            resultArray.append(i)
        }
    }
    
    return resultArray
}

var res = simpleNumber(100)

print(res)


