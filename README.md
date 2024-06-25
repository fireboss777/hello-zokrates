### Hello Zokrates

https://zokrates.github.io/gettingstarted.html#hello-zokrates

First, create the text-file root.zok and implement your program. In this example, we will prove knowledge of the square root a of a number b:
```
def main(private field a, field b) {
    assert(a * a == b);
    return;
}
```

Some observations:

- The keyword `field` is the basic type we use, which is an element of a given prime field.
- The keyword `private` signals that we do not want to reveal this input, but still prove that we know its value.

Then run the different phases of the protocol:
```
# compile
zokrates compile -i root.zok
# perform the setup phase
zokrates setup
# execute the program
zokrates compute-witness -a 337 113569
# generate a proof of computation
zokrates generate-proof
# export a solidity verifier
zokrates export-verifier
# or verify natively
zokrates verify
```





