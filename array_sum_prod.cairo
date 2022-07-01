%builtins output

from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.serialize import serialize_word

# Computes the sum of all array entries.
func array_sum(arr : felt*, size) -> (sum : felt):
    if size == 0:
        return (sum=0)
    end

    let (sum_of_rest) = array_sum(arr=arr + 1, size=size - 1)
    return (sum=[arr] + sum_of_rest)
end

# Computes the product of the even array entries.
func array_prod(arr : felt*, size) -> (prod : felt):
    if size == 0:
        return (prod=1)
    end

    let (prod_of_rest) = array_prod(arr=arr + 2, size=size - 2)
    return (prod=[arr] * prod_of_rest)
end

func main{output_ptr : felt*}():
    const SUM_ARRAY_SIZE = 3
    const PROD_ARRAY_SIZE = 4

    # Allocate an array.
    let (ptr_arr) = alloc()

    # Populate some values in the array.
    assert [ptr_arr] = 9
    assert [ptr_arr + 1] = 16
    assert [ptr_arr + 2] = 25
    assert [ptr_arr + 3] = 32

    # TODO: (Un)comment.
    # Call `array_sum` to compute the sum of the array entries.
    # let (res) = array_sum(arr=ptr_arr, size=SUM_ARRAY_SIZE)

    # TODO: (Un)comment.
    # Call `array_prod` to compute the product of the even array entries.
    let (res) = array_prod(arr=ptr_arr, size=PROD_ARRAY_SIZE)

    # Write the result to the program output.
    serialize_word(res)

    return ()
end
