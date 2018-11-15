/**
 * @name Some variables are bad
 * @description Variables are bad if they are called filename. Don't ask me why
 * @id variable-bad
 * @kind problem
 */

import javascript

from Variable v, TopLevel tl
where v.getName() = "filename" and v.declaredIn(tl)
select v, "v, defined at file $@, is bad!!", tl.getFile(), tl.getFile().getBaseName()
