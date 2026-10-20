
repos = openpgm raikv libdecnumber raimd linecook lzf rdbparser h3 HdrHistogram_c sassrv raids natsmd omm raims rvcache raimdapi ossl

.PHONY: build
build:
	for i in $(repos) ; do make -j 4 -C $$i ; done

.PHONY: install_rpm_deps
install_rpm_deps:
	sudo yum install -y gcc-c++ chrpath pcre2-devel openssl-devel git-core git-extras liblzf-devel systemd c-ares-devel zlib-devel rpm-build

.PHONY: sync
sync:
	for i in $(repos) ; do rsync -auv --exclude='.*.sw*' --exclude='RH*' --exclude='FC*' --exclude='DE*' --exclude='RO*' $$i/ ${SYNC_DIR}/$$i ; done

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
	git clone -b rai https://github.com/raitechnology/HdrHistogram_c
	git clone https://github.com/raitechnology/sassrv
	git clone https://github.com/raitechnology/raids
	git clone https://github.com/raitechnology/natsmd
	git clone https://github.com/raitechnology/raims
	git clone https://github.com/raitechnology/omm
	git clone https://github.com/raitechnology/rvcache
	git clone https://github.com/raitechnology/raimdapi
	git clone https://github.com/raitechnology/ossl

.PHONY: status
status:
	@for dir in $(repos); do \
		branch=$$(git -C "$$dir" symbolic-ref --quiet --short HEAD \
			|| git -C "$$dir" rev-parse --short HEAD) || exit 1; \
		unpushed=$$(git -C "$$dir" rev-list --count HEAD \
			--not --remotes=origin) || exit 1; \
		git -C "$$dir" status --porcelain=v1 -uall | awk \
			-v repo="$$dir" -v branch="$$branch" -v unpushed="$$unpushed" \
			'/^\?\?/ { untracked++; next } \
			 { changed++ } \
			 END { printf "%s %16s [%10s  ]: %d changed, %d untracked, %d unpushed\n", \
			              (changed || untracked || unpushed ? ">" : " "), \
			              repo, branch, changed, untracked, unpushed }'; \
	done

.PHONY: update_build_depends
update_build_depends: d/raimd.dep d/raikv.dep d/h3.dep d/linecook.dep d/rdbparser.dep d/libdecnumber.dep d/openpgm.dep d/sassrv.dep d/natsmd.dep d/raids.dep d/omm.dep d/raims.dep d/hdrhist.dep d/rvcache.dep d/raimdapi.dep d/ossl.dep
	@cat d/raimd.dep d/raikv.dep d/libdecnumber.dep d/hdrhist.dep > natsmd/build_depends.mak
	@cat d/raikv.dep d/h3.dep d/linecook.dep d/raimd.dep d/rdbparser.dep d/libdecnumber.dep > raids/build_depends.mak
	@cat d/libdecnumber.dep > raimd/build_depends.mak
	@cat d/raikv.dep d/raimd.dep d/libdecnumber.dep > sassrv/build_depends.mak
	@cat d/openpgm.dep d/sassrv.dep d/natsmd.dep d/raids.dep d/raikv.dep d/h3.dep d/linecook.dep d/raimd.dep d/rdbparser.dep d/libdecnumber.dep > raims/build_depends.mak
	@cat d/sassrv.dep d/raikv.dep d/raimd.dep d/libdecnumber.dep > omm/build_depends.mak
	@cat d/sassrv.dep d/raikv.dep d/raimd.dep d/libdecnumber.dep d/omm.dep > rvcache/build_depends.mak
	@cat d/sassrv.dep d/raikv.dep d/raimd.dep d/libdecnumber.dep d/omm.dep > raimdapi/build_depends.mak
	@cat d/raikv.dep d/raimd.dep d/libdecnumber.dep d/omm.dep > ossl/build_depends.mak

d/raimd.dep: raimd/.copr/Makefile
	make -s -C raimd spec_version > $@
d/raikv.dep: raikv/.copr/Makefile
	make -s -C raikv spec_version > $@
d/h3.dep: h3/.copr/Makefile
	make -s -C h3 spec_version > $@
d/linecook.dep: linecook/.copr/Makefile
	make -s -C linecook spec_version > $@
d/rdbparser.dep: rdbparser/.copr/Makefile
	make -s -C rdbparser spec_version > $@
d/libdecnumber.dep: libdecnumber/.copr/Makefile
	make -s -C libdecnumber spec_version > $@
d/openpgm.dep: openpgm/.copr/Makefile
	make -s -C openpgm spec_version > $@
d/sassrv.dep: sassrv/.copr/Makefile
	make -s -C sassrv spec_version > $@
d/natsmd.dep: natsmd/.copr/Makefile
	make -s -C natsmd spec_version > $@
d/raids.dep: raids/.copr/Makefile
	make -s -C raids spec_version > $@
d/omm.dep: omm/.copr/Makefile
	make -s -C omm spec_version > $@
d/raims.dep: raims/.copr/Makefile
	make -s -C raims spec_version > $@
d/hdrhist.dep: HdrHistogram_c/.copr/Makefile
	make -s -C HdrHistogram_c spec_version > $@
d/rvcache.dep: rvcache/.copr/Makefile
	make -s -C rvcache spec_version > $@
d/raimdapi.dep: raimdapi/.copr/Makefile
	make -s -C raimdapi spec_version > $@
d/ossl.dep: ossl/.copr/Makefile
	make -s -C ossl spec_version > $@

doc/index.html: doc/index.adoc
	asciidoctor -b html5 doc/index.adoc
