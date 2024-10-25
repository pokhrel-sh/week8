import javascript

// find functions that are longer than 10 lines (hint: you can call getNumLines() on any AST node to get their length)
predicate isLongFunction(Function f) {
  f.getNumLines() > 10
}

// find tests that call a function called "pressActionKey" (hint: you can call getName() on a Function node to get its name, if it has one)
predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}

from Function f
where isLongFunction(f) and
      not isTest(f)
select f, "is a long function that is not called by a test"
