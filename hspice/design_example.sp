* netlist for basic gm/id design example

* device models
.include ./models/ee214_hspice.sp

vdd vdd 0 1.8
vic vic 0 1
vid vid 0 ac 1
x1 vid vic vip vim balun 
x2 vod voc vop vom balun 
rdum vod 0 1gig
it  t 0 600u

m1 vop vgp t 0  nmos214  w=18.6u l=0.18u
m2 vom vgm t 0  nmos214  w=18.6u l=0.18u
rsp vip vgp 10k
rsm vim vgm 10k
rlp vop vdd 1k
rlm vom vdd 1k
clp vop 0 50f
clm vom 0 50f

.op
.ac dec 100 1e6 1000e9

.pz v(vod) vid
.option post brief accurate nomod

.end
