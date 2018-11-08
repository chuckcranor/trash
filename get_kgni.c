#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define KGNIMAPSZ (512*1024*1024)
#define KGNIFILE "/dev/kgni0\n"     /* add \n for fgets */

struct kgnimap {
    void *mapping[2];
};

/*
 * get_kgni: extract 2 512 MiB mappings of /dev/kgni0 from /proc/$$/maps
 */
int get_kgni(struct kgnimap *kgm) {
    char src[64], line[256], *p, *e;
    long start, end;
    int hit;
    FILE *fp;

    snprintf(src, sizeof(src), "/proc/%d/maps", getpid());
    hit = -1;
    if ((fp = fopen(src, "r")) < 0) {
        perror("open map");
        return(-1);
    }

    while (fgets(line, sizeof(line), fp)) {
        p = strrchr(line, ' ');
        if (!p) continue;
        p++;
        if (strcmp(KGNIFILE, p) != 0) continue;
        p = strchr(line, '-');
        if (!p) continue;
        *p++ = 0;
        e = p;
        p = strchr(p, ' ');
        if (!p) continue;
        *p++ = 0;
        start = strtol(line, NULL, 16);
        end = strtol(e, NULL, 16);
        if (end - start != KGNIMAPSZ) continue;

        if (hit < 1)
            kgm->mapping[++hit] = (void *)start;
       
        printf("get_kgni: found mapping: start=%lx, end=%lx\n", start, end);
    }

    fclose(fp);
    return(hit == 1);
}


main(int argc, char **argv) {
  struct kgnimap k;
  if (get_kgni(&k)) {
    printf("Got it\n");
  } else {
    printf("Nope\n");
  }
  exit(0);
}
