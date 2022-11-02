
.PHONY: build
build: links
	make -C openpgm
	make -C raikv
	make -C libdecnumber
	make -C raimd
	make -C linecook
	make -C lzf
	make -C rdbparser
	make -C h3
	make -C raist
	make -C HdrHistogram_c
	make -C sassrv
	make -C raids
	make -C capr
	make -C natsmd
	make -C natsrv
	make -C raims
#	make -C raipgm
#	make -C aeron
#	make -C aekv
#	make -C aerv

.PHONY: install_rpm_deps
install_rpm_deps:
	sudo yum install -y gcc-c++ chrpath pcre2-devel openssl-devel git-core liblzf-devel systemd c-ares-devel

.PHONY: sync
sync: links
	rsync -auv --exclude='.*.sw*' --exclude='FC*' openpgm/	      ${SYNC_DIR}/openpgm
	rsync -auv --exclude='.*.sw*' --exclude='FC*' pcre2/	      ${SYNC_DIR}/pcre2
	rsync -auv --exclude='.*.sw*' --exclude='FC*' raikv/	      ${SYNC_DIR}/raikv
	rsync -auv --exclude='.*.sw*' --exclude='FC*' libdecnumber/   ${SYNC_DIR}/libdecnumber
	rsync -auv --exclude='.*.sw*' --exclude='FC*' raimd/	      ${SYNC_DIR}/raimd
	rsync -auv --exclude='.*.sw*' --exclude='FC*' linecook/	      ${SYNC_DIR}/linecook
	rsync -auv --exclude='.*.sw*' --exclude='FC*' lzf/            ${SYNC_DIR}/lzf
	rsync -auv --exclude='.*.sw*' --exclude='FC*' rdbparser/      ${SYNC_DIR}/rdbparser
	rsync -auv --exclude='.*.sw*' --exclude='FC*' h3/             ${SYNC_DIR}/h3
	rsync -auv --exclude='.*.sw*' --exclude='FC*' raist/          ${SYNC_DIR}/raist
	rsync -auv --exclude='.*.sw*' --exclude='FC*' HdrHistogram_c/ ${SYNC_DIR}/HdrHistogram_c
	rsync -auv --exclude='.*.sw*' --exclude='FC*' sassrv/         ${SYNC_DIR}/sassrv
	rsync -auv --exclude='.*.sw*' --exclude='FC*' raids/          ${SYNC_DIR}/raids
	rsync -auv --exclude='.*.sw*' --exclude='FC*' capr/           ${SYNC_DIR}/capr
	rsync -auv --exclude='.*.sw*' --exclude='FC*' natsmd/         ${SYNC_DIR}/natsmd
	rsync -auv --exclude='.*.sw*' --exclude='FC*' natsrv/         ${SYNC_DIR}/natsrv
	rsync -auv --exclude='.*.sw*' --exclude='FC*' benchmark/      ${SYNC_DIR}/benchmark
	rsync -auv --exclude='.*.sw*' --exclude='FC*' raims/          ${SYNC_DIR}/raims
#	rsync -auv --exclude='.*.sw*' raipgm/         ${SYNC_DIR}/raipgm
#	rsync -auv --exclude='.*.sw*' aeron/          ${SYNC_DIR}/aeron
#	rsync -auv --exclude='.*.sw*' aekv/           ${SYNC_DIR}/aekv
#	rsync -auv --exclude='.*.sw*' aerv/           ${SYNC_DIR}/aerv
.PHONY: sync_src
sync_src: links
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
	git clone https://github.com/raitechnology/raikv
	git clone https://github.com/raitechnology/libdecnumber
	git clone https://github.com/raitechnology/raimd
	git clone https://github.com/injinj/linecook
	git clone https://github.com/injinj/lzf
	git clone https://github.com/injinj/rdbparser
	git clone https://github.com/raitechnology/h3
	git clone https://github.com/raitechnology/raist
	git clone -b rai https://github.com/raitechnology/HdrHistogram_c
	git clone https://github.com/raitechnology/sassrv
	git clone https://github.com/raitechnology/raids
	git clone https://github.com/raitechnology/capr
	git clone https://github.com/raitechnology/natsmd
	git clone https://github.com/raitechnology/natsrv
	git clone https://github.com/google/benchmark
	git clone https://github.com/raitechnology/raims

