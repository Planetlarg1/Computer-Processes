load FSEQ.hdl,
output-file FSEQ.out,
compare-to FSEQ.cmp,
output-list f1%B3.1.3 f0%B3.1.3 A%B3.1.3 B%B3.1.3 C%B3.1.3 D%B3.1.3 E%B3.1.3 F%B3.1.3 G%B3.1.3;



set load 1,
set f1 1,
set f0 1,
set A 1,
set B 0,
set C 1,
set D 1,
tick,
tock,

output;


set load 0,
set f1 0,
set f0 0,

tick,
tock,

output;

set f1 1,
set f0 1,

tick,
tock,

output;

