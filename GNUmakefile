
.PHONY: build
build: links
	make -C raikv
	make -C libdecnumber
	make -C raimd
	make -C linecook
	make -C rdbparser
	make -C h3
	make -C raist
	make -C HdrHistogram_c
	make -C aeron
	make -C aekv
	make -C sassrv
	make -C aerv
	make -C raids
	make -C capr
	make -C natsmd

.PHONY: clone
clone:
	git clone https://github.com/raitechnology/raikv
	git clone https://github.com/raitechnology/libdecnumber
	git clone https://github.com/raitechnology/raimd
	git clone https://github.com/injinj/linecook
	git clone https://github.com/injinj/rdbparser
	git clone https://github.com/raitechnology/h3
	git clone https://github.com/raitechnology/raist
	git clone -b rai https://github.com/raitechnology/HdrHistogram_c
	git clone -b rai https://github.com/raitechnology/aeron
	git clone https://github.com/raitechnology/aekv
	git clone https://github.com/raitechnology/sassrv
	git clone https://github.com/raitechnology/aerv
	git clone https://github.com/raitechnology/raids
	git clone https://github.com/raitechnology/capr
	git clone https://github.com/raitechnology/natsmd
	git clone https://github.com/google/benchmark

.PHONY: push
push: dirs
	git -C raikv push origin
	git -C libdecnumber push origin
	git -C raimd push origin
	git -C linecook push origin
	git -C rdbparser push origin
	git -C h3 push origin
	git -C raist push origin
	git -C aeron push origin
	git -C aekv push origin
	git -C sassrv push origin
	git -C aerv push origin
	git -C raids push origin
	git -C capr push origin
	git -C natsmd push origin

.PHONY: pull
pull: dirs
	git -C raikv pull origin
	git -C libdecnumber pull origin
	git -C raimd pull origin
	git -C linecook pull origin
	git -C rdbparser pull origin
	git -C h3 pull origin
	git -C raist pull origin
	git -C aeron pull origin
	git -C aekv pull origin
	git -C sassrv pull origin
	git -C aerv pull origin
	git -C raids pull origin
	git -C capr pull origin
	git -C natsmd pull origin

.PHONY: status
status: dirs
	@if [ -n "`git -C raikv status --porcelain`" ] ; then echo "---> raikv <---"; git -C raikv status ; fi
	@if [ -n "`git -C libdecnumber status --porcelain`" ] ; then echo "---> libdecnumber <---"; git -C libdecnumber status ; fi
	@if [ -n "`git -C raimd status --porcelain`" ] ; then echo "---> raimd <---"; git -C raimd status ; fi
	@if [ -n "`git -C linecook status --porcelain`" ] ; then echo "---> linecook <---"; git -C linecook status ; fi
	@if [ -n "`git -C rdbparser status --porcelain`" ] ; then echo "---> rdbparser <---"; git -C rdbparser status ; fi
	@if [ -n "`git -C h3 status --porcelain`" ] ; then echo "---> h3 <---"; git -C h3 status ; fi
	@if [ -n "`git -C raist status --porcelain`" ] ; then echo "---> raist <---"; git -C raist status ; fi
	@if [ -n "`git -C aeron status --porcelain`" ] ; then echo "---> aeron <---"; git -C aeron status ; fi
	@if [ -n "`git -C aekv status --porcelain`" ] ; then echo "---> aekv <---"; git -C aekv status ; fi
	@if [ -n "`git -C sassrv status --porcelain`" ] ; then echo "---> sassrv <---"; git -C sassrv status ; fi
	@if [ -n "`git -C aerv status --porcelain`" ] ; then echo "---> aerv <---"; git -C aerv status ; fi
	@if [ -n "`git -C raids status --porcelain`" ] ; then echo "---> raids <---"; git -C raids status ; fi
	@if [ -n "`git -C capr status --porcelain`" ] ; then echo "---> capr <---"; git -C capr status ; fi
	@if [ -n "`git -C natsmd status --porcelain`" ] ; then echo "---> natsmd <---"; git -C natsmd status ; fi