#	git clone https://github.com/raitechnology/raipgm
#	git clone -b rai https://github.com/raitechnology/aeron
#	git clone https://github.com/raitechnology/aekv
#	git clone https://github.com/raitechnology/aerv
.PHONY: push
push: dirs
	(cd openpgm && git push origin)
	(cd raikv && git push origin)
	(cd libdecnumber && git push origin)
	(cd raimd && git push origin)
	(cd linecook && git push origin)
	(cd lzf && git push origin)
	(cd rdbparser && git push origin)
	(cd h3 && git push origin)
	(cd raist && git push origin)
	(cd HdrHistogram_c && git push origin)
	(cd sassrv && git push origin)
	(cd raids && git push origin)
	(cd capr && git push origin)
	(cd natsmd && git push origin)
	(cd natsrv && git push origin)
	(cd raims && git push origin)

#	(cd raipgm && git push origin)
#	(cd aeron && git push origin)
#	(cd aekv && git push origin)
#	(cd aerv && git push origin)
.PHONY: pull
pull: dirs
	(cd openpgm && git pull origin)
	(cd pcre2 && git pull origin)
	(cd raikv && git pull origin)
	(cd libdecnumber && git pull origin)
	(cd raimd && git pull origin)
	(cd linecook && git pull origin)
	(cd lzf && git pull origin)
	(cd rdbparser && git pull origin)
	(cd h3 && git pull origin)
	(cd raist && git pull origin)
	(cd HdrHistogram_c && git pull origin)
	(cd sassrv && git pull origin)
	(cd raids && git pull origin)
	(cd capr && git pull origin)
	(cd natsmd && git pull origin)
	(cd natsrv && git pull origin)
	(cd raims && git pull origin)

#	(cd raipgm && git pull origin)
#	(cd aeron && git pull origin)
#	(cd aekv && git pull origin)
#	(cd aerv && git pull origin)
.PHONY: status
status: dirs
	@if [ -n "`cd openpgm && git status --porcelain`" ] ; then echo "---> openpgm <---"; cd openpgm && git status ; fi
	@if [ -n "`cd raikv && git status --porcelain`" ] ; then echo "---> raikv <---"; cd raikv && git status ; fi
	@if [ -n "`cd libdecnumber && git status --porcelain`" ] ; then echo "---> libdecnumber <---"; cd libdecnumber && git status ; fi
	@if [ -n "`cd raimd && git status --porcelain`" ] ; then echo "---> raimd <---"; cd raimd && git status ; fi
	@if [ -n "`cd linecook && git status --porcelain`" ] ; then echo "---> linecook <---"; cd linecook && git status ; fi
	@if [ -n "`cd lzf && git status --porcelain`" ] ; then echo "---> lzf <---"; cd lzf && git status ; fi
	@if [ -n "`cd rdbparser && git status --porcelain`" ] ; then echo "---> rdbparser <---"; cd rdbparser && git status ; fi
	@if [ -n "`cd h3 && git status --porcelain`" ] ; then echo "---> h3 <---"; cd h3 && git status ; fi
	@if [ -n "`cd raist && git status --porcelain`" ] ; then echo "---> raist <---"; cd raist && git status ; fi
	@if [ -n "`cd HdrHistogram_c && git status --porcelain`" ] ; then echo "---> HdrHistogram_c <---"; cd HdrHistogram_c && git status ; fi
	@if [ -n "`cd sassrv && git status --porcelain`" ] ; then echo "---> sassrv <---"; cd sassrv && git status ; fi
	@if [ -n "`cd raids && git status --porcelain`" ] ; then echo "---> raids <---"; cd raids && git status ; fi
	@if [ -n "`cd capr && git status --porcelain`" ] ; then echo "---> capr <---"; cd capr && git status ; fi
	@if [ -n "`cd natsmd && git status --porcelain`" ] ; then echo "---> natsmd <---"; cd natsmd && git status ; fi
	@if [ -n "`cd natsrv && git status --porcelain`" ] ; then echo "---> natsrv <---"; cd natsrv && git status ; fi
	@if [ -n "`cd raims && git status --porcelain`" ] ; then echo "---> raims <---"; cd raims && git status ; fi

