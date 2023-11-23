# Intro
- Pytest is used for automated testing of python code.

# Types of Test available
1. Function based tests
2. Class based Tests
3. Fixtures


## Fuction based test.
- We already have python function defined.
- Create a test function and the use asset to validate the output of the function.

```python
import pytest
import basics.functions_1 as num_func


def test_add():
    result = num_func.addnum(1, 3)
    assert result == 4
```
we can also do handle error when we execpt function to raise some type of error like ValueError or ZeroDivisionError.

```python

def divnum(number_one, number_two):
    if number_two == 0:
        raise ValueError
    return number_one / number_two

def test_divide_by_zero():
    with pytest.raises(ValueError):
        num_func.divnum(1,0)
````

## Class based tests
- used for testing python class
- can be done in two ways
    1. create a object for the class within the test function (conventional way)
    2. use setup and teardown method.

## Conventional way
- create a test class and  create object for the class to be tested
- and test fucntion also

```python
class TestCircle:

    def test_area(self):
        a1= shapes.Circle(5)
        result= round(a1.area(),2)
        assert result == 78.54
```

## Setup and Teardown method.
- Setup method is used to create objects for class to be tested and teardown is used to clean up objects after testing.
- When there are multiple test function for a class, setup will be called before every test function and teardown after execution of every test function.
- This helps to avoid repitation of object creation code in every test function.

```python
class TestCircle:

    def setup_method(self, method):
        print(f'setting up {method}')
        self.circle = shapes.Circle(10)

    def teardown_method(self, method):
        print(f'tearing down {method}')
        del self.circle

    def test_area(self):
        assert self.circle.area() == pi* self.circle.radius ** 2

    def test_perimeter(self):
        assert self.circle.perimeter() == 2 * pi*self.circle.radius

```


## Fixtures
- Alternative to setup method we can use decorator fixture to create the class
- once clas is defined can be used within the test function

```python
import pytest

from basics import shapes

@pytest.fixture
def my_rectangle():
    return shapes.Rectangle(10, 20)


@pytest.fixture
def new_rectangle():
    return shapes.Rectangle(5, 10)
```
- the decorated function can also be placed in conftest.py file within test package and can be used within the package 


# Marker

- if some function is expected to take more time to produce an output, we can mark them as slow function and run them seperately.
``` python
@pytest.mark.slow
def test_div():
    time.sleep(4)
    result = num_func.divnum(10, 5)
    assert result == 2

pytest -m slow # only function that is marked as slow will run

```

- @pytest.mark.skip - to skip some testing function
- @pytest.mark.xfail - when we expect particular function to fail
- output summary will contain  3 passed, 1 skipped, 1 xfailed, indicating our markers

# Parameterized testing

- Suppose we want test a function for multiple input values, instead of writing a seperate function for each, we can use same function with mulitple input
- while looping is possible, we can use parametrization for better readability.

```python

@pytest.mark.parametrize('side_length, expected_area', [(5, 25), (4, 16), (2, 4)])
def test_multiple_square(side_length,expected_area):
    assert shapes.Square(side_length).area() == expected_area
```
