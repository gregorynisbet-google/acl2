#include <stdbool.h>

// Following function CMPs two values and returns the flags in the ah register

unsigned char cmp_two_longs_return_ah(long x, long y) {
    unsigned char ah;

    __asm__ volatile (
        "movq %1, %%rax;"      // rax = x
        "movq %2, %%rbx;"      // rbx = y
        "cmpq %%rbx, %%rax;"   // rax += rbx
        "lahf;"                // load flags into AH
        "movb %%ah, %0;"       // move AH to output variable
        : "=r" (ah)            // output
        : "r" (x), "r" (y)     // inputs
        : "%rax", "%rbx", "%ah"// clobbered registers
    );

    return ah;
}




//check property for PF
//PF is bit 2 in ah
// Filter to extract PF is: 0000 0100=0x04

bool test_long_cmp_PF () {
  
   
    unsigned char flags = cmp_two_longs_return_ah(5, 2);

   
      return ((flags & 0x04)==0x04);
    

    
}




// dummy main function, to allow us to link the executable
int main () { return 0;}