#	@if [ -n "`cd raipgm && git status --porcelain`" ] ; then echo "---> raipgm <---"; cd raipgm && git status ; fi
#	@if [ -n "`cd aeron && git status --porcelain`" ] ; then echo "---> aeron <---"; cd aeron && git status ; fi
#	@if [ -n "`cd aekv && git status --porcelain`" ] ; then echo "---> aekv <---"; cd aekv && git status ; fi
#	@if [ -n "`cd aerv && git status --porcelain`" ] ; then echo "---> aerv <---"; cd aerv && git status ; fi
.PHONY: update_submodules
update_submodules: dirs
	(cd capr && git update-index --cacheinfo 160000 `cd ../raikv && git rev-parse HEAD` raikv)
	(cd capr && git update-index --cacheinfo 160000 `cd ../raimd && git rev-parse HEAD` raimd)
	(cd natsmd && git update-index --cacheinfo 160000 `cd ../raikv && git rev-parse HEAD` raikv)
	(cd natsmd && git update-index --cacheinfo 160000 `cd ../raimd && git rev-parse HEAD` raimd)
	(cd natsrv && git update-index --cacheinfo 160000 `cd ../sassrv && git rev-parse HEAD` sassrv)
	(cd natsrv && git update-index --cacheinfo 160000 `cd ../natsmd && git rev-parse HEAD` natsmd)
	(cd raids && git update-index --cacheinfo 160000 `cd ../raikv && git rev-parse HEAD` raikv)
	(cd raids && git update-index --cacheinfo 160000 `cd ../h3 && git rev-parse HEAD` h3)
	(cd raids && git update-index --cacheinfo 160000 `cd ../linecook && git rev-parse HEAD` linecook)
	(cd raids && git update-index --cacheinfo 160000 `cd ../raimd && git rev-parse HEAD` raimd)
	(cd raids && git update-index --cacheinfo 160000 `cd ../rdbparser && git rev-parse HEAD` rdbparser)
	(cd raimd && git update-index --cacheinfo 160000 `cd ../libdecnumber && git rev-parse HEAD` libdecnumber)
	(cd raist && git update-index --cacheinfo 160000 `cd ../raimd && git rev-parse HEAD` raimd)
	(cd raist && git update-index --cacheinfo 160000 `cd ../raikv && git rev-parse HEAD` raikv)
	(cd sassrv && git update-index --cacheinfo 160000 `cd ../raikv && git rev-parse HEAD` raikv)
	(cd sassrv && git update-index --cacheinfo 160000 `cd ../raimd && git rev-parse HEAD` raimd)
	(cd raims && git update-index --cacheinfo 160000 `cd ../raikv && git rev-parse HEAD` raikv)
	(cd raims && git update-index --cacheinfo 160000 `cd ../raimd && git rev-parse HEAD` raimd)
	(cd raims && git update-index --cacheinfo 160000 `cd ../raids && git rev-parse HEAD` raids)
	(cd raims && git update-index --cacheinfo 160000 `cd ../linecook && git rev-parse HEAD` linecook)
	(cd raims && git update-index --cacheinfo 160000 `cd ../openpgm && git rev-parse rai` openpgm)
	(cd raims && git update-index --cacheinfo 160000 `cd ../sassrv && git rev-parse HEAD` sassrv)
	(cd raims && git update-index --cacheinfo 160000 `cd ../natsmd && git rev-parse HEAD` natsmd)

