#include <mruby.h>
#include <mruby/irep.h>
#include <iostream>
#include "hello_world.c"

int main() {
  mrb_state* mrb = mrb_open();
  if (!mrb) {
    std::cerr << "could not open mrb" << std::endl;
    return -1;
  }
  mrb_load_irep(mrb, sample);
  mrb_close(mrb);
}
