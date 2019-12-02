Object subclass: #Complex
    instanceVariableNames: 'realpart imagpart'
    classVariableNames: ''
    poolDictionaries: ''
new 
    ^ self error: 'use real:imaginary'
new: aComplex
    ^ (super new) copy: aComplex
real: r imaginary: i 
    ^ (super new) setReal: r setImaginary: i

setReal: r setImaginary: i
    realpart := r
    imagpart := i
real
    ^ realpart
imaginary
    ^ imagpart
mod
    ^ sqrt (realpart * realpart) + (imagpart * imagpart)
modsq
    ^ (mod self) * (mod self)
+ val
    ^ Complex real: realpart + val real imaginary: imagpart + val imaginary
- val
    ^ Complex self + val negated
* val
    ^ Complex real: (realpart * val real) - (imagpart * val imaginary) imaginary: (realpart * val imaginary) + (imagpart * val real)
/ val   
    ^ Complex real: ((realpart * val real) + (imagpart * val imaginary)) / modsq val imaginary: - ((realpart * val imaginary) - (imagpart * val real)) / modsq
negated
    ^ Complex real: realpart negated imaginary: imagpart negated
= val
    ^ (realpart = val real) & (imagpart = val imaginary)
~= val
    ^ (realpart ~= val real) | (imagpart ~= val imaginary)
< val   
    ^ self shouldNotImplement

comp1 := Complex new real: 1 imaginary: 1
comp2 := Complex new real: 1 imaginary: 1

comp1 + comp2