# Build scripts

Typical usage patterns.

Clone the repos and build all the binaries.  This causes the repos to be built
and linked without regard to the submodules.

```console
$ git clone https://github.com/raitechnology/build
$ cd build
$ make install_rpm_deps
$ make clone
$ make
```

Checkout branches and make changes, update .copr/Makefile versions.  Update the
dependencies.

```console
$ make update_build_depends
```

Commit and push, make status prints what is what.

```console
$ make status
                repo [    branch  ]: changed | untrack | unpushd
             openpgm [       rai  ]:       0 |       0 |       0
               raikv [ build_134  ]:       0 |       0 |       0
        libdecnumber [    master  ]:       0 |       0 |       0
               raimd [  build_58  ]:       0 |       0 |       0
            linecook [    master  ]:       0 |       0 |       0
                 lzf [    master  ]:       0 |       0 |       0
           rdbparser [    master  ]:       0 |       0 |       0
                  h3 [    master  ]:       0 |       0 |       0
      HdrHistogram_c [       rai  ]:       0 |       0 |       0
              sassrv [  build_87  ]:       0 |       0 |       0
               raids [ build_102  ]:       0 |       0 |       0
              natsmd [  build_72  ]:       0 |       0 |       0
                 omm [  build_26  ]:       0 |       0 |       0
               raims [ build_113  ]:       0 |       0 |       0
             rvcache [   build_8  ]:       0 |       0 |       0
            raimdapi [   build_5  ]:       0 |       0 |       0
                ossl [   build_2  ]:       0 |       0 |       0
```
