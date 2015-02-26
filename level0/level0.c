#include <stdio.h>
int main(void) {
    char i[1024];
    while(scanf("%1024[^ \n]", i)){
        printf("You've written: %s \n", i);
    }
    printf("you have finished writing\n");

    return 0;
}
