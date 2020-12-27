#!/bin/bash --posix


PERFIX=<project prefix>

if [[ ! -d "${PERFIX}/build/bin" ]]; then
	mkdir -p ${PERFIX}/build/bin
	cd ${PERFIX}/build/bin
else
	cd ${PERFIX}/build/bin
fi
if [ -e ${BIN}  ];then
	rm ${BIN}
fi
cd ${PERFIX}/build/
rm -r *
cmake  ../
make -j $(grep -c ^processor /proc/cpuinfo 2>/dev/null)
 # running commands