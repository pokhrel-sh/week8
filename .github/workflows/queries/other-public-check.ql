import javascript

/**
* find all public methods that are called by tests
*/
/**
 * Checks for public functions
 */
predicate isPublic(Function func) {
  exists(ExportedFunction export | 
    export = func
  ) or exists(GlobalFunction global | 
    global = func
  )
}

from Function test, Function callee
where isTest(test) and
      calls+(test, callee) and
      isPublic(callee)
select callee, "is transitively called by a test and is public"