.PHONY: update_submodules
update_submodules: dirs
	git -C aekv update-index --cacheinfo 160000 `git -C raikv rev-parse HEAD` raikv
	git -C aekv update-index --cacheinfo 160000 `git -C aeron rev-parse rai` aeron
	git -C aeron update-index --cacheinfo 160000 `git -C HdrHistogram_c rev-parse rai` HdrHistogram_c
	git -C aerv update-index --cacheinfo 160000 `git -C sassrv rev-parse HEAD` sassrv
	git -C aerv update-index --cacheinfo 160000 `git -C aekv rev-parse HEAD` aekv
	git -C capr update-index --cacheinfo 160000 `git -C raikv rev-parse HEAD` raikv
	git -C capr update-index --cacheinfo 160000 `git -C raimd rev-parse HEAD` raimd
	git -C natsmd update-index --cacheinfo 160000 `git -C raikv rev-parse HEAD` raikv
	git -C natsmd update-index --cacheinfo 160000 `git -C raimd rev-parse HEAD` raimd
	git -C raids update-index --cacheinfo 160000 `git -C raikv rev-parse HEAD` raikv
	git -C raids update-index --cacheinfo 160000 `git -C h3 rev-parse HEAD` h3
	git -C raids update-index --cacheinfo 160000 `git -C linecook rev-parse HEAD` linecook
	git -C raids update-index --cacheinfo 160000 `git -C raimd rev-parse HEAD` raimd
	git -C raids update-index --cacheinfo 160000 `git -C rdbparser rev-parse HEAD` rdbparser
	git -C raimd update-index --cacheinfo 160000 `git -C libdecnumber rev-parse HEAD` libdecnumber
	git -C raist update-index --cacheinfo 160000 `git -C raimd rev-parse HEAD` raimd
	git -C raist update-index --cacheinfo 160000 `git -C raikv rev-parse HEAD` raikv
	git -C sassrv update-index --cacheinfo 160000 `git -C raikv rev-parse HEAD` raikv
	git -C sassrv update-index --cacheinfo 160000 `git -C raimd rev-parse HEAD` raimd

.PHONY: bump
bump: dirs
	if [ -n "`git -C raikv status --porcelain`" ] ; then sh ./script/bump.sh raikv/.copr/Makefile build_num ; fi
	if [ -n "`git -C libdecnumber status --porcelain`" ] ; then sh ./script/bump.sh libdecnumber/.copr/Makefile build_num ; fi
	if [ -n "`git -C raimd status --porcelain`" ] ; then sh ./script/bump.sh raimd/.copr/Makefile build_num ; fi
	if [ -n "`git -C linecook status --porcelain`" ] ; then sh ./script/bump.sh linecook/.copr/Makefile build_num ; fi
	if [ -n "`git -C rdbparser status --porcelain`" ] ; then sh ./script/bump.sh rdbparser/.copr/Makefile build_num ; fi
	if [ -n "`git -C h3 status --porcelain`" ] ; then sh ./script/bump.sh h3/.copr/Makefile build_num ; fi
	if [ -n "`git -C raist status --porcelain`" ] ; then sh ./script/bump.sh raist/.copr/Makefile build_num ; fi
	if [ -n "`git -C aeron status --porcelain`" ] ; then sh ./script/bump.sh aeron/.copr/Makefile build_num ; fi
	if [ -n "`git -C aekv status --porcelain`" ] ; then sh ./script/bump.sh aekv/.copr/Makefile build_num ; fi
	if [ -n "`git -C sassrv status --porcelain`" ] ; then sh ./script/bump.sh sassrv/.copr/Makefile build_num ; fi
	if [ -n "`git -C aerv status --porcelain`" ] ; then sh ./script/bump.sh aerv/.copr/Makefile build_num ; fi
	if [ -n "`git -C raids status --porcelain`" ] ; then sh ./script/bump.sh raids/.copr/Makefile build_num ; fi
	if [ -n "`git -C capr status --porcelain`" ] ; then sh ./script/bump.sh capr/.copr/Makefile build_num ; fi
	if [ -n "`git -C natsmd status --porcelain`" ] ; then sh ./script/bump.sh natsmd/.copr/Makefile build_num ; fi

.PHONY: commit
commit: dirs
	if [ -n "`git -C raikv status --porcelain`" ] ; then git -C raikv commit -a ; fi
	if [ -n "`git -C libdecnumber status --porcelain`" ] ; then git -C libdecnumber commit -a ; fi
	if [ -n "`git -C raimd status --porcelain`" ] ; then git -C raimd commit -a ; fi
	if [ -n "`git -C linecook status --porcelain`" ] ; then git -C linecook commit -a ; fi
	if [ -n "`git -C rdbparser status --porcelain`" ] ; then git -C rdbparser commit -a ; fi
	if [ -n "`git -C h3 status --porcelain`" ] ; then git -C h3 commit -a ; fi
	if [ -n "`git -C raist status --porcelain`" ] ; then git -C raist commit -a ; fi
	if [ -n "`git -C aeron status --porcelain`" ] ; then git -C aeron commit -a ; fi
	if [ -n "`git -C aekv status --porcelain`" ] ; then git -C aekv commit -a ; fi
	if [ -n "`git -C sassrv status --porcelain`" ] ; then git -C sassrv commit -a ; fi
	if [ -n "`git -C aerv status --porcelain`" ] ; then git -C aerv commit -a ; fi
	if [ -n "`git -C raids status --porcelain`" ] ; then git -C raids commit -a ; fi
	if [ -n "`git -C capr status --porcelain`" ] ; then git -C capr commit -a ; fi
	if [ -n "`git -C natsmd status --porcelain`" ] ; then git -C natsmd commit -a ; fi

