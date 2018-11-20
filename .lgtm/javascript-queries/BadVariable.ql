/**
 * @name Some variables are bad
 * @description Variables are bad if they are called filename. Don't ask me why
 * @id variable-bad
 * @kind problem
 */

import javascript

from VarDecl d, Variable v, TopLevel tl
where v.getADeclaration() = d and v.getName() = "filename" and v.declaredIn(tl)
select d, "this variable defined at file $@, is bad!!", tl.getFile(), tl.getFile().getBaseName()
