
.PHONY: build
build:
	make -C openpgm
	make -C raikv
	make -C libdecnumber
	make -C raimd
	make -C linecook
	make -C lzf
	make -C rdbparser
	make -C h3
	make -C HdrHistogram_c
	make -C sassrv
	make -C raids
	make -C natsmd
	make -C omm
	make -C raims
#	make -C fmp

.PHONY: install_rpm_deps
install_rpm_deps:
	sudo yum install -y gcc-c++ chrpath pcre2-devel openssl-devel git-core liblzf-devel systemd c-ares-devel zlib-devel rpm-build

.PHONY: sync
sync:
	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' openpgm/	      ${SYNC_DIR}/openpgm
	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' pcre2/	      ${SYNC_DIR}/pcre2
	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' raikv/	      ${SYNC_DIR}/raikv
	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' libdecnumber/   ${SYNC_DIR}/libdecnumber
	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' raimd/	      ${SYNC_DIR}/raimd
	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' linecook/	      ${SYNC_DIR}/linecook
	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' lzf/            ${SYNC_DIR}/lzf
	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' rdbparser/      ${SYNC_DIR}/rdbparser
	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' h3/             ${SYNC_DIR}/h3
	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' HdrHistogram_c/ ${SYNC_DIR}/HdrHistogram_c
	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' sassrv/         ${SYNC_DIR}/sassrv
	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' raids/          ${SYNC_DIR}/raids
	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' natsmd/         ${SYNC_DIR}/natsmd
	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' benchmark/      ${SYNC_DIR}/benchmark
	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' raims/          ${SYNC_DIR}/raims
	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' omm/            ${SYNC_DIR}/omm
#	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' rvcount/        ${SYNC_DIR}/rvcount
#	rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' fmp/            ${SYNC_DIR}/fmp
.PHONY: sync_src
sync_src:
	rsync -auv --exclude='.*.sw*' raikv/src/      ${SYNC_DIR}/raikv/src
	rsync -auv --exclude='.*.sw*' raikv/test/     ${SYNC_DIR}/raikv/test
	rsync -auv --exclude='.*.sw*' raikv/include/  ${SYNC_DIR}/raikv/include
	rsync -auv --exclude='.*.sw*' raikv/.copr/    ${SYNC_DIR}/raikv/.copr
	rsync -auv --exclude='.*.sw*' raimd/src/      ${SYNC_DIR}/raimd/src
	rsync -auv --exclude='.*.sw*' raimd/test/     ${SYNC_DIR}/raimd/test
	rsync -auv --exclude='.*.sw*' raimd/include/  ${SYNC_DIR}/raimd/include
	rsync -auv --exclude='.*.sw*' raimd/.copr/    ${SYNC_DIR}/raimd/.copr
	rsync -auv --exclude='.*.sw*' sassrv/src/     ${SYNC_DIR}/sassrv/src
	rsync -auv --exclude='.*.sw*' sassrv/include/ ${SYNC_DIR}/sassrv/include
	rsync -auv --exclude='.*.sw*' sassrv/.copr/   ${SYNC_DIR}/sassrv/.copr
	rsync -auv --exclude='.*.sw*' raids/src/      ${SYNC_DIR}/raids/src
	rsync -auv --exclude='.*.sw*' raids/test/     ${SYNC_DIR}/raids/test
	rsync -auv --exclude='.*.sw*' raids/include/  ${SYNC_DIR}/raids/include
	rsync -auv --exclude='.*.sw*' raids/.copr/    ${SYNC_DIR}/raids/.copr
	rsync -auv --exclude='.*.sw*' natsmd/src/     ${SYNC_DIR}/natsmd/src
	rsync -auv --exclude='.*.sw*' natsmd/test/    ${SYNC_DIR}/natsmd/test
	rsync -auv --exclude='.*.sw*' natsmd/include/ ${SYNC_DIR}/natsmd/include
	rsync -auv --exclude='.*.sw*' natsmd/.copr/   ${SYNC_DIR}/natsmd/.copr
	rsync -auv --exclude='.*.sw*' raims/src/      ${SYNC_DIR}/raims/src
	rsync -auv --exclude='.*.sw*' raims/test/     ${SYNC_DIR}/raims/test
	rsync -auv --exclude='.*.sw*' raims/include/  ${SYNC_DIR}/raims/include
	rsync -auv --exclude='.*.sw*' raims/web/      ${SYNC_DIR}/raims/web
	rsync -auv --exclude='.*.sw*' raims/.copr/    ${SYNC_DIR}/raims/.copr
