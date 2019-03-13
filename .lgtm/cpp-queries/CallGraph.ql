/**
 * @name Call graph
 * @description Find call-graphs path between source function and
 *              destination function.
 * @kind path-problem
 * @problem.severity warning
 * @id cpp/callgraph-thanks-kev
 */

import cpp

predicate edges_internal(FunctionCall c1, FunctionCall c2) {
  c1.getTarget() = c2.getEnclosingFunction()
}

predicate isSource(FunctionCall call) {
  call.getEnclosingFunction().getName() = "main" // Customize source function here
}

predicate isSink(FunctionCall call) {
  call.getTarget().getName() = "printf" // Customize destination function here
}

query predicate edges(FunctionCall c1, FunctionCall c2) {
  exists(FunctionCall source | isSource(source) and edges_internal*(source, c1)) and
  exists(FunctionCall sink | isSink(sink) and edges_internal*(c2, sink)) and
  edges_internal(c1, c2)
}

FunctionCall calls(FunctionCall call, int depth) {
  result = call and depth = 0
  or
  exists(FunctionCall mid |
    edges_internal(mid, result) and
    mid = calls(call, depth - 1) and
    depth < 5 // Customize max call depth here
  )
}

from FunctionCall c1, FunctionCall c2, int depth
where
  isSource(c1) and
  isSink(c2) and
  c2 = calls(c1, depth)
select c1, c1, c2, "depth = " + depth + " " + c1.getFile().getShortName()