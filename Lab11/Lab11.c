#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <wiringPi.h>
#define BUTTON_PIN 0


volatile int eventCout = 0;
void myInterrupt (void){
    eventCout++;
}
int main (void){
    if(wiringPiSetup() < 0){
        printf("Cannot setup wiringPi: %s\n", strerror(errno));
        return 1;
    }
    if (wiringPiISR (BUTTON_PIN, INT_EDGE_FALLING, &myInterrupt) < 0){
        printf("cannot setup ISR: %s\n", strerror(errno));
        return 2;
    }
    while(1){
        printf("%d\n", eventCout);
        eventCout = 0;
        delay(1000);
    }
    return 0;
}