#	(cd raipgm && git update-index --cacheinfo 160000 `cd ../openpgm && git rev-parse rai` openpgm)
#	(cd raipgm && git update-index --cacheinfo 160000 `cd ../HdrHistogram_c && git rev-parse rai` HdrHistogram_c)
#	(cd aeron && git update-index --cacheinfo 160000 `cd ../HdrHistogram_c && git rev-parse rai` HdrHistogram_c)
#	(cd aerv && git update-index --cacheinfo 160000 `cd ../sassrv && git rev-parse HEAD` sassrv)
#	(cd aerv && git update-index --cacheinfo 160000 `cd ../aekv && git rev-parse HEAD` aekv)
.PHONY: bump
bump: dirs
	if [ -n "`cd openpgm && git status --porcelain`" ] ; then sh ./script/bump.sh openpgm/.copr/Makefile build_num ; fi
	if [ -n "`cd raikv && git status --porcelain`" ] ; then sh ./script/bump.sh raikv/.copr/Makefile build_num ; fi
	if [ -n "`cd libdecnumber && git status --porcelain`" ] ; then sh ./script/bump.sh libdecnumber/.copr/Makefile build_num ; fi
	if [ -n "`cd raimd && git status --porcelain`" ] ; then sh ./script/bump.sh raimd/.copr/Makefile build_num ; fi
	if [ -n "`cd linecook && git status --porcelain`" ] ; then sh ./script/bump.sh linecook/.copr/Makefile build_num ; fi
	if [ -n "`cd lzf && git status --porcelain`" ] ; then sh ./script/bump.sh lzf/.copr/Makefile build_num ; fi
	if [ -n "`cd rdbparser && git status --porcelain`" ] ; then sh ./script/bump.sh rdbparser/.copr/Makefile build_num ; fi
	if [ -n "`cd h3 && git status --porcelain`" ] ; then sh ./script/bump.sh h3/.copr/Makefile build_num ; fi
	if [ -n "`cd raist && git status --porcelain`" ] ; then sh ./script/bump.sh raist/.copr/Makefile build_num ; fi
	if [ -n "`cd sassrv && git status --porcelain`" ] ; then sh ./script/bump.sh sassrv/.copr/Makefile build_num ; fi
	if [ -n "`cd raids && git status --porcelain`" ] ; then sh ./script/bump.sh raids/.copr/Makefile build_num ; fi
	if [ -n "`cd capr && git status --porcelain`" ] ; then sh ./script/bump.sh capr/.copr/Makefile build_num ; fi
	if [ -n "`cd natsmd && git status --porcelain`" ] ; then sh ./script/bump.sh natsmd/.copr/Makefile build_num ; fi
	if [ -n "`cd natsrv && git status --porcelain`" ] ; then sh ./script/bump.sh natsrv/.copr/Makefile build_num ; fi
	if [ -n "`cd raims && git status --porcelain`" ] ; then sh ./script/bump.sh raims/.copr/Makefile build_num ; fi