.PHONY: clone
clone:
	git clone -b rai https://github.com/raitechnology/openpgm
	git clone https://github.com/PhilipHazel/pcre2
	git clone https://github.com/injinj/raikv
	git clone https://github.com/raitechnology/libdecnumber
	git clone https://github.com/injinj/raimd
	git clone https://github.com/injinj/linecook
	git clone https://github.com/injinj/lzf
	git clone https://github.com/injinj/rdbparser
	git clone https://github.com/raitechnology/h3
	git clone -b rai https://github.com/raitechnology/HdrHistogram_c
	git clone https://github.com/injinj/sassrv
	git clone https://github.com/injinj/raids
	git clone https://github.com/injinj/natsmd
	git clone https://github.com/google/benchmark
	git clone https://github.com/injinj/raims
	git clone https://github.com/injinj/omm
#	git clone https://github.com/injinj/fmp

.PHONY: push
push:
	(cd openpgm && git push origin)
	(cd raikv && git push origin)
	(cd libdecnumber && git push origin)
	(cd raimd && git push origin)
	(cd linecook && git push origin)
	(cd lzf && git push origin)
	(cd rdbparser && git push origin)
	(cd h3 && git push origin)
	(cd HdrHistogram_c && git push origin)
	(cd sassrv && git push origin)
	(cd raids && git push origin)
	(cd natsmd && git push origin)
	(cd raims && git push origin)
	(cd omm && git push origin)

.PHONY: pull
pull:
	(cd openpgm && git pull origin)
	(cd pcre2 && git pull origin)
	(cd raikv && git pull origin)
	(cd libdecnumber && git pull origin)
	(cd raimd && git pull origin)
	(cd linecook && git pull origin)
	(cd lzf && git pull origin)
	(cd rdbparser && git pull origin)
	(cd h3 && git pull origin)
	(cd HdrHistogram_c && git pull origin)
	(cd sassrv && git pull origin)
	(cd raids && git pull origin)
	(cd natsmd && git pull origin)
	(cd raims && git pull origin)
	(cd omm && git pull origin)

.PHONY: status
status:
	@if [ -n "`cd openpgm && git status --porcelain`" ] ; then echo "---> openpgm <---"; cd openpgm && git status ; fi
	@if [ -n "`cd raikv && git status --porcelain`" ] ; then echo "---> raikv <---"; cd raikv && git status ; fi
	@if [ -n "`cd libdecnumber && git status --porcelain`" ] ; then echo "---> libdecnumber <---"; cd libdecnumber && git status ; fi
	@if [ -n "`cd raimd && git status --porcelain`" ] ; then echo "---> raimd <---"; cd raimd && git status ; fi
	@if [ -n "`cd linecook && git status --porcelain`" ] ; then echo "---> linecook <---"; cd linecook && git status ; fi
	@if [ -n "`cd lzf && git status --porcelain`" ] ; then echo "---> lzf <---"; cd lzf && git status ; fi
	@if [ -n "`cd rdbparser && git status --porcelain`" ] ; then echo "---> rdbparser <---"; cd rdbparser && git status ; fi
	@if [ -n "`cd h3 && git status --porcelain`" ] ; then echo "---> h3 <---"; cd h3 && git status ; fi
	@if [ -n "`cd HdrHistogram_c && git status --porcelain`" ] ; then echo "---> HdrHistogram_c <---"; cd HdrHistogram_c && git status ; fi
	@if [ -n "`cd sassrv && git status --porcelain`" ] ; then echo "---> sassrv <---"; cd sassrv && git status ; fi
	@if [ -n "`cd raids && git status --porcelain`" ] ; then echo "---> raids <---"; cd raids && git status ; fi
	@if [ -n "`cd natsmd && git status --porcelain`" ] ; then echo "---> natsmd <---"; cd natsmd && git status ; fi
	@if [ -n "`cd raims && git status --porcelain`" ] ; then echo "---> raims <---"; cd raims && git status ; fi
	@if [ -n "`cd omm && git status --porcelain`" ] ; then echo "---> omm <---"; cd omm && git status ; fi

