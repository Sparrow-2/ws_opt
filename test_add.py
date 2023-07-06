'''
Test for checking if my class works properly
Functions :
        test_1 -> two small ints
        test_2 -> two floats commonly known to cause some problems with addition due to floating point representation in computers (used build-in pytest approx function to get a proper result)
        test_3 -> small int value and a big int value
        test_4 -> two big ints
        test_5 and test_6 -> big int value and zero
        test_7 -> two zeros
        test_8 -> two floats
        commented test_9 -> two small ints with wrong value in assert to check if it catches that, (yes it does, thats why it is commented)
'''
import numclass
import pytest
def test_1():
    a = numclass.numClass(7,7)
    assert 14 == a.f_add()
def test_2(): 
    a = numclass.numClass(0.1,0.2) 
    assert 0.3 == pytest.approx(a.f_add())

def test_3():
    a = numclass.numClass(10**17,7)
    assert 10**17+7 == a.f_add()

def test_4():
    a = numclass.numClass(10**7,10**7)
    assert 2*10**7 == a.f_add()

def test_5():
    a = numclass.numClass(10**7,0)
    assert 10**7 == a.f_add()

def test_6():
    a = numclass.numClass(0,10**7)
    assert 10**7 == a.f_add()
def test_7():
    a = numclass.numClass(0,0)
    assert 0 == a.f_add()


def test_8():
    a = numclass.numClass(0.5,0.5)
    assert 1== a.f_add()


'''def test_9():
    a = numclass.numClass(1,2)
    assert 4 == a.f_add()'''

