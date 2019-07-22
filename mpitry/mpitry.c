#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <mpi.h>

int main(int argc, char **argv) {
  int r;
  r = MPI_Init(&argc, &argv);

  MPI_Finalize();
}