#	if [ -n "`cd raipgm && git status --porcelain`" ] ; then sh ./script/bump.sh raipgm/.copr/Makefile build_num ; fi
#	if [ -n "`cd aeron && git status --porcelain`" ] ; then sh ./script/bump.sh aeron/.copr/Makefile build_num ; fi
#	if [ -n "`cd aekv && git status --porcelain`" ] ; then sh ./script/bump.sh aekv/.copr/Makefile build_num ; fi
#	if [ -n "`cd aerv && git status --porcelain`" ] ; then sh ./script/bump.sh aerv/.copr/Makefile build_num ; fi
.PHONY: commit
commit: dirs
	if [ -n "`cd openpgm && git status --porcelain`" ] ; then cd openpgm && git commit -a ${MSG} ; fi
	if [ -n "`cd raikv && git status --porcelain`" ] ; then cd raikv && git commit -a ${MSG} ; fi
	if [ -n "`cd libdecnumber && git status --porcelain`" ] ; then cd libdecnumber && git commit -a ${MSG} ; fi
	if [ -n "`cd raimd && git status --porcelain`" ] ; then cd raimd && git commit -a ${MSG} ; fi
	if [ -n "`cd linecook && git status --porcelain`" ] ; then cd linecook && git commit -a ${MSG} ; fi
	if [ -n "`cd lzf && git status --porcelain`" ] ; then cd lzf && git commit -a ${MSG} ; fi
	if [ -n "`cd rdbparser && git status --porcelain`" ] ; then cd rdbparser && git commit -a ${MSG} ; fi
	if [ -n "`cd h3 && git status --porcelain`" ] ; then cd h3 && git commit -a ${MSG} ; fi
	if [ -n "`cd raist && git status --porcelain`" ] ; then cd raist && git commit -a ${MSG} ; fi
	if [ -n "`cd HdrHistogram_c && git status --porcelain`" ] ; then cd HdrHistogram_c && git commit -a ${MSG} ; fi
	if [ -n "`cd sassrv && git status --porcelain`" ] ; then cd sassrv && git commit -a ${MSG} ; fi
	if [ -n "`cd raids && git status --porcelain`" ] ; then cd raids && git commit -a ${MSG} ; fi
	if [ -n "`cd capr && git status --porcelain`" ] ; then cd capr && git commit -a ${MSG} ; fi
	if [ -n "`cd natsmd && git status --porcelain`" ] ; then cd natsmd && git commit -a ${MSG} ; fi
	if [ -n "`cd natsrv && git status --porcelain`" ] ; then cd natsrv && git commit -a ${MSG} ; fi
	if [ -n "`cd raims && git status --porcelain`" ] ; then cd raims && git commit -a ${MSG} ; fi

#	if [ -n "`cd raipgm && git status --porcelain`" ] ; then cd raipgm && git commit -a ${MSG} ; fi
#	if [ -n "`cd aeron && git status --porcelain`" ] ; then cd aeron && git commit -a ${MSG} ; fi
#	if [ -n "`cd aekv && git status --porcelain`" ] ; then cd aekv && git commit -a ${MSG} ; fi
#	if [ -n "`cd aerv && git status --porcelain`" ] ; then cd aerv && git commit -a ${MSG} ; fi

.PHONY: clean
clean: dirs
	rm -r -f openpgm
	rm -r -f pcre2
	rm -r -f raikv
	rm -r -f libdecnumber
	rm -r -f raimd
	rm -r -f linecook
	rm -r -f lzf
	rm -r -f rdbparser
	rm -r -f h3
	rm -r -f raist
	rm -r -f HdrHistogram_c
	rm -r -f sassrv
	rm -r -f raids
	rm -r -f capr
	rm -r -f natsmd
	rm -r -f natsrv
	rm -r -f benchmark
	rm -r -f raims

#	rm -r -f raipgm
#	rm -r -f aeron
#	rm -r -f aekv
#	rm -r -f aerv

.PHONY: cmake
cmake: links
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
	mkdir -p capr/build
	(cd capr/build && cmake .. && cmake --build .)
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

