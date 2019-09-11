#include <stdio.h>
#include <stdlib.h>

void bar(char* s) {
    printf("Thank you for giving me '%s'\n", s);
}

void foo(char* s) {
    bar(s);
}
;
        exit(1);
    }

    foo(argv[1]);

    return 0;
}
