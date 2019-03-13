#include <stdio.h>
#include <stdlib.h>

void bar(char* s) {
    printf("Thank you for giving me '%s'\n", s);
}

void foo(char* s) {
    bar(s);
}

void usage(int argc, char* self) {
    printf("Error: Wrong number of arguments (%d)\n", argc - 1);
    printf("Usage: %s <string>\n", self);
}

int main(int argc, char* argv[]) {

    if (argc != 2) {
        usage(argc, argv[0]);
        exit(1);
    }

    foo(argv[1]);

    return 0;
}