links:
	rm -d -f raikv/pcre2
	ln -s -f ../pcre2 raikv/pcre2
	rm -d -f capr/raikv
	ln -s -f ../raikv capr/raikv
	rm -d -f capr/raimd
	ln -s -f ../raimd capr/raimd
	rm -d -f capr/pcre2
	ln -s -f ../pcre2 capr/pcre2
	rm -d -f HdrHistogram_c/test/vendor/google/benchmark
	ln -s -f ../../../../benchmark HdrHistogram_c/test/vendor/google/benchmark
	rm -d -f natsmd/raikv
	ln -s -f ../raikv natsmd/raikv
	rm -d -f natsmd/raimd
	ln -s -f ../raimd natsmd/raimd
	rm -d -f natsmd/HdrHistogram_c
	ln -s -f ../HdrHistogram_c natsmd/HdrHistogram_c
	rm -d -f natsmd/pcre2
	ln -s -f ../pcre2 natsmd/pcre2
	rm -d -f natsrv/sassrv
	ln -s -f ../sassrv natsrv/sassrv
	rm -d -f natsrv/natsmd
	ln -s -f ../natsmd natsrv/natsmd
	rm -d -f natsrv/HdrHistogram_c
	ln -s -f ../HdrHistogram_c natsrv/HdrHistogram_c
	rm -d -f raids/raikv
	ln -s -f ../raikv raids/raikv
	rm -d -f raids/h3
	ln -s -f ../h3 raids/h3
	rm -d -f raids/linecook
	ln -s -f ../linecook raids/linecook
	rm -d -f raids/raimd
	ln -s -f ../raimd raids/raimd
	rm -d -f raids/rdbparser
	ln -s -f ../rdbparser raids/rdbparser
	rm -d -f raids/pcre2
	ln -s -f ../pcre2 raids/pcre2
	rm -d -f raimd/libdecnumber
	ln -s -f ../libdecnumber raimd/libdecnumber
	rm -d -f raist/raikv
	ln -s -f ../raikv raist/raikv
	rm -d -f raist/raimd
	ln -s -f ../raimd raist/raimd
	rm -d -f sassrv/raikv
	ln -s -f ../raikv sassrv/raikv
	rm -d -f sassrv/raimd
	ln -s -f ../raimd sassrv/raimd
	rm -d -f sassrv/pcre2
	ln -s -f ../pcre2 sassrv/pcre2
	rm -d -f raims/raikv
	ln -s -f ../raikv raims/raikv
	rm -d -f raims/raimd
	ln -s -f ../raimd raims/raimd
	rm -d -f raims/raids
	ln -s -f ../raids raims/raids
	rm -d -f raims/linecook
	ln -s -f ../linecook raims/linecook
	rm -d -f raims/openpgm
	ln -s -f ../openpgm raims/openpgm
	rm -d -f raims/sassrv
	ln -s -f ../sassrv raims/sassrv
	rm -d -f raims/natsmd
	ln -s -f ../natsmd raims/natsmd
	rm -d -f raims/pcre2
	ln -s -f ../pcre2 raims/pcre2
	rm -d -f rdbparser/lzf
	ln -s -f ../lzf rdbparser/lzf
	rm -d -f rdbparser/pcre2
	ln -s -f ../pcre2 rdbparser/pcre2
	rm -d -f linecook/pcre2
	ln -s -f ../pcre2 linecook/pcre2
	rm -f dirs
	touch links

