/**
 * @description Find functions directly called by tests
 * @kind problem
 * @id javascript/functions-directly-called-by-tests
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is a test.
 */
predicate isLongerThan10(Function test) {
  test.getNumLines() > 10
}

from Function funct
where isLongerThan10(funct)
select funct, "is longer than 10 lines"