.PHONY: clean
clean:
	rm -r -f raikv
	rm -r -f libdecnumber
	rm -r -f raimd
	rm -r -f linecook
	rm -r -f rdbparser
	rm -r -f h3
	rm -r -f raist
	rm -r -f HdrHistogram_c
	rm -r -f aeron
	rm -r -f aekv
	rm -r -f sassrv
	rm -r -f aerv
	rm -r -f raids
	rm -r -f capr
	rm -r -f natsmd
	rm -r -f benchmark

links:
	rmdir aekv/raikv
	ln -s -f ../raikv aekv/raikv
	rmdir aekv/aeron
	ln -s -f ../aeron aekv/aeron
	rmdir aeron/HdrHistogram_c
	ln -s -f ../HdrHistogram_c aeron/HdrHistogram_c
	rmdir aerv/sassrv
	ln -s -f ../sassrv aerv/sassrv
	rmdir aerv/aekv
	ln -s -f ../aekv aerv/aekv
	rmdir capr/raikv
	ln -s -f ../raikv capr/raikv
	rmdir capr/raimd
	ln -s -f ../raimd capr/raimd
	rmdir HdrHistogram_c/test/vendor/google/benchmark
	ln -s -f ../../../../benchmark HdrHistogram_c/test/vendor/google/benchmark
	rmdir natsmd/raikv
	ln -s -f ../raikv natsmd/raikv
	rmdir natsmd/raimd
	ln -s -f ../raimd natsmd/raimd
	rmdir raids/raikv
	ln -s -f ../raikv raids/raikv
	rmdir raids/h3
	ln -s -f ../h3 raids/h3
	rmdir raids/linecook
	ln -s -f ../linecook raids/linecook
	rmdir raids/raimd
	ln -s -f ../raimd raids/raimd
	rmdir raids/rdbparser
	ln -s -f ../rdbparser raids/rdbparser
	rmdir raimd/libdecnumber
	ln -s -f ../libdecnumber raimd/libdecnumber
	rmdir raist/raikv
	ln -s -f ../raikv raist/raikv
	rmdir raist/raimd
	ln -s -f ../raimd raist/raimd
	rmdir sassrv/raikv
	ln -s -f ../raikv sassrv/raikv
	rmdir sassrv/raimd
	ln -s -f ../raimd sassrv/raimd
	rm -f dirs
	touch links

dirs:
	rm -f aekv/raikv
	mkdir aekv/raikv
	rm -f aekv/aeron
	mkdir aekv/aeron
	rm -f aeron/HdrHistogram_c
	mkdir aeron/HdrHistogram_c
	rm -f aerv/sassrv
	mkdir aerv/sassrv
	rm -f aerv/aekv
	mkdir aerv/aekv
	rm -f capr/raikv
	mkdir capr/raikv
	rm -f capr/raimd
	mkdir capr/raimd
	rm -f HdrHistogram_c/test/vendor/google/benchmark
	mkdir HdrHistogram_c/test/vendor/google/benchmark
	rm -f natsmd/raikv
	mkdir natsmd/raikv
	rm -f natsmd/raimd
	mkdir natsmd/raimd
	rm -f raids/raikv
	mkdir raids/raikv
	rm -f raids/h3
	mkdir raids/h3
	rm -f raids/linecook
	mkdir raids/linecook
	rm -f raids/raimd
	mkdir raids/raimd
	rm -f raids/rdbparser
	mkdir raids/rdbparser
	rm -f raimd/libdecnumber
	mkdir raimd/libdecnumber
	rm -f raist/raimd
	mkdir raist/raimd
	rm -f raist/raikv
	mkdir raist/raikv
	rm -f sassrv/raikv
	mkdir sassrv/raikv
	rm -f sassrv/raimd
	mkdir sassrv/raimd
	rm -f links
	touch dirs