#	rmdir raipgm/openpgm
#	ln -s -f ../openpgm raipgm/openpgm
#	rmdir raipgm/HdrHistogram_c
#	ln -s -f ../HdrHistogram_c raipgm/HdrHistogram_c
#	rmdir aekv/raikv
#	ln -s -f ../raikv aekv/raikv
#	rmdir aekv/aeron
#	ln -s -f ../aeron aekv/aeron
#	rmdir aeron/HdrHistogram_c
#	ln -s -f ../HdrHistogram_c aeron/HdrHistogram_c
#	rmdir aerv/sassrv
#	ln -s -f ../sassrv aerv/sassrv
#	rmdir aerv/aekv
#	ln -s -f ../aekv aerv/aekv
dirs:
	rm -f -d raikv/pcre2
	mkdir raikv/pcre2
	rm -f -d capr/raikv
	mkdir capr/raikv
	rm -f -d capr/raimd
	mkdir capr/raimd
	rm -f -d capr/pcre2
	mkdir capr/pcre2
	rm -f -d HdrHistogram_c/test/vendor/google/benchmark
	mkdir HdrHistogram_c/test/vendor/google/benchmark
	rm -f -d natsmd/raikv
	mkdir natsmd/raikv
	rm -f -d natsmd/raimd
	mkdir natsmd/raimd
	rm -f -d natsmd/HdrHistogram_c
	mkdir natsmd/HdrHistogram_c
	rm -f -d natsmd/pcre2
	mkdir natsmd/pcre2
	rm -f -d natsrv/natsmd
	mkdir natsrv/natsmd
	rm -f -d natsrv/sassrv
	mkdir natsrv/sassrv
	rm -f -d natsrv/HdrHistogram_c
	mkdir natsrv/HdrHistogram_c
	rm -f -d raids/raikv
	mkdir raids/raikv
	rm -f -d raids/h3
	mkdir raids/h3
	rm -f -d raids/linecook
	mkdir raids/linecook
	rm -f -d raids/raimd
	mkdir raids/raimd
	rm -f -d raids/rdbparser
	mkdir raids/rdbparser
	rm -f -d raids/pcre2
	mkdir raids/pcre2
	rm -f -d raimd/libdecnumber
	mkdir raimd/libdecnumber
	rm -f -d raist/raimd
	mkdir raist/raimd
	rm -f -d raist/raikv
	mkdir raist/raikv
	rm -f -d sassrv/raikv
	mkdir sassrv/raikv
	rm -f -d sassrv/raimd
	mkdir sassrv/raimd
	rm -f -d sassrv/pcre2
	mkdir sassrv/pcre2
	rm -f -d raims/raimd
	mkdir raims/raimd
	rm -f -d raims/raikv
	mkdir raims/raikv
	rm -f -d raims/raids
	mkdir raims/raids
	rm -f -d raims/linecook
	mkdir raims/linecook
	rm -f -d raims/openpgm
	mkdir raims/openpgm
	rm -f -d raims/sassrv
	mkdir raims/sassrv
	rm -f -d raims/natsmd
	mkdir raims/natsmd
	rm -f -d raims/pcre2
	mkdir raims/pcre2
	rm -f -d rdbparser/lzf
	mkdir rdbparser/lzf
	rm -f -d rdbparser/pcre2
	mkdir rdbparser/pcre2
	rm -f -d linecook/pcre2
	mkdir linecook/pcre2
	rm -f -d links
	touch dirs

#	rm -f -d raipgm/openpgm
#	mkdir raipgm/openpgm
#	rm -f -d raipgm/HdrHistogram_c
#	mkdir raipgm/HdrHistogram_c
#	rm -f -d aekv/raikv
#	mkdir aekv/raikv
#	rm -f -d aekv/aeron
#	mkdir aekv/aeron
#	rm -f -d aeron/HdrHistogram_c
#	mkdir aeron/HdrHistogram_c
#	rm -f -d aerv/sassrv
#	mkdir aerv/sassrv
#	rm -f -d aerv/aekv
#	mkdir aerv/aekv
doc/index.html: doc/index.adoc
	asciidoctor -b html5 doc/index.adoc
#@	a2x -f xhtml doc/index.adoc

doc/protocol.html: doc/protocol.adoc
	asciidoctor -b html5 doc/protocol.adoc
#@	a2x -f xhtml doc/protocol.adoc

#copr-cli build-package gold --name openpgm
#copr-cli build-package gold --name aeron
#copr-cli build-package gold --name aekv
#copr-cli build-package gold --name aerv
#copr-cli build-package gold --name capr
#copr-cli build-package gold --name raipgm
.PHONY: packages
packages:
	copr-cli build-package gold --name raikv
	copr-cli build-package gold --name libdecnumber
	copr-cli build-package gold --name raimd
	copr-cli build-package gold --name linecook
	copr-cli build-package gold --name rdbparser
	copr-cli build-package gold --name h3
	copr-cli build-package gold --name raist
	copr-cli build-package gold --name hdrhist
	copr-cli build-package gold --name sassrv
	copr-cli build-package gold --name raids
	copr-cli build-package gold --name natsmd
	copr-cli build-package gold --name natsrv
	copr-cli build-package gold --name raims