.PHONY: status2
status2:
	@echo "---> openpgm <---"; cd openpgm && git status --branch
	@echo "---> raikv <---"; cd raikv && git status --branch
	@echo "---> libdecnumber <---"; cd libdecnumber && git status --branch
	@echo "---> raimd <---"; cd raimd && git status --branch
	@echo "---> linecook <---"; cd linecook && git status --branch
	@echo "---> lzf <---"; cd lzf && git status --branch
	@echo "---> rdbparser <---"; cd rdbparser && git status --branch
	@echo "---> h3 <---"; cd h3 && git status --branch
	@echo "---> HdrHistogram_c <---"; cd HdrHistogram_c && git status --branch
	@echo "---> sassrv <---"; cd sassrv && git status --branch
	@echo "---> raids <---"; cd raids && git status --branch
	@echo "---> natsmd <---"; cd natsmd && git status --branch
	@echo "---> raims <---"; cd raims && git status --branch
	@echo "---> omm <---"; cd raims && git status --branch

.PHONY: update_submodules
update_submodules:
	(cd natsmd && git update-index --cacheinfo 160000 `cd ../raikv && git rev-parse HEAD` raikv)
	(cd natsmd && git update-index --cacheinfo 160000 `cd ../raimd && git rev-parse HEAD` raimd)
	(cd raids && git update-index --cacheinfo 160000 `cd ../raikv && git rev-parse HEAD` raikv)
	(cd raids && git update-index --cacheinfo 160000 `cd ../h3 && git rev-parse HEAD` h3)
	(cd raids && git update-index --cacheinfo 160000 `cd ../linecook && git rev-parse HEAD` linecook)
	(cd raids && git update-index --cacheinfo 160000 `cd ../raimd && git rev-parse HEAD` raimd)
	(cd raids && git update-index --cacheinfo 160000 `cd ../rdbparser && git rev-parse HEAD` rdbparser)
	(cd raimd && git update-index --cacheinfo 160000 `cd ../libdecnumber && git rev-parse HEAD` libdecnumber)
	(cd sassrv && git update-index --cacheinfo 160000 `cd ../raikv && git rev-parse HEAD` raikv)
	(cd sassrv && git update-index --cacheinfo 160000 `cd ../raimd && git rev-parse HEAD` raimd)
	(cd raims && git update-index --cacheinfo 160000 `cd ../raikv && git rev-parse HEAD` raikv)
	(cd raims && git update-index --cacheinfo 160000 `cd ../raimd && git rev-parse HEAD` raimd)
	(cd raims && git update-index --cacheinfo 160000 `cd ../raids && git rev-parse HEAD` raids)
	(cd raims && git update-index --cacheinfo 160000 `cd ../linecook && git rev-parse HEAD` linecook)
	(cd raims && git update-index --cacheinfo 160000 `cd ../openpgm && git rev-parse rai` openpgm)
	(cd raims && git update-index --cacheinfo 160000 `cd ../sassrv && git rev-parse HEAD` sassrv)
	(cd raims && git update-index --cacheinfo 160000 `cd ../natsmd && git rev-parse HEAD` natsmd)
	(cd omm && git update-index --cacheinfo 160000 `cd ../raikv && git rev-parse HEAD` raikv)
	(cd omm && git update-index --cacheinfo 160000 `cd ../raimd && git rev-parse HEAD` raimd)
	(cd omm && git update-index --cacheinfo 160000 `cd ../sassrv && git rev-parse HEAD` sassrv)

.PHONY: commit
commit:
	if [ -n "`cd openpgm && git status --porcelain`" ] ; then cd openpgm && git commit -a ${MSG} ; fi
	if [ -n "`cd raikv && git status --porcelain`" ] ; then cd raikv && git commit -a ${MSG} ; fi
	if [ -n "`cd libdecnumber && git status --porcelain`" ] ; then cd libdecnumber && git commit -a ${MSG} ; fi
	if [ -n "`cd raimd && git status --porcelain`" ] ; then cd raimd && git commit -a ${MSG} ; fi
	if [ -n "`cd linecook && git status --porcelain`" ] ; then cd linecook && git commit -a ${MSG} ; fi
	if [ -n "`cd lzf && git status --porcelain`" ] ; then cd lzf && git commit -a ${MSG} ; fi
	if [ -n "`cd rdbparser && git status --porcelain`" ] ; then cd rdbparser && git commit -a ${MSG} ; fi
	if [ -n "`cd h3 && git status --porcelain`" ] ; then cd h3 && git commit -a ${MSG} ; fi
	if [ -n "`cd HdrHistogram_c && git status --porcelain`" ] ; then cd HdrHistogram_c && git commit -a ${MSG} ; fi
	if [ -n "`cd sassrv && git status --porcelain`" ] ; then cd sassrv && git commit -a ${MSG} ; fi
	if [ -n "`cd raids && git status --porcelain`" ] ; then cd raids && git commit -a ${MSG} ; fi
	if [ -n "`cd natsmd && git status --porcelain`" ] ; then cd natsmd && git commit -a ${MSG} ; fi
	if [ -n "`cd raims && git status --porcelain`" ] ; then cd raims && git commit -a ${MSG} ; fi

