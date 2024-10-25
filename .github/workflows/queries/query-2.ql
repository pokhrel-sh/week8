import javascript

// find all public methods that are called by tests
predicate isTest(Function test) {
  exists(CallExpr call |
    call.getCallee().getName() = test.getName() and
    call.getAncestor*() = test
  )
}

// find all public methods that are not called by any test
predicate isPublicMethod(Function f) {
  f.isPublic() and
  not exists(Function test | isTest(test) and test.getName() = f.getName())
}

predicate isExportedFunction(Function f) {
  exists(Module m | m.getAnExportedValue(_).getAFunctionValue().getFunction() = f) and
  not f.inExternsFile()
}

from Function f
where isPublicMethod(f) and isExportedFunction(f)
select f, "is a public method that is not called by any test"
