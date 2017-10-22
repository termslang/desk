# TERMS developer desk    (for Mac OS X)
#### Setup process:


```sh
$ brew install node
$ brew install yarn
$ yarn start
```

> Open localhost:3000 in browser
> Enjoy!
>
>
> How does the language work?
> It compiles to assembly according to the latest revision found in Terms directory.
> It also generates contract abi according to the language rules. From assembly, it compiles directly into bytecode.
> The output panel (on the right) will give you strings to be inserted into geth.
>
> What are Terms language revisions?
> They are simply a list of macros used to compose a smart contract.
> Here is a sample Terms revision file:

| Revision | Link |
| ------ | ------ |
| 20171019 | [/terms.20171019.txt] [PlDb] |
| 20171019 | [plugins/dropbox/README.md] [PlDb] |
| Github | [plugins/github/README.md] [PlGh] |
| Google Drive | [plugins/googledrive/README.md] [PlGd] |
| OneDrive | [plugins/onedrive/README.md] [PlOd] |
| Medium | [plugins/medium/README.md] [PlMe] |
| Google Analytics | [plugins/googleanalytics/README.md] [PlGa] |


> What does a revision file contain?
> 1) ">>" strings to determine EVM constants like CALLER, GAS etc.
> In the language, they are used as, for example to get CALLER instruction, you put into macros CALLER CONSTANT
> EVM constants can be put into macros replacing ^1, ^2, ^3 etc operands.
> As well as EVM constants, there can be put:
> - decimal numbers
> - hex numbers
> - variables
> Variables are all global it Terms language, free typed and need no declaration.
> Variables are all initialized as 0.
> Variables need to start with capital letter, can consist of 1 or more words divided by whitespaces.
> - arrays
> Arrays are represented as variable names with '#' character inside. Array subscript goes right after the '#' character.
> All arrays have dynamical size
>
> Some macros are made to work with strings. Those accept zero element of string array.
> For string (and array) #0 element, there is alias "SEQUENCE", i.e.  NAME #0  equals to NAME SEQUENCE.