.PHONY: clean
clean:
	rm -r -f openpgm
	rm -r -f pcre2
	rm -r -f raikv
	rm -r -f libdecnumber
	rm -r -f raimd
	rm -r -f linecook
	rm -r -f lzf
	rm -r -f rdbparser
	rm -r -f h3
	rm -r -f HdrHistogram_c
	rm -r -f sassrv
	rm -r -f raids
	rm -r -f natsmd
	rm -r -f benchmark
	rm -r -f raims

.PHONY: cmake
cmake:
	mkdir -p pcre2/build
	(cd pcre2/build && cmake .. -DPCRE2_BUILD_PCRE2_32=ON && cmake --build .)
	mkdir -p libdecnumber/build
	(cd libdecnumber/build && cmake .. && cmake --build .)
	mkdir -p raimd/build
	(cd raimd/build && cmake .. && cmake --build .)
	mkdir -p raikv/build
	(cd raikv/build && cmake .. && cmake --build .)
	mkdir -p sassrv/build
	(cd sassrv/build && cmake .. && cmake --build .)
	mkdir -p natsmd/build
	(cd natsmd/build && cmake .. && cmake --build .)
	mkdir -p lzf/build
	(cd lzf/build && cmake .. && cmake --build .)
	mkdir -p rdbparser/build
	(cd rdbparser/build && cmake .. && cmake --build .)
	mkdir -p linecook/build
	(cd linecook/build && cmake .. && cmake --build .)
	mkdir -p openpgm/build
	(cd openpgm/build && cmake .. && cmake --build .)
	mkdir -p h3/build
	(cd h3/build && cmake .. && cmake --build .)

doc/index.html: doc/index.adoc
	asciidoctor -b html5 doc/index.adoc
#@	a2x -f xhtml doc/index.adoc

doc/protocol.html: doc/protocol.adoc
	asciidoctor -b html5 doc/protocol.adoc
#@	a2x -f xhtml doc/protocol.adoc

all_pkgs = raikv libdecnumber linecook rdbparser h3 HdrHistogram_c openpgm \
           raimd raids natsmd sassrv omm raims
pwd      = $(shell pwd)

.PHONY: src_rpm
src_rpm:
	mkdir -p src_rpm
	for pkg in $(all_pkgs) ; do \
	make -C $(pwd)/$$pkg 'outdir=../src_rpm' srpm ; \
	done

all_build_src_rpms = $(wildcard src_rpm/raikv*.src.rpm) \
                     $(wildcard src_rpm/libdecnumber*.src.rpm) \
                     $(wildcard src_rpm/linecook*.src.rpm) \
                     $(wildcard src_rpm/rdbparser*.src.rpm) \
                     $(wildcard src_rpm/h3*.src.rpm) \
                     $(wildcard src_rpm/hdrhist*.src.rpm) \
                     $(wildcard src_rpm/openpgm_st*.src.rpm) \
                     $(wildcard src_rpm/raimd*.src.rpm) \
                     $(wildcard src_rpm/sassrv*.src.rpm) \
                     $(wildcard src_rpm/natsmd*.src.rpm) \
                     $(wildcard src_rpm/raids*.src.rpm) \
                     $(wildcard src_rpm/omm*.src.rpm) \
                     $(wildcard src_rpm/raims*.src.rpm)
all_dists = epel-7-x86_64 centos-stream+epel-8-x86_64 \
            centos-stream+epel-9-x86_64 fedora-37-x86_64 \
	    fedora-38-x86_64 fedora-39-x86_64
#all_dists = rocky+epel-8-x86_64 rocky+epel-9-x86_64
.PHONY: rpm_build
rpm_build: src_rpm
	mkdir -p rpm_build
	for dist in $(all_dists) ; do \
	mock -r $$dist --localrepo rpm_build --chain $(all_build_src_rpms) ; \
	done
